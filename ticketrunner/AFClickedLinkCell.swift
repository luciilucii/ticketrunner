//
//  AFClickedLinkCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 07.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class AFClickedLinkCell: AFBaseCell {
    
    let mediaImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.image = #imageLiteral(resourceName: "twitter.png").withRenderingMode(.alwaysTemplate)
        iv.tintColor = ColorCodes.inactiveElementsGrey
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let titleLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.numberOfLines = 0
        
        let attributedText = NSMutableAttributedString(string: "Lumpy Spare Prince ", attributes: [NSAttributedStringKey.font : UIFont.boldSourceSansPro(ofSize: 14), NSAttributedStringKey.foregroundColor: UIColor.black])
        
        attributedText.append(NSMutableAttributedString(string: "clicked on the link for ", attributes: [NSAttributedStringKey.font : UIFont.sourceSansPro(ofSize: 14), NSAttributedStringKey.foregroundColor: ColorCodes.lightGrayText]))
        
        attributedText.append(NSMutableAttributedString(string: "Panama Open Air", attributes: [NSAttributedStringKey.font : UIFont.boldSourceSansPro(ofSize: 14), NSAttributedStringKey.foregroundColor: ColorCodes.darkPurple]))
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.lineSpacing = 5
        
        attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedText.length))
        
        label.attributedText = attributedText
        return label
    }()
    
    let stepsView: AFStepsView = {
        let view = AFStepsView()
        view.setupSecondStep()
        return view
    }()
    
    let seperatorView = UIView()
    
    override func setupViews() {
        super.setupViews()
        
        seperatorView.backgroundColor = ColorCodes.inactiveElementsGrey
        
        whiteView.addSubview(mediaImageView)
        whiteView.addSubview(titleLabel)
        whiteView.addSubview(seperatorView)
        whiteView.addSubview(stepsView)
        
        
        mediaImageView.anchor(top: whiteView.topAnchor, left: nil, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 30, left: 0, bottom: 0, right: 16), size: .init(width: 35, height: 35))
        
        titleLabel.anchor(top: whiteView.topAnchor, left: miniImageView.trailingAnchor, bottom: nil, right: mediaImageView.leadingAnchor, padding: .init(top: 8, left: 24, bottom: 0, right: 16), size: .init(width: 0, height: 84))
        
        seperatorView.anchor(top: whiteView.topAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 100, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0.5))
        
        stepsView.anchor(top: seperatorView.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 0, left: 24, bottom: 0, right: 24), size: .init(width: 0, height: 110))
        
        
    }
    
}









