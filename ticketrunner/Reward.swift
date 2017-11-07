//
//  Reward.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 02.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import Foundation

class Reward {
    
    var id: Int
    var name: String?
    var iconName: String?
    var rewardDescription: String?
    
    var redeemed = false {
        didSet {
            setupCurrentRewardState()
        }
    }
    
    var ticketsToSell: Int? {
        didSet {
            setupCurrentRewardState()
        }
    }
    
    var currentRewardState: RewardState?
    
    
    init(id: Int) {        
        self.id = id
        
        setupOtherStuff()
    }
    
    fileprivate func setupOtherStuff() {
        
    }
    
    func setupCurrentRewardState() {
        //TODO: Dont hardcode the 8, get the ticketpoints of the user
        
        guard let pointsToUnlock = ticketsToSell else { return }
        
        if pointsToUnlock >= 8 && redeemed == false {
            self.currentRewardState = .inProgress
        } else if pointsToUnlock < 8 && redeemed == false {
            self.currentRewardState = .unlocked
        } else {
            self.currentRewardState = .redeemed
        }
    }
    
}

enum RewardState {
    case inProgress
    case unlocked
    case redeemed
}
