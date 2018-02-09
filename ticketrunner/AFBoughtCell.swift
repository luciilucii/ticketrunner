//
//  AFBoughtCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 07.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class AFBoughtCell: AFBaseCell {
    
    let plusLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.text = "+300°"
        label.textColor = UIColor.white
        label.backgroundColor = ColorCodes.ticketrunnerGreen
        label.clipsToBounds = true
        label.font = UIFont.boldSourceSansPro(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    let titleLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.numberOfLines = 0
        
        let attributedText = NSMutableAttributedString(string: "                   Princess Flame", attributes: [NSAttributedStringKey.font : UIFont.boldSourceSansPro(ofSize: 14), NSAttributedStringKey.foregroundColor: UIColor.black])
        
        
        attributedText.append(NSMutableAttributedString(string: " has bought a ticket of", attributes: [NSAttributedStringKey.font : UIFont.sourceSansPro(ofSize: 14), NSAttributedStringKey.foregroundColor: ColorCodes.lightGrayText]))
        
        attributedText.append(NSMutableAttributedString(string: " Decade of Early Hardcore", attributes: [NSAttributedStringKey.font : UIFont.boldSourceSansPro(ofSize: 14), NSAttributedStringKey.foregroundColor: ColorCodes.darkPurple]))
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.lineSpacing = 5
        
        attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedText.length))
        
        label.attributedText = attributedText
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        
        whiteView.addSubview(titleLabel)
        whiteView.addSubview(plusLabel)
        
        titleLabel.anchor(top: whiteView.topAnchor, left: miniImageView.trailingAnchor, bottom: whiteView.bottomAnchor, right: whiteView.trailingAnchor, padding: .init(top: 8, left: 24, bottom: 8, right: 16), size: .zero)
        
        plusLabel.anchor(top: nil, left: titleLabel.leadingAnchor, bottom: centerYAnchor, right: nil, padding: .init(top: 0, left: 0, bottom: 2, right: 0), size: .init(width: 45, height: 18))
        plusLabel.layer.cornerRadius = 20/2
        
        
    }
    
}







