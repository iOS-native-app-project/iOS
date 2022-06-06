//
//  MyRecordViewController.swift
//  jaksim_ios
//
//  Created by Apple on 2022/03/17.
//

import UIKit
import RxSwift
import RxCocoa

class MyRecordViewController: UIViewController {

    @IBOutlet weak var meetingListCollectionView: UICollectionView!
    @IBOutlet weak var yearMonthLabel: UILabel!
    @IBOutlet weak var prevMonthButton: UIButton!
    @IBOutlet weak var nextMonthButton: UIButton!
    @IBOutlet weak var calendarCollectionView: UICollectionView!
    @IBOutlet weak var progressInfoView: UIView!
    
    @IBOutlet weak var circle1View: UIView!
    @IBOutlet weak var circle2View: UIView!
    @IBOutlet weak var circle3View: UIView!
    @IBOutlet weak var circle4View: UIView!
    
    
    //MARK: - 캘린더을 위한 변수
    private let now = Date()
    private var cal = Calendar.current
    private let dateFormatter = DateFormatter()
    private var components = DateComponents()
    private var weeks: [String] = ["일", "월", "화", "수", "목", "금", "토"]
    private var days: [String] = []
    private var daysCountInMonth = 0
    private var weekdayAdding = 0
    
    private let attendedMeetingListViewModel = AttendedMeetingListViewModel()
    private var meetingList = [AttendedMeeting]()
    private var meetingIndex = 0
    private var meetingLoadCount = 0
    
    private let recordListViewModel = MyRecordListViewModel()
    private var recordList = [MyRecord]()
    private var recordIndex = 0
    
    private var progressList = [Int]()
    private var reloadFlag = true
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - 캘린더 컬렉션 뷰
        self.calendarCollectionView.dataSource = self
        self.calendarCollectionView.delegate = self
        self.calendarCollectionView.register(UINib(nibName: Constant.MyRecord.Name.CalendarCollectionViewCellNibName, bundle: nil), forCellWithReuseIdentifier: Constant.MyRecord.Id.CalendarCollectionViewCellId)
        self.initView()
        
