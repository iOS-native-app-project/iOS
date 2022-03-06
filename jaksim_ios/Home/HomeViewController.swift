//
//  ViewController.swift
//  jaksim_ios
//
//  Created by Apple on 2022/02/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var MeetingListCollectionView: UICollectionView!
    @IBOutlet weak var CategoryListCollectionView: UICollectionView!
    @IBOutlet weak var RecommendedMeetingListCollectionView: UICollectionView!
    
    var meetingList: [String] =
        ["참여모임1", "참여모임2", "참여모임3", "참여모임4", "참여모임5", "참여모임6"]
    var categoryList: [String] =
        ["카테고리1", "카테고리2", "카테고리3", "카테고리4", "카테고리5"]
    var recommendedMeetingList: [String] =
        ["추천모임1", "추천모임2", "추천모임3", "추천모임4", "추천모임5", "추천모임6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MeetingListCollectionView.dataSource = self
        MeetingListCollectionView.delegate = self
        MeetingListCollectionView.register(UINib(nibName: K.meetingListCellId, bundle: nil), forCellWithReuseIdentifier: K.meetingListCellId)

        CategoryListCollectionView.dataSource = self
        CategoryListCollectionView.delegate = self

        RecommendedMeetingListCollectionView.dataSource = self
        RecommendedMeetingListCollectionView.delegate = self
        
    }


}

//MARK:- CollectionView Delegate
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // 셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == MeetingListCollectionView{
            return meetingList.count
        }
        else if collectionView == CategoryListCollectionView{
            return categoryList.count
        }
        else if collectionView == RecommendedMeetingListCollectionView{
            return recommendedMeetingList.count
        }
        else {
            print("CollectionView Delegate error - 셀 개수")
            return 0
        }
        
    }

    // 셀 뷰
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == MeetingListCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.meetingListCellId, for: indexPath) as? MeetingListCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.textField.text = meetingList[indexPath.row]
            
            //let item = trackManager.track(at: indexPath.item)
            //cell.updateUI(item: item)
            return cell
        }
        else if collectionView == CategoryListCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.categoryListCellId, for: indexPath) as? CategoryListCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.textField.text = categoryList[indexPath.row]
            
            return cell
        }
        else if collectionView == RecommendedMeetingListCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.recommendedMeetingListCellId, for: indexPath) as? RecommendedMeetingListCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.textField.text = recommendedMeetingList[indexPath.row]
            
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
        
        if collectionView == MeetingListCollectionView{
            let width: CGFloat = collectionView.bounds.width-30
            let height: CGFloat = collectionView.bounds.height
            
            return CGSize(width: width, height: height)
        }
        else if collectionView == CategoryListCollectionView{
            let width: CGFloat = (collectionView.bounds.width/4)-20
            let height: CGFloat = (collectionView.bounds.height/2)-20
            
            return CGSize(width: width, height: height)
        }
        else if collectionView == RecommendedMeetingListCollectionView{
            let width: CGFloat = (collectionView.bounds.width/3)-10
            let height: CGFloat = (collectionView.bounds.height/2)-10
            
            return CGSize(width: width, height: height)
        }
        else {
            print("CollectionView Delegate error - 셀 사이즈")
            return CGSize(width: 0, height: 0)
        }
    }
    
    // CollectionView Cell의 위아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == MeetingListCollectionView{
            return 20
        }
        else if collectionView == CategoryListCollectionView{
            return 10
        }
        else if collectionView == RecommendedMeetingListCollectionView{
            return 5
        }
        else {
            print("CollectionView Delegate error - 셀 상하 간격")
            return 0
        }
    }
    
    // CollectionView Cell의 옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == MeetingListCollectionView{
            return 20
        }
        else if collectionView == CategoryListCollectionView{
            return 10
        }
        else if collectionView == RecommendedMeetingListCollectionView{
            return 5
        }
        else {
            print("CollectionCiew Delegate error - 셀 좌우 간격  ")
            return 0
        }
    }
}
