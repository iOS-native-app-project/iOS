//
//  MeetingListViewController.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/12.
//

import UIKit
import RxSwift
import RxCocoa

class MeetingListViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTermsCollectionView: UICollectionView!
    @IBOutlet weak var meetingListTableView: UITableView!
    @IBOutlet weak var meetingCreationButton: UIButton!
    
    @IBOutlet weak var collectionViewTitleLabel: UILabel!
    @IBOutlet weak var tableViewTitleLabel: UILabel!
    
    let meetingListViewModel = MeetingListViewModel()
    var tableViewSectionCount = 0
    
    var disposeBag = DisposeBag()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.searchTextField.layer.cornerRadius = searchBar.bounds.height/2 - 10
        searchBar.searchTextField.layer.masksToBounds = true
        
        searchTermsCollectionView.dataSource = self
        searchTermsCollectionView.delegate = self
        searchTermsCollectionView.register(UINib(nibName: K.MeetingList.Name.SearchTermsCollectionViewCellXibName, bundle: nil), forCellWithReuseIdentifier: K.MeetingList.Id.SearchTermsCollectionViewCellId)
        
        //meetingListTableView.dataSource = self
        meetingListTableView.delegate = self
        meetingListTableView.register(UINib(nibName: K.MeetingList.Name.MeetingListTableViewCellXibName, bundle: nil), forCellReuseIdentifier: K.MeetingList.Id.MeetingListTableViewCellId)
        
        collectionViewTitleLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 13)
        tableViewTitleLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 13)

    
        // 이 bind로 인해 tableView의 dataSource는 필요없어진다.
        meetingListViewModel.meetingListSubject
            .observe(on: MainScheduler.instance)
            .bind(to: meetingListTableView.rx.items(cellIdentifier: K.MeetingList.Id.MeetingListTableViewCellId, cellType: MeetingListTableViewCell.self)) { index, item, cell in

                cell.meetingNameLabel.text = item.name
                cell.numberOfPeopleLabel.text = "\(item.numberOfpeople)/16"
                cell.entranceButton.addTarget(self, action: #selector(self.entranceButtonDidTap(_:)), for: .touchUpInside)

            }
            .disposed(by: disposeBag)
    }
}


//MARK:- CollectionView Delegate
extension MeetingListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // 셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    // 셀 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let tmpLabel : UILabel = UILabel()
        tmpLabel.text = "공부"
        
        let width: CGFloat = tmpLabel.intrinsicContentSize.width + 24
        return CGSize(width: width, height: 36)
    }
    
    // 셀 뷰
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.MeetingList.Id.SearchTermsCollectionViewCellId, for: indexPath) as? SearchTermsCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.searchTermButton.setTitle("공부", for: .normal)
        
        return cell
    }
    
    // 터치업 액션
    //        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //
    //        }
    
    //
    //    // CollectionView Cell의 위아래 간격
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //
    //        return 16/2
    //    }
    //
    
    
    // CollectionView Cell의 옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 8/2
    }
}

//MARK:- TableView Delegate
extension MeetingListViewController: UITableViewDelegate { //}, UITableViewDataSource  {
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return tableViewSectionCount
//    }
//    // There is just one row in every section
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier:K.MeetingList.Id.MeetingListTableViewCellId, for: indexPath) as! MeetingListTableViewCell
//
//        cell.entranceButton.addTarget(self, action: #selector(entranceButtonDidTap(_:)), for: .touchUpInside)
//
//        return cell
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
    
    @objc func entranceButtonDidTap(_ sender: UIButton) {
        
        guard let meetingEntranceVC = self.storyboard?.instantiateViewController(identifier: K.MeetingList.Id.MeetingEntranceViewControllerId) else { return }
        
        meetingEntranceVC.modalTransitionStyle = .coverVertical
        meetingEntranceVC.modalPresentationStyle = .fullScreen
        
        self.present(meetingEntranceVC, animated: true)
    }
}


