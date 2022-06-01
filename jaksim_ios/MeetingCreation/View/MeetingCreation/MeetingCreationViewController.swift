//
//  MeetingCreationViewController.swift
//  jaksim_ios
//
//  Created by Apple on 2022/03/30.
//

import UIKit

class MeetingCreationViewController: UIViewController {
    
    @IBOutlet weak var navigationTitleLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let category = Constant.MeetingCreation.Text.Category
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK:- 네비게이션바 타이틀 라벨
        navigationTitleLabel.text = "모임 개설 (1/2)"
        //navigationTitleLabel.font = UIFont(name: Constant.FontName.PretendardSemiBold, size: 18)
        navigationTitleLabel.textColor = Constant.Color.Black33
        
        //MARK:- 닫기 버튼
        closeButton.setImage(Constant.Image.CloseIcon, for: .normal)
        closeButton.tintColor = Constant.Color.Black33
        
        //MARK:- '모임 카테고리를 선택해주세요' 라벨
        //titleLabel.font = UIFont(name: Constant.FontName.PretendardSemiBold, size: 14)
        titleLabel.textColor = Constant.Color.Black66
        titleLabel.text = Constant.MeetingCreation.Text.Title
        
        //MARK:- 카테고리 컬렉션뷰
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        categoryCollectionView.register(UINib(nibName: Constant.MeetingCreation.Name.CategoryCollectionViewCellName, bundle: nil), forCellWithReuseIdentifier: Constant.MeetingCreation.Id.CategoryCollectionViewCellId)
    }
}

//MARK:- CollectionView Delegate
extension MeetingCreationViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // 셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 8
    }
    
    // 셀 뷰
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.MeetingCreation.Id.CategoryCollectionViewCellId, for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.label.text = category[indexPath.row].0
        cell.imageView.image = UIImage(named: category[indexPath.row].1)
        
        return cell
    }
    
    //터치업 액션
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let MeetingCreationDetailVC = self.storyboard?.instantiateViewController(withIdentifier: Constant.MeetingCreation.Id.MeetingCreationDetailViewControllerId)
        self.navigationController?.pushViewController(MeetingCreationDetailVC!, animated: true)
    }
    
    // 셀 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = 160
        let height: CGFloat = 110
        
        return CGSize(width: width, height: height)
    }
    
    // CollectionView Cell의 위아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 16/2
    }
    
    // CollectionView Cell의 옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 16/2
    }
}
