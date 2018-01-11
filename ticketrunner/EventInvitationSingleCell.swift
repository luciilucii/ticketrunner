//
//  EventInvitationSingleCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 23.12.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class EventInvitationSingleCell: BaseCell {
    
    var event: Event? {
        didSet {
            guard let event = event else { return }
        }
    }
    
    let whiteBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        //        view.clipsToBounds = true
        return view
    }()
    
    let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    var delegate: EventCellDelegate?
    
    let eventImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .brown
        imageView.image = #imageLiteral(resourceName: "event_neu")
        return imageView
    }()
    
    let genreLabel: SmallTextLabel = {
        let label = SmallTextLabel()
        label.text = "Electronic"
        label.textColor = ColorCodes.textColorGrey
        label.backgroundColor = ColorCodes.lightGrayText
        label.textAlignment = .center
        label.clipsToBounds = true
        return label
    }()
    
    let dateLabel: SmallTextLabel = {
        let label = SmallTextLabel()
        label.text = "15/02/2018"
        label.textColor = ColorCodes.textColorGrey
        label.backgroundColor = ColorCodes.lightGrayText
        label.textAlignment = .center
        label.clipsToBounds = true
        return label
    }()
    
    let eventTitleLabel: H1 = {
        let label = H1()
        label.text = "Panama Open Air Festival 2018"
        label.numberOfLines = 2
        return label
    }()
    
    let subtitleLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.text = "Dresselndorfer Str. 25 Burbach, Germany"
        label.textAlignment = .center
        return label
    }()
    
    let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCodes.controllerBackground
        return view
    }()
    
    let rewardIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Icon Ticket")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var checkmarkButton: TicketrunnerGreenButton = {
        let button = TicketrunnerGreenButton(title: "Y")
        button.addTarget(self, action: #selector(handleYes), for: .touchUpInside)
        return button
    }()
    
    lazy var rejectButton: TicketrunnerRedGradientButton = {
        let button = TicketrunnerRedGradientButton(title: "N")
        button.addTarget(self, action: #selector(handleNo), for: .touchUpInside)
        return button
    }()
    
    let rewardsLabel: NormalTextLabel = {
        let label = NormalTextLabel()
//        label.attributedText = NSMutableAttributedString(attributedString: NSAttributedString()
        
        let attributedString = NSMutableAttributedString(string: "VIP Access, Cloting, Hats, Drinks for free and something more text too", attributes: [NSAttributedStringKey.font: UIFont.sourceSansPro(ofSize: 14), NSAttributedStringKey.foregroundColor: ColorCodes.lightGrayText])
        
        label.attributedText = attributedString
        label.numberOfLines = 0
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        layer.cornerRadius = 5
        clipsToBounds = true
        backgroundColor = .clear
        
        whiteBackgroundView.layer.shadowOpacity = 0.4
        whiteBackgroundView.layer.shadowOffset = CGSize(width: 3.0, height: 2.0)
        whiteBackgroundView.layer.shadowColor = UIColor.darkGray.cgColor
        whiteBackgroundView.layer.shadowRadius = 5.0
        
        addSubview(whiteBackgroundView)
        addSubview(whiteView)
        
        whiteBackgroundView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
        whiteView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
        
        
        
        whiteView.addSubview(eventImageView)
        whiteView.addSubview(genreLabel)
        whiteView.addSubview(dateLabel)
        whiteView.addSubview(eventTitleLabel)
        whiteView.addSubview(subtitleLabel)
        whiteView.addSubview(seperatorView)
        
        whiteView.addSubview(rewardsLabel)
        whiteView.addSubview(rewardIconImageView)
        
        whiteView.addSubview(checkmarkButton)
        whiteView.addSubview(rejectButton)
        
        eventImageView.anchor(top: whiteView.topAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 120)
        
        genreLabel.anchor(top: nil, left: whiteView.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 100, height: 20)
        genreLabel.centerYAnchor.constraint(equalTo: eventImageView.bottomAnchor).isActive = true
        genreLabel.layer.cornerRadius = 10
        
        dateLabel.anchor(top: nil, left: nil, bottom: nil, right: whiteView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 100, height: 20)
        dateLabel.centerYAnchor.constraint(equalTo: eventImageView.bottomAnchor).isActive = true
        dateLabel.layer.cornerRadius = 10
        
        eventTitleLabel.anchor(top: genreLabel.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 38)
        
        subtitleLabel.anchor(top: eventTitleLabel.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 25)
        
        seperatorView.anchor(top: subtitleLabel.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        
        
        
        
        rewardsLabel.anchor(top: seperatorView.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 8, paddingLeft: 25 + 8 + 4, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
        rewardIconImageView.anchor(top: nil, left: whiteView.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 25, height: 25)
        rewardIconImageView.centerYAnchor.constraint(equalTo: rewardsLabel.centerYAnchor).isActive = true
        
        
        checkmarkButton.anchor(top: rewardsLabel.bottomAnchor, left: nil, bottom: nil, right: whiteView.centerXAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 32, width: 40, height: 40)
        checkmarkButton.layer.cornerRadius = 20
        
        rejectButton.anchor(top: rewardsLabel.bottomAnchor, left: whiteView.centerXAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 32, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
        rejectButton.layer.cornerRadius = 20
        
    }
    
    @objc func handleYes() {
        print("YES")
    }
    
    @objc func handleNo() {
        print("NO")
    }
    
}









