//
//  MeetingFirstSection.swift
//  jaksim_ios
//
//  Created by Apple on 2022/03/31.
//

import UIKit

class CreationFirstSection: UIView {
    
    @IBOutlet weak var categoryImageView: UIImageView!
    
    @IBOutlet weak var cameraImageContainerView: UIView!
    @IBOutlet weak var cameraImageView: UIImageView!
    
    @IBOutlet weak var firstTitleLabel: UILabel!
    @IBOutlet weak var firstCountLabel: UILabel!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var firstContainerView: UIView!
    
    @IBOutlet weak var secondTitleLabel: UILabel!
    @IBOutlet weak var secondCountLabel: UILabel!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var secondContainerView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    private func loadView(){
        let view = Bundle.main.loadNibNamed(K.MeetingCreation.Name.CreationFirstSectionXibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        
        categoryImageView.layer.cornerRadius = 6
        
        cameraImageContainerView.layer.borderWidth = 1
        cameraImageContainerView.layer.borderColor = UIColor.white.cgColor
        cameraImageContainerView.layer.cornerRadius = cameraImageContainerView.bounds.height/2
        cameraImageContainerView.backgroundColor = K.Color.Gray224
        
        cameraImageView.tintColor = K.Color.Black97
        
        firstTitleLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 14)
        firstTitleLabel.textColor = K.Color.Black66
        firstTitleLabel.text = K.MeetingCreation.Text.CreationFirstSection.FirstTitle
        
        firstCountLabel.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        firstCountLabel.textColor = K.Color.Gray158
        
        firstTextField.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        firstTextField.textColor = K.Color.Gray158
        
        firstContainerView.backgroundColor = K.Color.Gray245
        firstContainerView.layer.cornerRadius = 8
        
        secondTitleLabel.font = UIFont(name: K.FontName.PretendardSemiBold, size: 14)
        secondTitleLabel.textColor = K.Color.Black66
        secondTitleLabel.text = K.MeetingCreation.Text.CreationFirstSection.SecondTitle
        
        secondCountLabel.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        secondCountLabel.textColor = K.Color.Gray158
        
        secondTextField.font = UIFont(name: K.FontName.PretendardRegular, size: 14)
        secondTextField.textColor = K.Color.Gray158
        
        secondContainerView.backgroundColor = K.Color.Gray245
        secondContainerView.layer.cornerRadius = 8
        
        self.addSubview(view)
    }

}
extension UITextField {

   func setPadding(left: CGFloat? = nil, right: CGFloat? = nil){
       if let left = left {
          let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: self.frame.size.height))
          self.leftView = paddingView
          self.leftViewMode = .always
       }

       if let right = right {
           let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: right, height: self.frame.size.height))
           self.rightView = paddingView
           self.rightViewMode = .always
       }
   }

}
