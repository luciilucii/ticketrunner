//
//  AFBaseCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 07.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class AFBaseCell: BaseCell {
    
    let topTimelineView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCodes.inactiveElementsGrey
        return view
    }()
    
    let bottomTimelineView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCodes.inactiveElementsGrey
        return view
    }()
    
    let whiteView = WhiteView()
    
    let miniImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.image = #imageLiteral(resourceName: "ticketrunner_logo_short")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let timeLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.text = "7:25pm"
        label.textAlignment = .center
        label.font = UIFont.sourceSansPro(ofSize: 14)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(topTimelineView)
        addSubview(bottomTimelineView)
        addSubview(whiteView)
        
        topTimelineView.anchor(top: topAnchor, left: nil, bottom: centerYAnchor, right: nil, padding: .zero, size: .init(width: 0.5, height: 0))
        topTimelineView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        bottomTimelineView.anchor(top: centerYAnchor, left: nil, bottom: bottomAnchor, right: nil, padding: .zero, size: .init(width: 0.5, height: 0))
        bottomTimelineView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        whiteView.anchor(top: topAnchor, left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor, padding: .init(top: 8, left: 8, bottom: 8, right: 8), size: .zero)
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        whiteView.addSubview(containerView)
        
        containerView.centerYAnchor.constraint(equalTo: whiteView.topAnchor, constant: 50).isActive = true
        containerView.centerXAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 33.5).isActive = true
        
        
        containerView.addSubview(miniImageView)
        containerView.addSubview(timeLabel)
        
        miniImageView.anchor(top: containerView.topAnchor, left: nil, bottom: nil, right: nil, padding: .zero, size: .init(width: 35, height: 35))
        miniImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        timeLabel.anchor(top: miniImageView.bottomAnchor, left: nil, bottom: containerView.bottomAnchor, right: nil, padding: .zero, size: .init(width: 100, height: 25))
        timeLabel.centerXAnchor.constraint(equalTo: miniImageView.centerXAnchor).isActive = true
        
        
    }
    
    public func setupBoldAttributedText(text: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: text, attributes: [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font: UIFont.boldSourceSansPro(ofSize: 14)])
        
        return attributedString
    }
    
    public func setupNormalAttributedText(text: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: text, attributes: [NSAttributedStringKey.foregroundColor: ColorCodes.lightGrayText, NSAttributedStringKey.font: UIFont.sourceSansPro(ofSize: 14)])
        
        return attributedString
    }
    
    public func setupPurpleBoldAttributedText(text: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: text, attributes: [NSAttributedStringKey.foregroundColor: ColorCodes.darkPurple, NSAttributedStringKey.font: UIFont.boldSourceSansPro(ofSize: 14)])
        
        return attributedString
    }
    
}







