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
    @IBOutlet weak var firstTextView: UITextView!
    @IBOutlet weak var firstTextViewContainerView: UIView!
    
    @IBOutlet weak var secondTitleLabel: UILabel!
    @IBOutlet weak var secondCountLabel: UILabel!
    @IBOutlet weak var secondTextView: UITextView!
    @IBOutlet weak var secondTextViewContainerView: UIView!
    
    var meetingNameFlag = false
    var meetingDescriptionFlag = false
    
    var delegate: CreationSectionDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    private func loadView(){
        let view = Bundle.main.loadNibNamed(Constant.MeetingCreation.Name.CreationFirstSectionXibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        
        //MARK: - 사용자가 업로드하는 이미지
        categoryImageView.layer.cornerRadius = 6
        
        cameraImageContainerView.layer.borderWidth = 1
        cameraImageContainerView.layer.borderColor = UIColor.white.cgColor
        cameraImageContainerView.layer.cornerRadius = cameraImageContainerView.bounds.height/2
        cameraImageContainerView.backgroundColor = Constant.Color.Gray224
        
        cameraImageView.tintColor = Constant.Color.Black97
        
        //MARK: - '모임을 입력해주세요' 라벨
        firstTitleLabel.font = UIFont(name: Constant.FontName.PretendardSemiBold, size: 14)
        firstTitleLabel.textColor = Constant.Color.Black66
        firstTitleLabel.text = Constant.MeetingCreation.Text.CreationFirstSection.FirstTitle
        
        //MARK: - '모임을 입력해주세요' 텍스트 카운트 라벨
        firstCountLabel.font = UIFont(name: Constant.FontName.PretendardRegular, size: 14)
        firstCountLabel.textColor = Constant.Color.Gray158
        
        //MARK: - '모임을 입력해주세요' TextView
        firstTextView.font = UIFont(name: Constant.FontName.PretendardRegular, size: 14)
        firstTextView.textColor = Constant.Color.Gray158
        firstTextView.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        firstTextView.backgroundColor = .clear
        firstTextView.text = Constant.MeetingCreation.Text.CreationFirstSection.FirstTextViewPlaceHolder
        firstTextView.delegate = self
        
        firstTextViewContainerView.backgroundColor = Constant.Color.Gray245
        firstTextViewContainerView.layer.cornerRadius = 8
        
        //MARK: - '간단하게 모임을 소개해주세요' 라벨
        secondTitleLabel.font = UIFont(name: Constant.FontName.PretendardSemiBold, size: 14)
        secondTitleLabel.textColor = Constant.Color.Black66
        secondTitleLabel.text = Constant.MeetingCreation.Text.CreationFirstSection.SecondTitle
        
        //MARK: - '간단하게 모임을 소개해주세요' 텍스트 카운트 라벨
        secondCountLabel.font = UIFont(name: Constant.FontName.PretendardRegular, size: 14)
        secondCountLabel.textColor = Constant.Color.Gray158
        
        //MARK: - '간단하게 모임을 소개해주세요' TextView
        secondTextView.font = UIFont(name: Constant.FontName.PretendardRegular, size: 14)
        secondTextView.textColor = Constant.Color.Gray158
        secondTextView.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        secondTextView.backgroundColor = .clear
        secondTextView.text = Constant.MeetingCreation.Text.CreationFirstSection.SecondTextViewPlaceHolder
        secondTextView.delegate = self
        
        secondTextViewContainerView.backgroundColor = Constant.Color.Gray245
        secondTextViewContainerView.layer.cornerRadius = 8
        
        self.addSubview(view)
    }
}

//MARK: - TextView Delegate
extension CreationFirstSection: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == Constant.Color.Gray158 {
            textView.text = nil
            textView.textColor = Constant.Color.Black33
        }
        
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView == firstTextView {
            if textView.text.isEmpty {
                meetingNameFlag = false
                textView.text = Constant.MeetingCreation.Text.CreationFirstSection.FirstTextViewPlaceHolder
                textView.textColor = Constant.Color.Gray158
                delegate?.checkData()
            }
            else {
                meetingNameFlag = true
                delegate?.checkData()
            }
        }
        else if textView == secondTextView {
            if textView.text.isEmpty {
                meetingDescriptionFlag = false
                textView.text = Constant.MeetingCreation.Text.CreationFirstSection.SecondTextViewPlaceHolder
                textView.textColor = Constant.Color.Gray158
                delegate?.checkData()
            }
            else {
                meetingDescriptionFlag = true
                delegate?.checkData()
            }
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        if textView.text.count > 30 {
            textView.deleteBackward()
        }
        
        if textView == firstTextView {
            firstCountLabel.text = "\(textView.text.count)/30"
        }
        else if textView == secondTextView {
            secondCountLabel.text = "\(textView.text.count)/30"
        }
    }
}
