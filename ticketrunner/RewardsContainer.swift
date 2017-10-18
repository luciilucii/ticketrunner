//
//  RewardsContainer.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 11.10.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

protocol RewardsContainerEventCellDelegate {
    
    func shouldShowTriangles() -> Bool
    func progressBarBackgroundWidth() -> CGFloat
    func shouldProgressBarAnimate() -> Bool
    
}

class RewardsContainer: CustomUIView, ProgressBarContainerDelegate {
    
    var event: Event? {
        didSet {
            progressBar.event = self.event
        }
    }
    
    var animateProgressBar = true {
        didSet {
            progressBar.animateProgressBar = animateProgressBar
        }
    }
    
    var delegate: RewardsContainerEventCellDelegate?
    
    lazy var progressBar: ProgressBarContainer = {
        let container = ProgressBarContainer()
        container.delegate = self
        return container
    }()
    
    let soldTicketsLabel: TicketrunnerPointsLabel = {
        let label = TicketrunnerPointsLabel()
        label.text = "9.542°"
        return label
    }()
    
    let rewardsUnlockedLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.text = "6/10 rewards unlocked"
        label.textAlignment = .center
        label.textColor = ColorCodes.lightGrayText
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        
        addSubview(progressBar)
        addSubview(soldTicketsLabel)
        addSubview(rewardsUnlockedLabel)
        
        soldTicketsLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        rewardsUnlockedLabel.anchor(top: soldTicketsLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        progressBar.anchor(top: rewardsUnlockedLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
        
        
    }
    
    func shouldShowTriangles() -> Bool {
        return delegate?.shouldShowTriangles() ?? false
    }
    
    func progressBarBackgroundWidth() -> CGFloat {
        let keyWindow = UIApplication.shared.keyWindow
        guard let keyWindowWidth = keyWindow?.frame.width else { return 0 }
        return keyWindowWidth - 32
    }
    
    func shouldProgressBarAnimate() -> Bool {
        return delegate?.shouldProgressBarAnimate() ?? true
    }
    
}












