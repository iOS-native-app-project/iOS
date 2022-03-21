//
//  MyRecordViewController.swift
//  jaksim_ios
//
//  Created by Apple on 2022/03/17.
//

import UIKit
import FSCalendar

class MyRecordViewController: UIViewController {
    @IBOutlet weak var calendarView: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarView.delegate = self
        calendarView.dataSource = self
        
        calendarView.appearance.headerDateFormat = "YYYY년 MM월"
        // M, T, W ...
        calendarView.appearance.caseOptions = FSCalendarCaseOptions.weekdayUsesSingleUpperCase
        // 년월에 흐릿하게 보이는 애들 없애기
        calendarView.appearance.headerMinimumDissolvedAlpha = 0
        
        // day 숫자 위치 조정
        let dayFontSize = calendarView.appearance.titleFont.pointSize
        calendarView.appearance.titleOffset = CGPoint.init(
            x: dayFontSize - calendarView.frame.width/7/2,
            y: -calendarView.rowHeight/2)
    
        //calendarView.register(CalendarViewCell.self, forCellReuseIdentifier: K.Id.calendarViewCellId)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MyRecordViewController: FSCalendarDataSource, FSCalendarDelegate {
    
}