        //MARK: - 참여중인 모임 컬렉션 뷰
        meetingListCollectionView.delegate = self
        meetingListCollectionView.register(UINib(nibName: Constant.MyRecord.Name.MyRecordMeetingListCollectionViewCelNibName, bundle: nil), forCellWithReuseIdentifier: Constant.MyRecord.Id.MyRecordMeetingListCollectionViewCellId)
        let backgroundImageView : UIImageView = {
            let imageView = UIImageView()
            imageView.image = Constant.Image.Background
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()
        meetingListCollectionView.backgroundView = backgroundImageView
        
        //paging 스크롤을 위한 레이아웃 세팅
        meetingListCollectionView.decelerationRate = .fast
        meetingListCollectionView.isPagingEnabled = false
        let meetingCollectionViewLayout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 335, height: 98)
            layout.minimumLineSpacing = (self.view.bounds.width - 335.0) / 2.0 - 5
            layout.sectionInset = UIEdgeInsets(top: 0, left: (self.view.bounds.width - 335.0) / 2.0, bottom: 0, right: (self.view.bounds.width - 335.0) / 2.0)
            layout.scrollDirection = .horizontal
            return layout
        }()
        meetingListCollectionView.setCollectionViewLayout(meetingCollectionViewLayout, animated: true)
        
        //참여중인 모임 api binding
        attendedMeetingListViewModel.meetingListSubject
            .observe(on: MainScheduler.instance)
            .do(onNext: { list in
                self.meetingList = list
                self.progressList = Array(repeating: 0, count: self.meetingList.count)
                self.calculation()
            })
            .bind(to: meetingListCollectionView.rx.items(cellIdentifier: Constant.MyRecord.Id.MyRecordMeetingListCollectionViewCellId, cellType: MyRecordMeetingListCollectionViewCell.self)) { index, item, cell in
                
                cell.meetingNameLabel.text = item.name
                
                //달성률 데이터를 다 가져오면 정상적인 달성률 값이 들어감
                cell.progressValue = Double(self.progressList[index])
                
                //달성률 데이터를 다 가져오면 progressBar view 업데이트
                if !self.reloadFlag{
                    cell.setProgressBar()
                }
                
                //참여중인 모임을 가져온 후 달성률 api 호출
                if self.reloadFlag {
                    self.reloadFlag = false
                    self.getProgress()
                }
            }
            .disposed(by: disposeBag)
        
        //MARK: - 나의 기록(1달 단위) api binding
        recordListViewModel.recordListSubject
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { recordList in
                self.recordList = recordList
                
                //기록 가져온 후 progress View 세팅을 위한 reloadData
                self.calendarCollectionView.reloadData()
            })
            .disposed(by: disposeBag)
        
        //MARK: - 이전 달, 다음 달 버튼
        prevMonthButton.setImage(Constant.Image.PrevIcon, for: .normal)
        prevMonthButton.tintColor = Constant.Color.Black66
        
        nextMonthButton.setImage(Constant.Image.NextIcon, for: .normal)
        nextMonthButton.tintColor = Constant.Color.Black66
        
        //MARK: - 진행률 정보 뷰
        progressInfoView.backgroundColor = Constant.Color.Gray250
        progressInfoView.layer.cornerRadius = 4
        
        circle1View.layer.cornerRadius = circle1View.bounds.height/2
        circle2View.layer.cornerRadius = circle2View.bounds.height/2
        circle3View.layer.cornerRadius = circle3View.bounds.height/2
        circle4View.layer.cornerRadius = circle4View.bounds.height/2
        
        circle1View.backgroundColor = Constant.Color.Puple1
        circle2View.backgroundColor = Constant.Color.Puple2
        circle3View.backgroundColor = Constant.Color.Puple3
        circle4View.backgroundColor = Constant.Color.MainPuple
        
    }
    
    //MARK: - 캘린더 컬렉션 뷰 초기 세팅
    private func initView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        calendarCollectionView.setCollectionViewLayout(layout, animated: true)
        
        dateFormatter.dateFormat = "yyyy년 M월"
        components.year = cal.component(.year, from: now)
        components.month = cal.component(.month, from: now)
        components.day = 1
    }
    
    //MARK: - 캘린더 계산 함수
    private func calculation(){
        let firstDayOfMonth = cal.date(from: components)
        let firstWeekday = cal.component(.weekday, from: firstDayOfMonth!)
        daysCountInMonth = cal.range(of: .day, in: .month, for: firstDayOfMonth!)!.count
        weekdayAdding = 2 - firstWeekday
        
        self.yearMonthLabel.text = dateFormatter.string(from: firstDayOfMonth!)
        
        self.days.removeAll()
        for day in weekdayAdding...daysCountInMonth {
            if day < 1 {
                self.days.append("")
            } else {
                self.days.append(String(day))
            }
        }
    
        //캘린더 세팅 후 meeting id를 통해 나의 기록 api 요청
        if meetingList.count > 0 {
            self.recordList.removeAll()
            self.recordIndex = 0
            self.getRecord(meetingId: meetingIndex+1, year: components.year!, month: components.month!)
        }
    }
    
    //MARK: - 달력 이전 달 버튼 클릭 시 액션
    @IBAction func prevMonthButtonDidTap(_ sender: UIButton) {
        
        components.month = components.month! - 1
        self.calculation()
        self.calendarCollectionView.reloadData()
    }
    //MARK: - 달력 다음 달 버튼 클릭 시 액션
    @IBAction func nextMonthButtonDidTap(_ sender: UIButton) {
        
        components.month = components.month! + 1
        self.calculation()
        self.calendarCollectionView.reloadData()
    }
    
    
    //MARK: - 참여중인 모임 리스트의 달성률 업데이트 -> 참여중인 모임을 모두 가져온 후 호출된다.
    private func getProgress() {
        //달성률 api를 참여중인 모임 개수만큼 호출
        for (index, meeting) in meetingList.enumerated() {
            let rateViewModel = MyRateViewModel()
            let meetingId = meeting.meetingId
            rateViewModel.updateMeetingId(meetingId: String(meetingId))
            rateViewModel.fetchProgress()
            rateViewModel.rateSubject
                .subscribe(onNext: { rate in
                    self.meetingLoadCount += 1
                    self.progressList[index] = rate.progress
                    
                    //참여중인 '마지막' 모임에 대한 달성률 가져왔을 때 reloadData
                    if self.meetingLoadCount == self.meetingList.count {
                        self.meetingListCollectionView.reloadData()
                    }
                })
                .disposed(by: disposeBag)
        }
    }
    
    //MARK: - api를 통해 기록 요청
    private func getRecord(meetingId: Int, year: Int, month: Int){
        recordListViewModel.fetchRecord(meetingId: meetingId, year: year, month: month)
    }
}

