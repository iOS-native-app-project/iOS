//
//  NotificationViewController.swift
//  jaksim_ios
//
//  Created by Apple on 2022/04/27.
//

import UIKit
import RxSwift
import RxCocoa

class NotificationViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var notificationListTableView: UITableView!
    
    private var notificationListViewModel = NotificationViewModel()
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK:- 타이틀
        titleLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 18)
        titleLabel.textColor = K.Color.Black33
        
        //MARK:- 뒤로가기 버튼
        backButton.setImage(K.Image.backButtonIcon, for: .normal)
        backButton.tintColor = K.Color.Black33
        
        //MARK:- 알림 목록
        notificationListViewModel.notificationListSubject
            .observe(on: MainScheduler.instance)
            .bind(to: notificationListTableView.rx.items(cellIdentifier: K.Home.Id.NotificationListTableViewCellId, cellType: NotificationListTableViewCell.self)) { index, item, cell in
                
                cell.notificationContentLabel.text = item.content
                cell.notificationDateLabel.text = item.date
        
                if item.noti == 0 { // siren
                    cell.notificationImageView.image = K.Image.ThumbsUpIcon
                    cell.notificationImageView.tintColor = UIColor(red: 255.0/255.0, green: 55.0/255.0, blue: 43.0/255.0, alpha: 1.0)
                }
                else { // thumbs up
                    cell.notificationImageView.image = K.Image.SirenIcon
                    cell.notificationImageView.tintColor = UIColor(red: 55.0/255.0, green: 141.0/255.0, blue: 240.0/255.0, alpha: 1.0)
                }
                cell.notificationImageView.image = cell.notificationImageView.image?.withRenderingMode(.alwaysTemplate)
                
            }
            .disposed(by: disposeBag)
        
        notificationListTableView.delegate = self
        notificationListTableView.register(UINib(nibName: K.Home.Name.NotificationListTableViewCellXibName, bundle: nil), forCellReuseIdentifier: K.Home.Id.NotificationListTableViewCellId)
    }

    //MARK:- 뒤로가기 버튼 action
    @IBAction func backButtonDidTap(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK:- TableView Delegate
extension NotificationViewController: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92
    }
}
