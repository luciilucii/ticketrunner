//
//  EventRewardCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 14.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class EventRewardCell: BaseCell {
    
    var currentEvent: Event? {
        didSet {
            
            guard let event = currentEvent else {
                return
            }
            
            progressBar.event = event
        }
    }
    
    var rewards: [Reward]?
    var rewardsHeight: CGFloat = 0
    
    var eventRewardsContainer: EventRewardsContainer? {
        didSet {
            
            guard let container = eventRewardsContainer else {
                return
            }
            container.rewards = rewards
            
            rewardsHeight = container.getHeight() - 133
            
            addSubview(eventImageView)
            addSubview(titleLabel)
            addSubview(promoteBarContainerView)
            addSubview(container)
            
            addContraintsWithFormat(format: "H:|[v0]|", views: eventImageView)
            
            addContraintsWithFormat(format: "H:|-16-[v0]-16-|", views: titleLabel)
            addContraintsWithFormat(format: "V:|[v0(100)][v1(40)]-8-[v2(85)][v3(\(rewardsHeight))]", views: eventImageView, titleLabel, promoteBarContainerView, container)
            
            addContraintsWithFormat(format: "H:|-8-[v0]-8-|", views: promoteBarContainerView)
            
            addContraintsWithFormat(format: "H:|[v0]|", views: container)
            
        }
    }
    
    let eventImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .green
        iv.image = UIImage(named: "event")
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Masquerade & Crime - Um Vaters Willen, Hercule Poirot ermittelt!"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let promoteBarContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var progressBar: ProgressBarContainer = {
        let container = ProgressBarContainer()
        let width = self.frame.width - 16
        container.progressBackgroundBarWidthAnchor = width
        container.shouldTrianglesShowUp = true
        return container
    }()
    
    let progressBarContainer: ProgressBarContainer = {
        let container = ProgressBarContainer()
        container.event = EventResource().getEvent()
        container.shouldTrianglesShowUp = true
        return container
    }()
    
    let soldTicketsLabel: UILabel = {
        let label = UILabel()
        label.text = "12"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red:0.25, green:0.89, blue:0.56, alpha:1.0)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        setupPromoteBarContainer()
    }
    
    func setupPromoteBarContainer() {
        promoteBarContainerView.addSubview(soldTicketsLabel)
        promoteBarContainerView.addSubview(progressBar)
        
        promoteBarContainerView.addContraintsWithFormat(format: "H:|-8-[v0]-8-|", views: progressBar)
        promoteBarContainerView.addContraintsWithFormat(format: "V:|[v0(30)]-8-[v1]-8-|", views: soldTicketsLabel, progressBar)
        promoteBarContainerView.addContraintsWithFormat(format: "H:|-8-[v0]-8-|", views: soldTicketsLabel)
        
        
    }
    
}
