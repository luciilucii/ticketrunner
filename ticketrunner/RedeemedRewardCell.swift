//
//  RedeemedRewardCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 09.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class RedeemedRewardCell: BaseCell {
    
    let whiteView = WhiteView()
    let view = UIView()
    
    let backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Crowd")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let rewardImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.image = #imageLiteral(resourceName: "event_neu")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderColor = ColorCodes.homeYellow.cgColor
        iv.layer.borderWidth = 2
        return iv
    }()
    
    let titleLabel: H1 = {
        let label = H1()
        label.text = "1 10€ Merchandise\nGutschein"
        label.numberOfLines = 2
        return label
    }()
    
    let eventLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.font = UIFont.boldSourceSansPro(ofSize: 16)
        label.text = "Night of Freestyle\nBremen 2018 (Show 1)"
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    let rewardLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.text = "for first 3 tickets sold"
        label.textAlignment = .center
        return label
    }()
    
    let infoButton: TicketrunnerBorderedButton = {
        let button = TicketrunnerBorderedButton(title: "Info")
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(handleInfo), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .clear
        
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        
        
        addSubview(whiteView)
        addSubview(view)
        
        whiteView.anchor(top: topAnchor, left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .zero)
        
        view.anchor(top: topAnchor, left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .zero)
        
        view.addSubview(backgroundImageView)
        view.addSubview(rewardImageView)
        view.addSubview(titleLabel)
        view.addSubview(eventLabel)
        view.addSubview(rewardLabel)
        view.addSubview(infoButton)
        
        backgroundImageView.anchor(top: view.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padding: .zero, size: .init(width: 0, height: 100))
        
        if #available(iOS 10.0, *) {
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.regular)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.alpha = 0.75
            blurEffectView.frame = backgroundImageView.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            backgroundImageView.addSubview(blurEffectView)
        }
        
        rewardImageView.anchor(top: nil, left: nil, bottom: nil, right: nil, padding: .zero, size: .init(width: 100, height: 100))
        rewardImageView.layer.cornerRadius = 100/2
        rewardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        rewardImageView.centerYAnchor.constraint(equalTo: backgroundImageView.bottomAnchor).isActive = true
        
        titleLabel.anchor(top: rewardImageView.bottomAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 60))
        
        eventLabel.anchor(top: titleLabel.bottomAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 50))
        
        rewardLabel.anchor(top: eventLabel.bottomAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 30))
        
        infoButton.anchor(top: rewardLabel.bottomAnchor, left: nil, bottom: nil, right: nil, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: .init(width: 160, height: 40))
        infoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
    }
    
    @objc func handleInfo() {
        print("info")
    }
    
}








