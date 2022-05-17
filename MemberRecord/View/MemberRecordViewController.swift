//
//  MyRecordViewController.swift
//  jaksim_ios
//
//  Created by Apple on 2022/03/17.
//

import UIKit
import RxSwift
import RxCocoa

class MemberRecordViewController: UIViewController {
    
    @IBOutlet weak var meetingListCollectionView: UICollectionView!
    @IBOutlet weak var yearMonthLabel: UILabel!
    @IBOutlet weak var prevMonthButton: UIButton!
    @IBOutlet weak var nextMonthButton: UIButton!
    @IBOutlet weak var calendarCollectionView: UICollectionView!
    @IBOutlet weak var cheerButtonView: UIView!
    
    @IBOutlet weak var cheerImageView: UIImageView!
    @IBOutlet weak var cheerLabel: UILabel!
    @IBOutlet weak var reportButtonView: UIView!
    @IBOutlet weak var reportImageView: UIImageView!
    @IBOutlet weak var reportLabel: UILabel!
    var coverView :UIView?
    
    //MARK:- 캘린더을 위한 변수
    let now = Date()
    var cal = Calendar.current
    let dateFormatter = DateFormatter()
    var components = DateComponents()
    var weeks: [String] = ["일", "월", "화", "수", "목", "금", "토"]
    var days: [String] = []
    var daysCountInMonth = 0
    var weekdayAdding = 0
    
    let meetingListViewModel = MeetingListViewModel()
    let recordListViewModel = RecordListViewModel()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:- 날짜 클릭 시 나타나게될 어두운 배경 뷰
        coverView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        coverView?.backgroundColor = UIColor.clear
        
        
        //MARK:- 참여중인 모임 컬렉션 뷰
        //meetingListCollectionView.dataSource = self
        meetingListCollectionView.delegate = self
        meetingListCollectionView.register(UINib(nibName: K.MemberRecord.Name.MeetingListCollectionViewCelNibName, bundle: nil), forCellWithReuseIdentifier: K.MemberRecord.Id.MeetingListCollectionViewCellId)
        let backgroundImageView : UIImageView = {
            let imageView = UIImageView()
            imageView.image = K.Image.Background
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()
        meetingListCollectionView.backgroundView = backgroundImageView
        
//        meetingListViewModel.meetingListSubject
//            .observe(on: MainScheduler.instance)
//            .bind(to: meetingListCollectionView.rx.items(cellIdentifier: K.MemberRecord.Id.MeetingListCollectionViewCellId, cellType: MeetingListCollectionViewCell.self)) { index, item, cell in
//
//                cell.meetingNameLabel.text = item.name
//                cell.progressValue = Double(item.progress)
//                cell.updateProgress()
//            }
//            .disposed(by: disposeBag)
        
        
        //MARK:- 캘린더 컬렉션 뷰
        self.calendarCollectionView.dataSource = self
        self.calendarCollectionView.delegate = self
        self.calendarCollectionView.register(UINib(nibName: K.MemberRecord.Name.CalendarCollectionViewCellNibName, bundle: nil), forCellWithReuseIdentifier: K.MemberRecord.Id.CalendarCollectionViewCellId)
        self.initView()
        
//        recordListViewModel.recordListSubject
//            .observe(on: MainScheduler.instance)
//            .bind(to: calendarCollectionView.rx.items(cellIdentifier: K.MemberRecord.Id.CalendarCollectionViewCellId, cellType: CalendarCollectionViewCell.self)) { index, item, cell in
//
////                cell.meetingNameLabel.text = item.name
////                cell.progressValue = Double(item.progress)
////                cell.updateProgress()
//            }
//            .disposed(by: disposeBag)
        
        //MARK:- 이전 달, 다음 달 버튼
        prevMonthButton.setImage(K.Image.PrevIcon, for: .normal)
        prevMonthButton.tintColor = K.Color.Black66
        
        nextMonthButton.setImage(K.Image.NextIcon, for: .normal)
        nextMonthButton.tintColor = K.Color.Black66

        //MARK:- 응원하기 버튼
        
        //MARK:- 신고하기 버튼
        
    }
    //MARK:- 날짜 클릭 시 배경 어둡게 만들기
    func addCoverView() {
        UIView.transition(with: self.coverView!, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.coverView?.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.4)
        }, completion: nil)
    }
    
    //MARK:- 캘린더 컬렉션 뷰 초기 세팅
    private func initView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        calendarCollectionView.setCollectionViewLayout(layout, animated: true)
        
        dateFormatter.dateFormat = "yyyy년 M월"
        components.year = cal.component(.year, from: now)
        components.month = cal.component(.month, from: now)
        components.day = 1
        self.calculation()
    }
    
    //MARK:- 캘린더 계산 함수
    private func calculation() {
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
    }
    
    //MARK:- 달력 이전 달 버튼 클릭 시 액션
    @IBAction func prevMonthButtonDidTap(_ sender: UIButton) {
        
        components.month = components.month! - 1
        self.calculation()
        self.calendarCollectionView.reloadData()
    }
    //MARK:- 달력 다음 달 버튼 클릭 시 액션
    @IBAction func nextMonthButtonDidTap(_ sender: UIButton) {
        
        components.month = components.month! + 1
        self.calculation()
        self.calendarCollectionView.reloadData()
    }
    
    //MARK:- 응원하기 버튼 클릭 시 액션
    @IBAction func cheerButtonDidTap(_ sender: UIButton) {
    }
    //MARK:- 신고하기 버튼 클릭 시 액션
    @IBAction func reportButtonDidTap(_ sender: UIButton) {
    }
    
}

