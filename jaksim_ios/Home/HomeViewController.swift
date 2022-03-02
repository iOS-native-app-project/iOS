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

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // 셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meetingList.count
    }

    // 셀 뷰
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.meetingListCellId, for: indexPath) as? MeetingListCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.TextField.text = meetingList[indexPath.row]
        
        //let item = trackManager.track(at: indexPath.item)
        //cell.updateUI(item: item)
        return cell
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
        // 20 - card(width) - 20 - card(width) - 20
        let width: CGFloat = collectionView.bounds.width
        let height: CGFloat = 150
        
        return CGSize(width: width, height: height)
    }
}
