//
//  ViewController.swift
//  jaksim_ios
//
//  Created by Apple on 2022/02/21.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController, UITabBarControllerDelegate {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var notiVisitedMarkView: UIView!
    @IBOutlet weak var meetingListCollectionView: UICollectionView!
    @IBOutlet weak var categoryListCollectionView: UICollectionView!
    @IBOutlet weak var recommendedMeetingListCollectionView: UICollectionView!
    
    @IBOutlet weak var sayingOfTodayTitleLabel: UILabel!
    @IBOutlet weak var sayingOfTodayLabel: UILabel!
    @IBOutlet weak var sayingOfTodayContaierView: UIView!
    
    @IBOutlet weak var recommendedMeetingTitleLabel: UILabel!
    @IBOutlet weak var showAllButton: UIButton!
    
    private let meetingListViewModel = AttendedMeetingListViewModel()
    private var meetingList = [AttendedMeeting]()
    private var meetingListCount = 0
    private var meetingLoadCount = 0
    
    
    private var progressList = [Int]()
    private var progressFlag = true
    
    private let recommendedMeetingListViewModel = RecommendedMeetingListViewModel()
    private var recommendedMeetingList = [RecommendedMeeting]()
    private var recommendedMeetingListFlag = true
    private var imageSet = [Int: UIImage]()
    private var imageSetIndex = 0
    
    private let sayingOfTodayViewModel = SayingOfTodayViewModel()
    
    private var disposeBag = DisposeBag()
    
    //MARK: - 탭바 컨트롤러 세팅
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
        if let tabBarItems = self.tabBarController?.tabBar.items
        {
            tabBarItems[0].title = "홈"
            tabBarItems[1].title = "검색"
            tabBarItems[2].title = "기록"
            tabBarItems[3].title = "프로필"
            
            for tabBarItem in tabBarItems {
                tabBarItem.setTitleTextAttributes([NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue): UIFont(name: Constant.FontName.PretendardRegular, size: 11)!], for: .normal)
            }
        }
        
        self.tabBarController?.tabBar.items![0].image =  UIImage(named: "home_tabBar.png")?.withRenderingMode(.alwaysTemplate)
        self.tabBarController?.tabBar.items![1].image = UIImage(named: "search_tabBar.png")?.withRenderingMode(.alwaysTemplate)
        self.tabBarController?.tabBar.items![2].image = UIImage(named: "record_tabBar.png")?.withRenderingMode(.alwaysTemplate)
        self.tabBarController?.tabBar.items![3].image = UIImage(named: "profile_tabBar.png")?.withRenderingMode(.alwaysTemplate)
        
        self.tabBarController?.tabBar.tintColor = Constant.Color.MainPuple
        self.tabBarController?.tabBar.unselectedItemTintColor = Constant.Color.Gray158
        
        //MARK: - 화면에 나타날 때 마다 모임리스트 업데이트
        meetingListCollectionView.dataSource = nil
        meetingListViewModel.meetingListSubject
            .observe(on: MainScheduler.instance)
            .do(onNext: { list in
                self.meetingList = list
            })
                .bind(to: meetingListCollectionView.rx.items(cellIdentifier: Constant.Home.Id.MeetingListCollectionViewCellId, cellType: MeetingListCollectionViewCell.self)) { index, item, cell in
                    
                    cell.nameLabel.text = item.name
                    cell.dDayLabel.text = "디데이 업데이트 필요"
                    cell.numberOfpeopleLabel.text = "참여중인 방 \(index+1)/\(self.meetingListCount)"
                    
                    //달성률 데이터를 다 가져오면 정상적인 달성률 값이 들어감
                    cell.progressValueLabel.text = "\(self.progressList[index])%"
                    
                    //달성률 데이터를 다 가져오면 정상적인 달성률 값이 들어감
                    cell.progressValue = Double(self.progressList[index])
                    
                    //달성률 데이터를 다 가져오면 progressBar view 업데이트
                    if !self.progressFlag{
                        cell.setProgressBar()
                    }
                    
                    if self.progressFlag {
                        self.progressFlag = false
                        self.getProgress()
                    }
                }
                .disposed(by: disposeBag)
        
        meetingListViewModel.updateMeetingList()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.tabBarController?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - 로고
        logoImageView.image = Constant.Image.HomeLogo
        
        //MARK: - 알림
        notificationButton.layer.cornerRadius = notificationButton.bounds.height/2
        notificationButton.backgroundColor = Constant.Color.Gray245
        notificationButton.setImage(Constant.Image.NoficationIcon, for: .normal)
        notificationButton.tintColor = Constant.Color.Black66
        
        notiVisitedMarkView.layer.cornerRadius = notiVisitedMarkView.bounds.height/2
        notiVisitedMarkView.backgroundColor = Constant.Color.MainPuple
        
        //MARK: - 참여중인 모임 리스트
        meetingListViewModel.meetingListSubject
            .observe(on: MainScheduler.instance)
            .do(onNext: { list in
                self.meetingList = list
                self.meetingListCount = list.count
                self.progressList = Array(repeating: 0, count: self.meetingListCount)
            })
            .bind(to: meetingListCollectionView.rx.items(cellIdentifier: Constant.Home.Id.MeetingListCollectionViewCellId, cellType: MeetingListCollectionViewCell.self)) { index, item, cell in
                
                cell.nameLabel.text = item.name
                cell.dDayLabel.text = "디데이 업데이트 필요"
                cell.numberOfpeopleLabel.text = "참여중인 방 \(index+1)/\(self.meetingListCount)"
                
                //달성률 데이터를 다 가져오면 정상적인 달성률 값이 들어감
                cell.progressValueLabel.text = "\(self.progressList[index])%"
                
                //달성률 데이터를 다 가져오면 정상적인 달성률 값이 들어감
                cell.progressValue = Double(self.progressList[index])
                
                //달성률 데이터를 다 가져오면 progressBar view 업데이트
                if !self.progressFlag{
                    cell.setProgressBar()
                }
                
                if self.progressFlag {
                    self.progressFlag = false
                    self.getProgress()
                }
            }
            .disposed(by: disposeBag)
        
        meetingListCollectionView.delegate = self
        meetingListCollectionView.register(UINib(nibName: Constant.Home.Name.MeetingListCollectionViewCellXibName, bundle: nil), forCellWithReuseIdentifier: Constant.Home.Id.MeetingListCollectionViewCellId)
        
        //MARK: - 오늘의 한마디
        sayingOfTodayLabel.layer.shadowColor = UIColor.black.cgColor
        sayingOfTodayLabel.layer.shadowRadius = 5
        sayingOfTodayLabel.layer.masksToBounds = false
        sayingOfTodayLabel.layer.shadowOpacity = 0.1
        
        sayingOfTodayTitleLabel.textColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
        sayingOfTodayTitleLabel.font = UIFont(name: Constant.FontName.PretendardSemiBold, size: 14)
        
        sayingOfTodayLabel.textColor = UIColor(red: 66/255.0, green: 66/255.0, blue: 66/255.0, alpha: 1)
        sayingOfTodayLabel.font = UIFont(name: Constant.FontName.SCDream4Regular, size: 16)
        sayingOfTodayLabel.numberOfLines = 0
        
        sayingOfTodayContaierView.layer.cornerRadius = 12
        sayingOfTodayContaierView.layer.shadowOpacity = 0.08
        sayingOfTodayContaierView.layer.shadowOffset = CGSize(width: 0, height: 0)
        sayingOfTodayContaierView.layer.shadowRadius = 12
        sayingOfTodayContaierView.layer.masksToBounds = false
        
        sayingOfTodayViewModel.sayingOfTodaySubject
            .subscribe(onNext: { item in
                self.sayingOfTodayLabel.text = item.sayingOfToday
            })
            .disposed(by: disposeBag)
        
        //MARK: - 카테고리 리스트
        categoryListCollectionView.dataSource = self
        categoryListCollectionView.delegate = self
        categoryListCollectionView.register(UINib(nibName: Constant.Home.Name.CategoryListCollectionViewCellXibName, bundle: nil), forCellWithReuseIdentifier: Constant.Home.Id.CategoryListCollectionViewCellId)
        
        //MARK: - 추천모임 리스트
        
        recommendedMeetingListViewModel.recommendedMeetingListSubject
            .observe(on: MainScheduler.instance)
            .do(onNext: { list in
                self.recommendedMeetingList = list
            })
            .bind(to: recommendedMeetingListCollectionView.rx.items(cellIdentifier: Constant.Home.Id.RecommendedMeetingListCollectionViewCellId, cellType: RecommendedMeetingListCollectionViewCell.self)) { index, item, cell in
                
                cell.meetingNameLabel.text = item.name
                cell.numberOfPeopleLabel.text = String(item.numberOfpeople)
                cell.descriptLabel.text = item.descript
            
                if self.imageSet.count > self.imageSetIndex {
                    
                    cell.meetingImageView.image = self.imageSet[self.imageSetIndex]
                    self.imageSetIndex += 1
                }
                cell.numberOfPeopleLabel.text = "\(item.numberOfpeople)"
                
                if index == self.recommendedMeetingList.count - 1 && self.recommendedMeetingListFlag{
                    self.recommendedMeetingListFlag = false
                    self.fetchImages()
                }
            }
            .disposed(by: disposeBag)
        
        recommendedMeetingTitleLabel.font = UIFont(name: Constant.FontName.PretendardSemiBold, size: 16)
        recommendedMeetingTitleLabel.textColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
        showAllButton.titleLabel!.font = UIFont(name: Constant.FontName.PretendardRegular, size: 14)
        showAllButton.setTitleColor(UIColor(red: 117/255.0, green: 117/255.0, blue: 117/255.0, alpha: 1), for: .normal)
        
        recommendedMeetingListCollectionView.delegate = self
        recommendedMeetingListCollectionView.register(UINib(nibName: Constant.Home.Name.RecommendedMeetingListCollectionViewCellXibName, bundle: nil), forCellWithReuseIdentifier: Constant.Home.Id.RecommendedMeetingListCollectionViewCellId)
        
        
    }
    
    
    //MARK: - 참여중인 모임 리스트의 달성률 업데이트 -> 참여중인 모임을 모두 가져온 후 호출된다.
    private func getProgress() {
        //달성률 api를 참여중인 모임 개수만큼 호출
        for (index, meeting) in meetingList.enumerated() {
            let rateViewModel = RateViewModel()
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
    
    //MARK: - 전체보기 버튼 클릭 시
    @IBAction func showAllButtonDidTap(_ sender: UIButton) {
        self.tabBarController?.selectedIndex = 1
    }
    
    //MARK: - 추천모임 이미지 가져오기
    private func fetchImages() {
        let storage = FBStorage()
        for (i,recommendedMeeting) in recommendedMeetingList.enumerated() {
            if recommendedMeeting.image != "" && recommendedMeeting.image != nil {
                
                let _ = storage.downLoadImage(path: recommendedMeeting.image!) {
                    self.imageSet[i] = storage.downloadImage!
                    
                    if i == self.recommendedMeetingList.count-1 {
                        self.recommendedMeetingListCollectionView.reloadData()
                    }
                }
            }
            else {
                self.imageSet[i] = UIImage()
                
                if i == self.recommendedMeetingList.count-1 {
                    self.recommendedMeetingListCollectionView.reloadData()
                }
            }
        }
    }
}

//MARK: - CollectionView Delegate
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == categoryListCollectionView{
            return Constant.Home.Text.CategoryList.count
        }
        else {
            print("CollectionView Delegate error - 셀 개수")
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == categoryListCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.Home.Id.CategoryListCollectionViewCellId, for: indexPath) as? CategoryListCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.cateoryNameLabel.text = Constant.Home.Text.CategoryList[indexPath.row]
            cell.categoryImageView.image = Constant.Image.CategoryImageList[indexPath.row]
            
            return cell
        }
        else {
            print("CollectionView Delegate error - 셀 뷰")
            return UICollectionViewCell()
        }
        
        
    }
    
    // 터치업 액션
    //    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //        let playerStoryboard = UIStoryboard.init(name: "Player", bundle: nil)
    //        guard let playerVC = playerStoryboard.instantiateViewController(identifier: "PlayerViewController") as? PlayerViewController else { return }
    //        let item = trackManager.tracks[indexPath.item]
    //        playerVC.simplePlayer.replaceCurrentItem(with: item)
    //        present(playerVC, animated: true, completion: nil)
    //    }
    
    // 셀 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == meetingListCollectionView{
            let width: CGFloat = 335
            let height: CGFloat = 180
            
            return CGSize(width: width, height: height)
        }
        else if collectionView == categoryListCollectionView{
            let width: CGFloat = 69
            let height: CGFloat = 97
            
            return CGSize(width: width, height: height)
        }
        else if collectionView == recommendedMeetingListCollectionView{
            let width: CGFloat = 150
            let height: CGFloat = 220
            
            return CGSize(width: width, height: height)
        }
        else {
            print("CollectionView Delegate error - 셀 사이즈")
            return CGSize(width: 0, height: 0)
        }
    }
    
    // CollectionView Cell의 위아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == meetingListCollectionView{
            return 6
        }
        else if collectionView == categoryListCollectionView{
            return 16/2
        }
        else if collectionView == recommendedMeetingListCollectionView{
            return 20/2
        }
        else {
            print("CollectionView Delegate error - 셀 상하 간격")
            return 0
        }
    }
    
    // CollectionView Cell의 옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == meetingListCollectionView{
            return 12/2
        }
        else if collectionView == categoryListCollectionView{
            return 20/2
        }
        else if collectionView == recommendedMeetingListCollectionView{
            return 12/2
        }
        else {
            print("CollectionCiew Delegate error - 셀 좌우 간격  ")
            return 0
        }
    }
}