//MARK: - CollectionView Delegate
extension MyRecordViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - 컬렉션뷰 섹션 수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == calendarCollectionView {
            return 2
        }
        else { return 1 }
    }
    
    //MARK: - 컬렉션뷰 섹션 당 셀개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == calendarCollectionView {
            switch section {
            case 0:
                return 7
            default:
                return self.days.count
            }
        }
        else {
            print("CollectionView Delegate error - 셀 개수")
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //MARK: - 캘린더 컬렉션뷰 셀 dataSoruce
        if collectionView == calendarCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.MyRecord.Id.CalendarCollectionViewCellId, for: indexPath) as! CalendarCollectionViewCell
            
            switch indexPath.section {
            case 0:
                cell.dateLabel.text = weeks[indexPath.row]
                cell.imageView = .none
                cell.progressView.backgroundColor = .none
            default:
                cell.progressView.backgroundColor = .none
                cell.dateLabel.text = days[indexPath.row]
                cell.year = components.year
                cell.month = components.month
                if days[indexPath.row] == "" {
                    cell.day = -1
                }
                else {
                    cell.day = Int(days[indexPath.row])!
                    cell.backgroundColor = .none
                    
                    //기록데이터가 있으면 진행률에 따라 progress view 색칠하기
                    if self.recordIndex < self.recordList.count {
                        let record = self.recordList[recordIndex]
                        if record.day == Int(days[indexPath.row])! {
                            cell.progressView.backgroundColor = .systemPink
                            recordIndex += 1
                        }
                    }
                    //오늘 날짜에 점선 테두리 그리기
                    if cell.year == cal.component(.year, from: now)
                    && cell.month == cal.component(.month, from: now)
                    && cell.day == cal.component(.day, from: now) {
                        cell.borderLayer.strokeColor = UIColor.black.cgColor
                    }
                    else {
                        cell.borderLayer.strokeColor = .none
                    }
                }
            }
            
            return cell
        }
        else {
            print("CollectionView Delegate error - 셀 뷰")
            return UICollectionViewCell()
        }
        
        
    }
    
    //MARK: - 컬렉션뷰 셀 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == meetingListCollectionView{
            let width: CGFloat = 335
            let height: CGFloat = 98
            
            return CGSize(width: width, height: height)
        }
        else if collectionView == calendarCollectionView {
            let cellSize : CGFloat = collectionView.bounds.width/7
            return CGSize(width: cellSize, height: cellSize)
        }
        else {
            print("CollectionView Delegate error - 셀 사이즈")
            return CGSize(width: 0, height: 0)
        }
    }
    
    //MARK: - 컬렉션뷰 셀 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //MARK: - 캘린더 컬렉션뷰 셀 클릭 시 액션
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == calendarCollectionView {
            print(components.year ?? "year 출력 오류")
            print(components.month ?? "month 출력 오류")
            print(days[indexPath.row])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView == meetingListCollectionView {
            let cell = cell as! MyRecordMeetingListCollectionViewCell
            cell.setProgressBar()
        }
    }
}

//MARK: - 참여중인 모임 리스트 페이징 세팅(한 장 넘길 때마다 가운데 오도록)
extension MyRecordViewController: UIScrollViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard let layout = self.meetingListCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        let estimatedIndex = scrollView.contentOffset.x / cellWidthIncludingSpacing
        var index: Int
        if velocity.x > 0 {
            index = Int(ceil(estimatedIndex))
        } else if velocity.x < 0 {
            index = Int(floor(estimatedIndex))
        } else {
            index = Int(round(estimatedIndex))
        }
        if index < 0 { index = 0}
        if index >= meetingList.count { index = meetingList.count-1}
        
        targetContentOffset.pointee = CGPoint(x: CGFloat(index) * cellWidthIncludingSpacing, y: 0)
        
        self.meetingIndex = index
        self.calculation()
    }
}
