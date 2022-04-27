//
//  ViewController.swift
//  jaksim_ios
//
//  Created by Apple on 2022/02/21.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    
    //***개수 고정하고 스크롤 잠궈야함
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var meetingListCollectionView: UICollectionView!
    @IBOutlet weak var categoryListCollectionView: UICollectionView!
    @IBOutlet weak var recommendedMeetingListCollectionView: UICollectionView!
    
    @IBOutlet weak var sayingOfTodayTitleLabel: UILabel!
    @IBOutlet weak var sayingOfTodayLabel: UILabel!
    @IBOutlet weak var sayingOfTodayContaierView: UIView!
    
    @IBOutlet weak var recommendedMeetingTitleLabel: UILabel!
    @IBOutlet weak var recommendedMeetingShollAllButton: UIButton!
    
    private let meetingListViewModel = MeetingListViewModel()
    private var meetingListCount = 0
    
    private let recommandedMeetingListViewModel = RecommandedMeetingListViewModel()
    
    private let sayingOfTodayViewModel = SayingOfTodayViewModel()
    
    private var disposeBag = DisposeBag()
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            navigationController?.setNavigationBarHidden(true, animated: animated)
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:- 로고
        logoImageView.image = K.Image.Logo
        
        //MARK:- 알림
        notificationButton.layer.cornerRadius = notificationButton.bounds.height/2
        notificationButton.backgroundColor = K.Color.Gray245
        notificationButton.setImage(K.Image.NoficationIcon, for: .normal)
        notificationButton.tintColor = K.Color.Black66
        
        //MARK:- 참여중인 모임 리스트
        meetingListViewModel.meetingListSubject
            .observe(on: MainScheduler.instance)
            .do(onNext: { list in
                self.meetingListCount = list.count
            })
            .bind(to: meetingListCollectionView.rx.items(cellIdentifier: K.Home.Id.MeetingListCollectionViewCellId, cellType: MeetingListCollectionViewCell.self)) { index, item, cell in
                
                cell.nameLabel.text = item.name
                cell.dDayLabel.text = "D-\(item.dDay)"
                cell.progressValueLabel.text = "\(item.progess)%"
                cell.numberOfpeopleLabel.text = "참여중인 방 \(item.numberOfpeople)/\(self.meetingListCount)"
                
            }
            .disposed(by: disposeBag)
        
        meetingListCollectionView.delegate = self
        meetingListCollectionView.register(UINib(nibName: K.Home.Name.MeetingListCollectionViewCellXibName, bundle: nil), forCellWithReuseIdentifier: K.Home.Id.MeetingListCollectionViewCellId)
        
        //MARK:- 오늘의 한마디
        sayingOfTodayLabel.layer.shadowColor = UIColor.black.cgColor
        sayingOfTodayLabel.layer.shadowRadius = 5
        sayingOfTodayLabel.layer.masksToBounds = false
        sayingOfTodayLabel.layer.shadowOpacity = 0.1
        
        sayingOfTodayTitleLabel.textColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
        sayingOfTodayTitleLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 14)
        
        sayingOfTodayLabel.textColor = UIColor(red: 66/255.0, green: 66/255.0, blue: 66/255.0, alpha: 1)
        sayingOfTodayLabel.font = UIFont(name: K.FontName.SCDreamRegular, size: 16)
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
        
        //MARK:- 카테고리 리스트
        categoryListCollectionView.dataSource = self
        categoryListCollectionView.delegate = self
        categoryListCollectionView.register(UINib(nibName: K.Home.Name.CategoryListCollectionViewCellXibName, bundle: nil), forCellWithReuseIdentifier: K.Home.Id.CategoryListCollectionViewCellId)
        
        //MARK:- 추천모임 리스트
        recommandedMeetingListViewModel.recommandedMeetingListSubject
            .observe(on: MainScheduler.instance)
            .bind(to: recommendedMeetingListCollectionView.rx.items(cellIdentifier: K.Home.Id.RecommendedMeetingListCollectionViewCellId, cellType: RecommendedMeetingListCollectionViewCell.self)) { index, item, cell in
                
                cell.meetingNameLabel.text = item.name
                cell.introductionLabel.text = item.introduction
                cell.numberOfPeopleLabel.text = "\(item.numberOfpeople)"
                
            }
            .disposed(by: disposeBag)
        
        recommendedMeetingTitleLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 16)
        recommendedMeetingTitleLabel.textColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
        recommendedMeetingShollAllButton.titleLabel!.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        recommendedMeetingShollAllButton.setTitleColor(UIColor(red: 117/255.0, green: 117/255.0, blue: 117/255.0, alpha: 1), for: .normal)
       
        recommendedMeetingListCollectionView.delegate = self
        recommendedMeetingListCollectionView.register(UINib(nibName: K.Home.Name.RecommendedMeetingListCollectionViewCellXibName, bundle: nil), forCellWithReuseIdentifier: K.Home.Id.RecommendedMeetingListCollectionViewCellId)
    }
}

//MARK:- CollectionView Delegate
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if collectionView == categoryListCollectionView{
            return K.Home.Text.CategoryList.count
        }
        else {
            print("CollectionView Delegate error - 셀 개수")
            return 0
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == categoryListCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Home.Id.CategoryListCollectionViewCellId, for: indexPath) as? CategoryListCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.cateoryNameLabel.text = K.Home.Text.CategoryList[indexPath.row]
            cell.categoryImageView.image = K.Image.CategoryImageList[indexPath.row]
            
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
