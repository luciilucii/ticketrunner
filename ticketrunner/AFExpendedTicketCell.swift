//
//  AFExpendedTicketCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 07.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class AFExpendedTicketCell: BaseCell {
    
    let ticketLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        
        let attributedText = NSMutableAttributedString(string: "2 x", attributes: [NSAttributedStringKey.font : UIFont.boldSourceSansPro(ofSize: 16), NSAttributedStringKey.foregroundColor: ColorCodes.darkPurple,])
        
        
        attributedText.append(NSMutableAttributedString(string: " VIP", attributes: [NSAttributedStringKey.font : UIFont.boldSourceSansPro(ofSize: 16), NSAttributedStringKey.foregroundColor: UIColor.black]))
        
        attributedText.append(NSMutableAttributedString(string: " Tickets", attributes: [NSAttributedStringKey.font : UIFont.sourceSansPro(ofSize: 16), NSAttributedStringKey.foregroundColor: ColorCodes.lightGrayText]))
        label.attributedText = attributedText
        return label
    }()
    
    let plusLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.text = "2000°"
        label.textAlignment = .right
        label.font = UIFont.boldSourceSansPro(ofSize: 16)
        label.textColor = ColorCodes.ticketrunnerGreen
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        addSubview(ticketLabel)
        addSubview(plusLabel)
        
        ticketLabel.anchor(top: topAnchor, left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor, padding: .init(top: 4, left: 0, bottom: 4, right: 150), size: .zero)
        
        plusLabel.anchor(top: topAnchor, left: ticketLabel.trailingAnchor, bottom: bottomAnchor, right: trailingAnchor, padding: .init(top: 4, left: 8, bottom: 4, right: 0), size: .zero)
        
        
    }
    
}









