//
//  InProgressCVCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 04.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class InProgressCVCell: BaseCell, ProgressBarContainerDelegate {
    
    var reward: Reward? {
        didSet {
            progressBarContainer.reward = reward
        }
    }
    
    let rewardImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.image = #imageLiteral(resourceName: "event_neu")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let titleLabel: H2 = {
        let label = H2()
        label.text = "Free VIP Ticket"
        label.textAlignment = .left
        return label
    }()
    
    let eventLabel: H3 = {
        let label = H3()
        label.text = "Panama Open Air 2018"
        label.textColor = ColorCodes.darkPurple
        label.textAlignment = .left
        return label
    }()
    
    let leftLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.text = "18/25 left"
        return label
    }()
    
    lazy var progressBarContainer: ProgressBarContainer = {
        let container = ProgressBarContainer()
        container.delegate = self
        container.inProgressCell = self
        return container
    }()
    
    let seperatorView = UIView()
    
    override func setupViews() {
        super.setupViews()
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, eventLabel, leftLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        backgroundColor = .white
        
        addSubview(rewardImageView)
        addSubview(progressBarContainer)
        addSubview(stackView)
        
        rewardImageView.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
        rewardImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        rewardImageView.layer.cornerRadius = 40/2
        
        progressBarContainer.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 100, height: 40)
        progressBarContainer.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        stackView.anchor(top: topAnchor, left: rewardImageView.rightAnchor, bottom: bottomAnchor, right: progressBarContainer.leftAnchor, paddingTop: 8, paddingLeft: 16, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
        
        seperatorView.backgroundColor = ColorCodes.inactiveElementsGrey
        
        addSubview(seperatorView)
        
        seperatorView.anchor(top: nil, left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor, padding: .zero, size: .init(width: 0, height: 0.5))
        
    }
    
    func shouldShowTriangles() -> Bool {
        return false
    }
    
    func progressBarBackgroundWidth() -> CGFloat {
        return 100
    }
    
    func shouldProgressBarAnimate() -> Bool {
        return false
    }
    
}








