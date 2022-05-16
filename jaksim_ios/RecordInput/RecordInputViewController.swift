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
    @IBOutlet var imageStackView: UIStackView!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageStackView.isHidden = true
        imageView.layer.cornerRadius = 20
    }
    


}
