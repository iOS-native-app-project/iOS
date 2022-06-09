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
    
    var searchTermList = Constant.MeetingList.Text.CategoryList
    var meetingList = [Meeting]()
    var searchedMeetingList = [Meeting]()
    var searchText = ""
    var isSearchMode = false
    
    var selectedSearchTermIndex = -1
    var selectedMeetingIndex = -1
    
    var disposeBag = DisposeBag()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        //MARK: - 화면에 나타날 때 마다 모임리스트 업데이트
        meetingListTableView.dataSource = nil
        meetingListViewModel.meetingListSubject
            .observe(on: MainScheduler.instance)
            .do(onNext: { list in
                self.meetingList = list
            })
                .bind(to: meetingListTableView.rx.items(cellIdentifier: Constant.MeetingList.Id.MeetingListTableViewCellId, cellType: MeetingListTableViewCell.self)) { index, item, cell in
                    cell.entranceButton.tag = index
                    self.setForEntrace(cell: cell, item: item)
                }
                .disposed(by: disposeBag)
     
        meetingListViewModel.updateMeetingList()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - 서치바
        searchBar.searchTextField.layer.cornerRadius = searchBar.bounds.height/2 - 10
        searchBar.searchTextField.layer.masksToBounds = true
        searchBar.delegate = self
        searchBar.searchTextField.font = UIFont(name: Constant.FontName.PretendardRegular, size: 16)
        
        //MARK: - 추천검색어 컬렉션뷰
        collectionViewTitleLabel.font = UIFont(name: Constant.FontName.PretendardSemiBold, size: 13)
        
        searchTermsCollectionView.dataSource = self
        searchTermsCollectionView.delegate = self
        
        searchTermsCollectionView.register(UINib(nibName: Constant.MeetingList.Name.SearchTermsCollectionViewCellXibName, bundle: nil), forCellWithReuseIdentifier: Constant.MeetingList.Id.SearchTermsCollectionViewCellId)
        
        //MARK: - 전체모임리스트 컬렉션뷰
        tableViewTitleLabel.font = UIFont(name: Constant.FontName.PretendardSemiBold, size: 13)
        
        meetingListTableView.delegate = self
        
        meetingListTableView.register(UINib(nibName: Constant.MeetingList.Name.MeetingListTableViewCellXibName, bundle: nil), forCellReuseIdentifier: Constant.MeetingList.Id.MeetingListTableViewCellId)
        
        meetingListViewModel.meetingListSubject
            .observe(on: MainScheduler.instance)
            .do(onNext: { list in
                self.meetingList = list
            })
            .bind(to: meetingListTableView.rx.items(cellIdentifier: Constant.MeetingList.Id.MeetingListTableViewCellId, cellType: MeetingListTableViewCell.self)) { index, item, cell in
                cell.entranceButton.tag = index
                self.setForEntrace(cell: cell, item: item)
                
            }
            .disposed(by: disposeBag)
    }
    
    //MARK: - 모임 리스트 데이터 세팅
    func setForEntrace(cell: MeetingListTableViewCell, item: Meeting) {
        cell.meetingNameLabel.text = item.name
        cell.numberOfPeopleLabel.text = "\(item.numberOfPeople)/\(item.maximumNumber)"
        cell.lockImageView.isHidden = item.isLocked ? false : true
        
        cell.entranceButton.addTarget(self, action: #selector(self.entranceButtonDidTap(_:)), for: .touchUpInside)
        
        if item.numberOfPeople == item.maximumNumber
            || item.join {
            cell.entranceButton.setTitleColor(Constant.Color.Gray189, for: .normal)
            cell.entranceButton.isEnabled = false
        }
        else {
            cell.entranceButton.setTitleColor(Constant.Color.MainPuple, for: .normal)
            cell.entranceButton.isEnabled = true
        }
    }
    
    //MARK: - 모임 생성 버튼 클릭 시
    @IBAction func meetingCreationButtonDidTap(_ sender: UIButton) {
        
        guard let meetringCreationVC = UIStoryboard.init(name: Constant.MeetingCreation.Name.MeetingCreationStoryBoardName, bundle: nil).instantiateViewController(identifier: Constant.MeetingCreation.Id.MeetingCreationViewControllerId) as? MeetingCreationViewController else {return}
    
        self.navigationController?.pushViewController(meetringCreationVC, animated: true)
    }
}


