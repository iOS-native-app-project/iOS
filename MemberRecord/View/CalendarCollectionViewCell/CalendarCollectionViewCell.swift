//
//  CalendarCollectionViewCell.swift
//  jaksim_ios
//
//  Created by Apple on 2022/05/05.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    let borderLayer = CAShapeLayer()
    var year: Int?
    var month: Int?
    var day: Int?
    
    private let now = Date()
    private var cal = Calendar.current
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        progressView.layer.cornerRadius = progressView.bounds.height/2
        imageView.layer.cornerRadius = imageView.bounds.height/2
        
        borderLayer.strokeColor = .none
        borderLayer.lineDashPattern = [2, 2]
        borderLayer.frame = progressView.bounds
        borderLayer.fillColor = nil
        borderLayer.path = UIBezierPath(roundedRect: progressView.bounds, cornerRadius: progressView.bounds.height/2).cgPath
        progressView.layer.addSublayer(borderLayer)
    }
}
