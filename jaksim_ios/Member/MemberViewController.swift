//
//  MemberViewController.swift
//  jaksim_ios
//
//  Created by 소영 on 2022/04/14.
//

import UIKit

class MemberViewController: UIViewController {

    @IBOutlet var topImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var percentLabel: UILabel!
    @IBOutlet var rateDateLabel: UILabel!
    @IBOutlet var tagCollectionView: UICollectionView!
    @IBOutlet var memberTableView: UITableView!
    
    lazy var dataManager = MemberDataManager()
    
    var memberHomeResult: MemberHomeResult?
    var memberRateLists: [MemeberRateLists] = []
    var meetingDate: MemberMeetingDate?

    var meetingTitle = ""
    var memberCount = 0
    var memberLimit = 0
    
    var meetingId = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "\(meetingTitle)"
        
        setupCollecitonView()
        setupTableView()
        
        
    }

}
//MARK: - CollectionView
extension MemberViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCollectionViewCell", for: indexPath) as! TagCollectionViewCell
        
        
        return cell
    }
    
    private func setupCollecitonView() {
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
        
        let flowLayout = UICollectionViewFlowLayout()
        tagCollectionView.collectionViewLayout = flowLayout
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 50, height: 30)
    }
    
    
}

//MARK: - TableView
extension MemberViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        //return memberRateLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberTableViewCell", for: indexPath) as! MemberTableViewCell
        
        let memberRateList = memberRateLists[indexPath.row]
        let good = memberRateList.recommand
        //let bad = memberRateList.
        //let imageUrl = memberRateList.
        cell.userId = memberRateList.userId
        cell.userNameLabel.text = memberRateList.nickname
        cell.percentLabel.text = "\(memberRateList.rate)%"
        cell.goodButton.setTitle("\(good)", for: .normal)
        
        
        cell.goToAlert = {
            let alertVC = self.storyboard?.instantiateViewController(withIdentifier: "MemberAlertViewController") as! MemberAlertViewController
            
            alertVC.modalPresentationStyle = .fullScreen
            
            if cell.isGood == true {
                alertVC.good = true
            } else {
                alertVC.good = false
            }
            alertVC.meetingId = self.meetingId
            self.present(alertVC, animated: false, completion: nil)
        }
       
        return cell
    }
    
    private func setupTableView() {
        memberTableView.delegate = self
        memberTableView.dataSource = self
    }
    
}

//MARK: - API
extension MemberViewController {
    func successMemberHome(_ result: MemeberHomeResponse) {
        memberHomeResult = result.data
        titleLabel.text = memberHomeResult?.meeting_descript
        meetingTitle = memberHomeResult!.meeting_name
        meetingId = memberHomeResult!.meeting_id
        memberLimit = memberHomeResult!.meeting_limit
        
    }
    func successMeetingRate(_ result: MeetingRateResponse) {
        
    }
    
    func successMemberRate(_ result: MemeberRateResponse) {
        memberRateLists = (result.data?.memberRate)!
        meetingDate = result.data?.meetingDate
        
        let startDay = meetingDate!.startDate
        let endDay = meetingDate!.endDate
        
        rateDateLabel.text = "\(startDay)~\(endDay)"
        memberCount = memberRateLists.count
        
        memberTableView.reloadData()
    }
   
    func failedToResponse(message: String) {
        print(message)
    }
    
    func failedToRequest(message: String) {
        print(message)
    }
}

//MARK: - Graph
class RateGraphView: UIView {
    
}
