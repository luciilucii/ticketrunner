//
//  ShareSuccessView.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 03.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class ShareSuccessView: CustomUIView {
    
    let titleLabel: H1 = {
        let label = H1()
        label.text = "Congrats"
        label.textColor = ColorCodes.darkPurple
        return label
    }()
    
    let trophyImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "trophyIcon")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let descriptionLabel: NormalTextLabel = {
        let label = NormalTextLabel()
//        label.text = "You successfully shared your link with %Lead Name%. We'll keep our fingers crossed and added it to your activity feed."
        
        let attributedString = NSMutableAttributedString(string: "You successfully shared your link with ", attributes: [NSAttributedStringKey.font: UIFont.sourceSansPro(ofSize: 16), NSAttributedStringKey.foregroundColor: ColorCodes.lightGrayText])
        
        attributedString.append(NSMutableAttributedString(string: "%Lead Name%", attributes: [NSAttributedStringKey.font: UIFont.boldSourceSansPro(ofSize: 16), NSAttributedStringKey.foregroundColor: ColorCodes.darkPurple]))
        
        attributedString.append(NSMutableAttributedString(string: ". We'll keep our fingers crossed and added it to your activity feed.", attributes: [NSAttributedStringKey.font: UIFont.sourceSansPro(ofSize: 16), NSAttributedStringKey.foregroundColor: ColorCodes.lightGrayText]))
        
        label.attributedText = attributedString
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var continueButton: TicketrunnerGreenGradientButton = {
        let button = TicketrunnerGreenGradientButton(title: "Continue Promoting")
        return button
    }()
    
    lazy var doneButton: TicketrunnerRedGradientButton = {
        let button = TicketrunnerRedGradientButton(title: "I'm done")
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        layer.cornerRadius = 5
        backgroundColor = UIColor.white
        setupShadows()
        
        setupSubviews()
        
    }
    
    fileprivate func setupSubviews() {
        addSubview(titleLabel)
        addSubview(trophyImageView)
        addSubview(descriptionLabel)
        addSubview(continueButton)
        addSubview(doneButton)
        
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 30)
        
        trophyImageView.anchor(top: titleLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 175, height: 175)
        trophyImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        descriptionLabel.anchor(top: trophyImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 80)
        
        continueButton.anchor(top: descriptionLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 50)
        
        doneButton.anchor(top: continueButton.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 50)
        
        
    }
    
    
}







