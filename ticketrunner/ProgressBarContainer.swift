//
//  ProgressBarContainer.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 03.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class ProgressBarContainer: UIView {
    
    var event: Event?
    var reward: Reward?
    
    var shouldTrianglesShowUp: Bool!
    
    var rewardCell: RewardCell?
    
    var timer: Timer?
    
    var greenBarWidth: CGFloat? {
        didSet {
            timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(animateGreenBar), userInfo: nil, repeats: false)
        }
    }
    
    var progressBackgroundBarWidthAnchor: CGFloat? {
        didSet {
            
            if event != nil {
                if shouldTrianglesShowUp == true {
                    setupTriangles()
                }
                
                guard let event = event else {
                    return 
                }
                setupPromoteBarProgress(forEvent: event)
            }
            
            if reward != nil {
                
                guard let reward = reward else {
                    return
                }
                
                ticketProgressLabelForReward.isHidden = false
                setupPromoteBarProgress(forReward: reward)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
    }
    
    let promoteBackgroundBarView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0)
        return view
    }()
    
    let rewardsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.darkGray
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    let triangleImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "triangle-small")?.withRenderingMode(.alwaysTemplate)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.tintColor = UIColor(red:0.98, green:0.68, blue:0.39, alpha:1.0)
        iv.backgroundColor = .red
        return iv
    }()
    
    let ticketProgressLabelForReward: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        label.layer.zPosition = 1
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = ""
        return label
    }()
    
    func setupViews() {
        
        addSubview(promoteBackgroundBarView)
        
        addContraintsWithFormat(format: "H:|[v0]|", views: promoteBackgroundBarView)
        addContraintsWithFormat(format: "V:|[v0(32)]", views: promoteBackgroundBarView)
        
        promoteBackgroundBarView.addSubview(ticketProgressLabelForReward)
        
        //x,y,w,h
        ticketProgressLabelForReward.centerXAnchor.constraint(equalTo: promoteBackgroundBarView.centerXAnchor).isActive = true
        ticketProgressLabelForReward.centerYAnchor.constraint(equalTo: promoteBackgroundBarView.centerYAnchor).isActive = true
        ticketProgressLabelForReward.heightAnchor.constraint(equalToConstant: 30).isActive = true
        ticketProgressLabelForReward.widthAnchor.constraint(equalTo: promoteBackgroundBarView.widthAnchor).isActive = true
    }
    
    func setupTriangles() {
        
        guard let event = event else {
            return
        }
        guard let eventRewards = event.rewards else {
            return
        }
        
        var eventHighestReward = 0
        eventHighestReward = checkForHighestReward(rewards: eventRewards)
        
        for reward in eventRewards {
            
            let iv = UIImageView()
            iv.image = UIImage(named: "triangle-small")?.withRenderingMode(.alwaysTemplate)
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.contentMode = .scaleAspectFit
            iv.tintColor = UIColor(red:0.98, green:0.68, blue:0.39, alpha:1.0)
            
            addSubview(iv)
            
            let centerXConstant = setupTriangleLeftAnchorConstant(eventHighestReward: eventHighestReward, reward: reward)
            guard let widthAnchor = progressBackgroundBarWidthAnchor else {
                return
            }
            
            if centerXConstant >= widthAnchor || centerXConstant == 0 {
                iv.isHidden = true
            } else {
                iv.isHidden = false
            }
            
            iv.topAnchor.constraint(equalTo: promoteBackgroundBarView.bottomAnchor).isActive = true
            iv.centerXAnchor.constraint(equalTo: promoteBackgroundBarView.leftAnchor, constant: centerXConstant).isActive = true
            iv.heightAnchor.constraint(equalToConstant: 10).isActive = true
            iv.widthAnchor.constraint(equalToConstant: 10).isActive = true
            
        }
    }
    
    func setupTriangleLeftAnchorConstant(eventHighestReward: Int, reward: Reward) -> CGFloat {
        
        guard let ticketsToSellForReward = reward.ticketsToSell else {
            return 0
        }
        guard let widthAnchor = progressBackgroundBarWidthAnchor else {
            return 0
        }
        let constant = widthAnchor / CGFloat(eventHighestReward) * CGFloat(ticketsToSellForReward)
        
        return constant
    }
    
    func checkForHighestReward(rewards: [Reward]) -> Int {
        
        var highestReward = 0
        
        for reward in rewards {
            guard let rewardTicketsToSell = reward.ticketsToSell else {
                return 0
            }
            if rewardTicketsToSell >= highestReward {
                highestReward = rewardTicketsToSell
            }
        }
        return highestReward
    }
    
    func setupPromoteBarProgress(forEvent: Event) {
        
        let ticketsToSell: CGFloat = CGFloat(getTicketsToSellForAllRewardsCount(forEvent: forEvent))
        let ticketsSold: CGFloat = CGFloat(getTicketsSoldCount())
        
        var width: CGFloat = 0
        
        guard let widthAnchorConstant = progressBackgroundBarWidthAnchor else {
            return
        }
        
        if ticketsSold >= ticketsToSell {
            width = widthAnchorConstant
        } else {
            width = widthAnchorConstant / ticketsToSell * ticketsSold
        }
        
        setupPromoteBar(forWidth: width)
    }
    
    func setupPromoteBarProgress(forReward: Reward) {
        
        guard let ticketsToSellForReward = reward?.ticketsToSell else {
            return
        }
        
        let ticketsToSell: CGFloat = CGFloat(ticketsToSellForReward)
        let ticketsSold: CGFloat = CGFloat(getTicketsSoldCount())
        
        var width: CGFloat = 0
        
        guard let widthAnchor = progressBackgroundBarWidthAnchor else {
            return
        }
        
        guard let cell = rewardCell else {
            return
        }
        
        ticketProgressLabelForReward.text = "\(Int(ticketsSold))/\(ticketsToSellForReward)"
        
        if ticketsSold >= ticketsToSell {
            width = widthAnchor
            
            isHidden = true
            cell.rewardAchievedImageView.isHidden = false
            
            setupPromoteBar(forWidth: width)
        } else {
            
            isHidden = false
            cell.rewardAchievedImageView.isHidden = true
            
            width = widthAnchor / ticketsToSell * ticketsSold
            setupPromoteBar(forWidth: width)
        }
    }
    
    let greenBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red:0.25, green:0.89, blue:0.56, alpha:1.0)
        return view
    }()
    
    var greenBarWidthAnchor: NSLayoutConstraint?
    
    func setupPromoteBar(forWidth: CGFloat) {
        
        promoteBackgroundBarView.addSubview(greenBar)
        
        greenBar.leftAnchor.constraint(equalTo: promoteBackgroundBarView.leftAnchor).isActive = true
        greenBar.topAnchor.constraint(equalTo: promoteBackgroundBarView.topAnchor).isActive = true
        greenBar.bottomAnchor.constraint(equalTo: promoteBackgroundBarView.bottomAnchor).isActive = true
        
        greenBarWidthAnchor = greenBar.widthAnchor.constraint(equalToConstant: 0)
        greenBarWidthAnchor?.isActive = true
        
        promoteBackgroundBarView.clipsToBounds = true
        
        greenBarWidth = forWidth
    }
    
    func animateGreenBar() {
        guard let width = greenBarWidth else { return }
        greenBarWidthAnchor?.constant = width
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
    }
    
    func getTicketsSoldCount(/*forEvent: Event*/) -> Int {
        //TODO: Here the code to get the sold tickets for the event
        return 8
    }
    
    func getTicketsToSellForAllRewardsCount(forEvent: Event) -> Int {
        
        guard let rewards = forEvent.rewards else {
            return 0
        }
        let tickets = checkForHighestReward(rewards: rewards)
        
        return tickets
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
