//
//  RecordInputViewController.swift
//  jaksim_ios
//
//  Created by 소영 on 2022/03/22.
//

import UIKit
import FSCalendar

class RecordInputViewController: UIViewController {

    @IBOutlet var calendarView: FSCalendar!
    @IBOutlet var memoTextView: UITextView!
    @IBOutlet var photoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        
    }
    
    func setupLayout() {
        memoTextView.layer.cornerRadius = 8
        photoView.layer.cornerRadius = 8
        photoView.layer.borderWidth = 1
    }


}
