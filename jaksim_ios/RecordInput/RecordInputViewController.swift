//
//  RecordInputViewController.swift
//  jaksim_ios
//
//  Created by 소영 on 2022/03/22.
//

import UIKit

class RecordInputViewController: UIViewController {

    @IBOutlet var valueTextField: UITextField!
    @IBOutlet var memoTextView: UITextView!
    @IBOutlet var kmLabel: UILabel!
    @IBOutlet var photoView: UIView!
    @IBOutlet var memoTextCountLabel: UILabel!
    @IBOutlet var memoTextField: UITextField!
    @IBOutlet var spaceView: UIView!
    @IBOutlet var calendarCollectionView: UICollectionView!
    @IBOutlet var editButton: UIButton!
    @IBOutlet var recordImageView: UIImageView!
    
    //lazy var dataManager =
    
    var recordData: [MyRecordResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupCollectionView()
        
    }
    
    func setupLayout() {
        if recordData.count == 0 {
            self.navigationItem.title = "나의 기록"
            memoTextField.isHidden = false
            spaceView.isHidden = false
            editButton.isHidden = false
            memoTextView.isHidden = true
        } else {
            self.navigationItem.title = "기록하기"
            memoTextField.isHidden = true
            spaceView.isHidden = true
            editButton.isHidden = true
            memoTextView.isHidden = false
            photoView.layer.borderWidth = 1
            photoView.layer.borderColor = UIColor.lightGray.cgColor
           
        }
        
        kmLabel.layer.cornerRadius = 8
        memoTextView.layer.cornerRadius = 8
        memoTextView.layer.borderWidth = 1
        memoTextView.layer.borderColor = UIColor.lightGray.cgColor
        photoView.layer.cornerRadius = 8
        memoTextField.isUserInteractionEnabled = false
        valueTextField.isUserInteractionEnabled = false
        editButton.layer.cornerRadius = 999
    }

    @IBAction func editButtonAction(_ sender: UIButton) {
        valueTextField.isUserInteractionEnabled = true
        memoTextField.isUserInteractionEnabled = true
    }
    
}

//MARK: - CollectionView
extension RecordInputViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = calendarCollectionView.dequeueReusableCell(withReuseIdentifier: "RecordInputCalendarCollectionViewCell", for: indexPath) as! RecordInputCalendarCollectionViewCell
        
        let titleArray = ["일", "월", "화", "수", "목", "금", "토"]
        
        cell.titleLabel.text = titleArray[indexPath.row]
        
        return cell
    }
    
    
    func setupCollectionView() {
        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self
        calendarCollectionView.isScrollEnabled = false
        calendarCollectionView.showsVerticalScrollIndicator = false
        calendarCollectionView.showsHorizontalScrollIndicator = false
        
        let flowLayout = UICollectionViewFlowLayout()
        calendarCollectionView.collectionViewLayout = flowLayout
        let width = calendarCollectionView.frame.width/7
        flowLayout.itemSize = CGSize(width: width, height: 88)
        
        let nibName = UINib(nibName: "RecordInputCalendarCollectionViewCell", bundle: nil)
        calendarCollectionView.register(nibName, forCellWithReuseIdentifier: "RecordInputCalendarCollectionViewCell")
    }
}

//MARK: - API
extension RecordInputViewController {
    func successMyRecordData(_ result: MyRecordResponse) {
        recordData = result.data!
        
        if recordData.count != 0 {
            valueTextField.text = "\(recordData[0].value)"
            memoTextField.text = recordData[0].descript
            //recordImageView.image = recordData[0].image
        }
       
        calendarCollectionView.reloadData()
    }
}
