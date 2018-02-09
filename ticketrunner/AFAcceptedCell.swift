//
//  AFAcceptedCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 07.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class AFAcceptedCell: AFBaseCell {
    
    let titleLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.numberOfLines = 0
        
        let attributedText = NSMutableAttributedString(string: "You ", attributes: [NSAttributedStringKey.font : UIFont.boldSourceSansPro(ofSize: 14), NSAttributedStringKey.foregroundColor: UIColor.black])
        
        attributedText.append(NSMutableAttributedString(string: "have got accepted as a Ticketrunner of ", attributes: [NSAttributedStringKey.font : UIFont.sourceSansPro(ofSize: 14), NSAttributedStringKey.foregroundColor: ColorCodes.lightGrayText]))
        
        attributedText.append(NSMutableAttributedString(string: "Decade of Early Hardcore", attributes: [NSAttributedStringKey.font : UIFont.boldSourceSansPro(ofSize: 14), NSAttributedStringKey.foregroundColor: ColorCodes.darkPurple]))
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.lineSpacing = 5
        
        attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedText.length))
        
        label.attributedText = attributedText
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        whiteView.addSubview(titleLabel)
        
        titleLabel.anchor(top: whiteView.topAnchor, left: miniImageView.trailingAnchor, bottom: whiteView.bottomAnchor, right: whiteView.trailingAnchor, padding: .init(top: 8, left: 24, bottom: 8, right: 16), size: .zero)
        
    }
    
}