//MARK: - CollectionView Delegate
extension MeetingListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchTermList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.MeetingList.Id.SearchTermsCollectionViewCellId, for: indexPath) as! SearchTermsCollectionViewCell
        
        cell.searchTermButton.setTitle(searchTermList[indexPath.row], for: .normal)
        cell.searchTermButton.addTarget(self, action: #selector(self.searchTermButtonDidTap(_:)), for: .touchUpInside)
        cell.searchTermButton.tag = indexPath.row
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let tmpLabel: UILabel = UILabel()
        tmpLabel.text = searchTermList[indexPath.row]
        
        let width: CGFloat = tmpLabel.intrinsicContentSize.width + 24
        return CGSize(width: width, height: 36)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 8/2
    }
    
    @objc func searchTermButtonDidTap(_ sender: UIButton) {
        let searchTerm = searchTermList[sender.tag]
        searchBar.text = searchTerm
        self.searchBarSearchButtonClicked(searchBar)
    }
}

//MARK: - TableView Delegate
extension MeetingListViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
    
    //MARK: - 입장 버튼 클릭 시 액션
    @objc func entranceButtonDidTap(_ sender: UIButton) {
        
        guard let meetingEntranceVC = self.storyboard?.instantiateViewController(identifier: Constant.MeetingList.Id.MeetingEntranceViewControllerId) as? MeetingEntranceViewController else { return }
        
        meetingEntranceVC.modalTransitionStyle = .coverVertical
        meetingEntranceVC.modalPresentationStyle = .fullScreen
        
        let selectedMeetingIndex = sender.tag
        
        meetingEntranceVC.meetingName = meetingList[selectedMeetingIndex].name
        meetingEntranceVC.descript = meetingList[selectedMeetingIndex].descript
        switch meetingList[selectedMeetingIndex].period {
        case 0:
            meetingEntranceVC.period = "하루"
        case 1:
            meetingEntranceVC.period = "일주일"
        case 2:
            meetingEntranceVC.period = "한달"
        default:
            meetingEntranceVC.period = ""
        }
        
        if meetingList[selectedMeetingIndex].unit == "횟수" {
            meetingEntranceVC.unit = "회"
        }
        else {
            meetingEntranceVC.unit = meetingList[selectedMeetingIndex].unit
        }
        meetingEntranceVC.figure = meetingList[selectedMeetingIndex].figure
        meetingEntranceVC.category = meetingList[selectedMeetingIndex].category
        meetingEntranceVC.nickname = meetingList[selectedMeetingIndex].nickname
        meetingEntranceVC.userImage = meetingList[selectedMeetingIndex].userImage
        meetingEntranceVC.numberOfPeople = meetingList[selectedMeetingIndex].numberOfPeople
        meetingEntranceVC.maximumNumber = meetingList[selectedMeetingIndex].maximumNumber
        meetingEntranceVC.isLocked = meetingList[selectedMeetingIndex].isLocked
        meetingEntranceVC.meetingId = meetingList[selectedMeetingIndex].meetingId
        
        
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
            .do(onNext: { list in
                self.meetingList = list
            })
                .bind(to: meetingListTableView.rx.items(cellIdentifier: Constant.MeetingList.Id.MeetingListTableViewCellId, cellType: MeetingListTableViewCell.self)) { index, item, cell in
                    cell.entranceButton.tag = index
                    self.setForEntrace(cell: cell, item: item)
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
                .do(onNext: { list in
                    self.meetingList = list
                })
                    .bind(to: meetingListTableView.rx.items(cellIdentifier: Constant.MeetingList.Id.MeetingListTableViewCellId, cellType: MeetingListTableViewCell.self)) { index, item, cell in
                        cell.entranceButton.tag = index
                        self.setForEntrace(cell: cell, item: item)
                    }
                    .disposed(by: disposeBag)
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
}
