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
    let searchTermListViewModel = SearchTermListViewModel()

    var searchTermList = [SearchTerm]()
    var meetingList = [Meeting]()
    var searchedMeetingList = [Meeting]()
    var searchText = ""
    var isSearchMode = false
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:- 서치바
        searchBar.searchTextField.layer.cornerRadius = searchBar.bounds.height/2 - 10
        searchBar.searchTextField.layer.masksToBounds = true
        searchBar.delegate = self
        searchBar.searchTextField.font = UIFont(name: K.FontName.PretendardRegular, size: 16)
        
        //MARK:- 추천검색어 컬렉션뷰
        collectionViewTitleLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 13)
        
        searchTermsCollectionView.delegate = self
        
        searchTermsCollectionView.register(UINib(nibName: K.MeetingList.Name.SearchTermsCollectionViewCellXibName, bundle: nil), forCellWithReuseIdentifier: K.MeetingList.Id.SearchTermsCollectionViewCellId)
        
        
        searchTermListViewModel.searchTermListSubject
            .observe(on: MainScheduler.instance)
            .do(onNext: { list in
                self.searchTermList = list
            })
            .bind(to: searchTermsCollectionView.rx.items(cellIdentifier: K.MeetingList.Id.SearchTermsCollectionViewCellId, cellType: SearchTermsCollectionViewCell.self)) { index, item, cell in
            
                cell.searchTermButton.setTitle(item.name, for: .normal)
                
                if index == self.searchTermList.count-1 {
                    self.searchTermsCollectionView.reloadData()
                }
            }
            .disposed(by: disposeBag)
        
        
        //MARK:- 전체모임리스트 컬렉션뷰
        tableViewTitleLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 13)
        
        meetingListTableView.delegate = self
        
        meetingListTableView.register(UINib(nibName: K.MeetingList.Name.MeetingListTableViewCellXibName, bundle: nil), forCellReuseIdentifier: K.MeetingList.Id.MeetingListTableViewCellId)
        
        meetingListViewModel.meetingListSubject
            .observe(on: MainScheduler.instance)
            .bind(to: meetingListTableView.rx.items(cellIdentifier: K.MeetingList.Id.MeetingListTableViewCellId, cellType: MeetingListTableViewCell.self)) { index, item, cell in
                
                cell.meetingNameLabel.text = item.name
                //cell.numberOfPeopleLabel.text = "\(item.numberOfpeople)/16"
                cell.entranceButton.addTarget(self, action: #selector(self.entranceButtonDidTap(_:)), for: .touchUpInside)
        
                
            }
            .disposed(by: disposeBag)
    }
}


//MARK:- CollectionView Delegate
extension MeetingListViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let tmpLabel: UILabel = UILabel()
        tmpLabel.text = searchTermList[indexPath.row].name

        
        let width: CGFloat = tmpLabel.intrinsicContentSize.width + 24
        return CGSize(width: width, height: 36)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 8/2
    }
}

//MARK:- TableView Delegate
extension MeetingListViewController: UITableViewDelegate {

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
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


extension MeetingListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    
        self.searchText = searchBar.text!
        self.isSearchMode = true
        
        meetingListTableView.dataSource = nil
        meetingListViewModel.meetingListSubject
            .observe(on: MainScheduler.instance)
            .map { list in
                list.filter { meeting in
                    if self.isSearchMode{
                        return meeting.name.lowercased().contains(self.searchText.lowercased())
                    }
                    return true
                }
            }
            .bind(to: meetingListTableView.rx.items(cellIdentifier: K.MeetingList.Id.MeetingListTableViewCellId, cellType: MeetingListTableViewCell.self)) { index, item, cell in
                
                cell.meetingNameLabel.text = item.name
                //cell.numberOfPeopleLabel.text = "\(item.numberOfpeople)/16"
                cell.entranceButton.addTarget(self, action: #selector(self.entranceButtonDidTap(_:)), for: .touchUpInside)
        
                
            }
            .disposed(by: disposeBag)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            self.searchText = ""
            self.isSearchMode = false
            
            meetingListTableView.dataSource = nil
            meetingListViewModel.meetingListSubject
                .observe(on: MainScheduler.instance)
                .bind(to: meetingListTableView.rx.items(cellIdentifier: K.MeetingList.Id.MeetingListTableViewCellId, cellType: MeetingListTableViewCell.self)) { index, item, cell in
                    
                    cell.meetingNameLabel.text = item.name
                    //cell.numberOfPeopleLabel.text = "\(item.numberOfpeople)/16"
                    cell.entranceButton.addTarget(self, action: #selector(self.entranceButtonDidTap(_:)), for: .touchUpInside)
            
                    
                }
                .disposed(by: disposeBag)
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}
