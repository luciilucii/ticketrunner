//
//  EventRewardsHeaderCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 04.11.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class EventRewardsHeaderCell: TableCell, RewardsContainerEventCellDelegate {
    
    var controller: EventRewardsTableController?
    
    var event: Event? {
        didSet {
            rewardsContainer.event = event
        }
    }
    
    lazy var rewardsContainer: RewardsContainer = {
        let container = RewardsContainer()
        container.delegate = self
        return container
    }()
    
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(rewardsContainer)
        
        rewardsContainer.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func shouldShowTriangles() -> Bool {
        return true
    }
    
    func progressBarBackgroundWidth() -> CGFloat {
        guard let width = controller?.view.frame.width else { return 0}
        return width
    }
    
    func shouldProgressBarAnimate() -> Bool {
        return true
    }
    
}