//MARK:- CollectionView Delegate
extension MemberRecordViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == calendarCollectionView {
            return 2
        }
        else { return 1 }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
//        if collectionView == meetingListCollectionView{
//            return meetingList.count
//        }
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
        
//        if collectionView == meetingListCollectionView{
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.MyRecord.Id.MeetingListCollectionViewCellId, for: indexPath) as? MeetingListCollectionViewCell else {
//                return UICollectionViewCell()
//            }
//            
//            cell.meetingNameLabel.text = meetingList[indexPath.row]
//            
//            return cell
//        }
        if collectionView == calendarCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.MemberRecord.Id.CalendarCollectionViewCellId, for: indexPath) as! CalendarCollectionViewCell
            
            switch indexPath.section {
            case 0:
                cell.dateLabel.text = weeks[indexPath.row]
                cell.progressView.backgroundColor = .none
                cell.imageView = .none
            default:
                cell.dateLabel.text = days[indexPath.row]
                cell.progressView.backgroundColor = .systemPink
                cell.year = components.year
                cell.month = components.month
                if days[indexPath.row] == "" {
                    cell.day = -1
                }
                else {
                    cell.day = Int(days[indexPath.row])!
                }
            }
            
            return cell
        }
        else {
            print("CollectionView Delegate error - 셀 뷰")
            return UICollectionViewCell()
        }
        
        
    }
    
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == meetingListCollectionView{
            return 12
        }
        else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == calendarCollectionView {
            
            switch indexPath.section {
            case 0:
                return
            default:
                if days[indexPath.row] == "" {
                    return
                }
                else {
                    print(components.year ?? "year 출력 오류")
                    print(components.month ?? "month 출력 오류")
                    print(days[indexPath.row])
                    let recordDetailVC = RecordDetailViewController(nibName: K.MemberRecord.Name.RecordDetailViewControllerNibName, bundle: nil)
                    recordDetailVC.modalPresentationStyle = .overCurrentContext
                    
                    addCoverView()
                    self.view.addSubview(self.coverView!)
                    self.present(recordDetailVC, animated: true, completion: nil)
                }
            }
        }
    }

    
}
