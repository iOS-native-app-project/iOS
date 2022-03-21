//
//  MyRecordViewController.swift
//  jaksim_ios
//
//  Created by Apple on 2022/03/17.
//

import UIKit
import FSCalendar

class MyRecordViewController: UIViewController {
    @IBOutlet weak var meetingListCollectionView: UICollectionView!
    @IBOutlet weak var calendarView: FSCalendar!
    
    var meetingList: [String] =
        ["참여모임1", "참여모임2", "참여모임3", "참여모임4", "참여모임5", "참여모임6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        meetingListCollectionView.dataSource = self
        meetingListCollectionView.delegate = self
        meetingListCollectionView.register(UINib(nibName: K.Id.meetingListCollectionViewCellId, bundle: nil), forCellWithReuseIdentifier: K.Id.meetingListCollectionViewCellId)
        
//        calendarView.delegate = self
//        calendarView.dataSource = self
        
        calendarView.appearance.headerDateFormat = "YYYY년 MM월"
        // M, T, W ...
        calendarView.appearance.caseOptions = FSCalendarCaseOptions.weekdayUsesSingleUpperCase
        // 년월에 흐릿하게 보이는 애들 없애기
        calendarView.appearance.headerMinimumDissolvedAlpha = 0
        
        // day 숫자 위치 조정
        let dayFontSize = calendarView.appearance.titleFont.pointSize
        calendarView.appearance.titleOffset = CGPoint.init(
            x: dayFontSize - calendarView.frame.width/7/2,
            y: -calendarView.rowHeight/2)
        
        //calendarView.register(CalendarViewCell.self, forCellReuseIdentifier: K.Id.calendarViewCellId)
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

//MARK:- CollectionView Delegate
extension MyRecordViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // 셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == meetingListCollectionView{
            return meetingList.count
        }
        else {
            print("CollectionView Delegate error - 셀 개수")
            return 0
        }
        
    }
    
    // 셀 뷰
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == meetingListCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Id.meetingListCollectionViewCellId, for: indexPath) as? MeetingListCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.goal.text = meetingList[indexPath.row]
            
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
        else {
            print("CollectionCiew Delegate error - 셀 좌우 간격  ")
            return 0
        }
    }
}
