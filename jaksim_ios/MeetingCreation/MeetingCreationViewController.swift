//
//  MeetingCreationViewController.swift
//  jaksim_ios
//
//  Created by Apple on 2022/03/30.
//

import UIKit

class MeetingCreationViewController: UIViewController {
    
    let category = K.MeetingCreation.Text.Category
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
     
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        categoryCollectionView.register(UINib(nibName: K.MeetingCreation.Name.CategoryCVCell, bundle: nil), forCellWithReuseIdentifier: K.MeetingCreation.Name.CategoryCVCell)
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
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.MeetingCreation.Name.CategoryCVCell, for: indexPath) as? CategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.label.text = category[indexPath.row]
        // cell.imageView.image = UIImage(named: categoryImage[indexPath.row])
        
        return cell
    }
    
    // 터치업 액션
    //        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //
    //        }
    
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
