//
//  EventRewardContainerView.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 09.10.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class EventRewardContainerView: CustomUIView, ProgressBarContainerDelegate {
    
    var event: Event? {
        didSet {
            
        }
    }
    
    let promoteTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0)
        label.text = "Rewards"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let soldTicketsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red:0.25, green:0.89, blue:0.56, alpha:1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let promoteBarContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var progressBarContainer: ProgressBarContainer = {
        let container = ProgressBarContainer()
        container.delegate = self
        return container
    }()
    
    lazy var eventRewardsContainer: EventRewardsContainer = {
        let container = EventRewardsContainer()
        return container
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(promoteTitleLabel)
        addSubview(soldTicketsLabel)
        addSubview(progressBarContainer)
        addSubview(eventRewardsContainer)
        
        promoteTitleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        soldTicketsLabel.anchor(top: promoteTitleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 25)
        
        progressBarContainer.anchor(top: soldTicketsLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 150)
        
        eventRewardsContainer.anchor(top: progressBarContainer.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
    
    func shouldShowTriangles() -> Bool {
        return true
    }
    
    func shouldProgressBarAnimate() -> Bool {
        return true
    }
    
    func progressBarBackgroundWidth() -> CGFloat {
        return self.frame.width - 16
    }
    
}
