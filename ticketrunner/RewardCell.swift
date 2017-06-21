//
//  RewardCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 02.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class RewardCell: BaseCell {
    
    var reward: Reward?
    
    var progressBarContainer: ProgressBarContainer? {
        didSet {
            
            guard let container = progressBarContainer else {
                return
            }
            
            guard let widthAnchor = container.progressBackgroundBarWidthAnchor else {
                return
            }
            
            let width = widthAnchor
            
            addSubview(container)
            
            addContraintsWithFormat(format: "V:|-9-[v0]-9-|", views: container)
            addContraintsWithFormat(format: "H:[v0(\(width))]-8-|", views: container)
            
        }
    }
    
    let rewardImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "gift")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = UIColor(red:0.97, green:0.75, blue:0.30, alpha:1.0)
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let rewardTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textAlignment = .left
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let rewardSubtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "for first 50 tickets sold"
        label.textAlignment = .left
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let seperatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0)
        return view
    }()
    
    let rewardAchievedImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.isHidden = true
        iv.image = UIImage(named: "Checkmark")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(rewardImageView)
        addSubview(rewardTitleLabel)
        addSubview(rewardSubtitleLabel)
        addSubview(seperatorView)
        addSubview(rewardAchievedImageView)
        
        //x,y,w,h
        rewardImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        rewardImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        rewardImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        rewardImageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        //x,y,w,h
        rewardTitleLabel.bottomAnchor.constraint(equalTo: centerYAnchor).isActive = true
        rewardTitleLabel.leftAnchor.constraint(equalTo: rewardImageView.rightAnchor, constant: 4).isActive = true
        rewardTitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -116).isActive = true
        rewardTitleLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        //x,y,w,h
        rewardSubtitleLabel.topAnchor.constraint(equalTo: rewardTitleLabel.bottomAnchor).isActive = true
        rewardSubtitleLabel.leftAnchor.constraint(equalTo: rewardTitleLabel.leftAnchor).isActive = true
        rewardSubtitleLabel.rightAnchor.constraint(equalTo: rewardTitleLabel.rightAnchor).isActive = true
        rewardSubtitleLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        //x,y,w,h
        seperatorView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        seperatorView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        seperatorView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        seperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //x,y,w,h
        rewardAchievedImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        rewardAchievedImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        rewardAchievedImageView.leftAnchor.constraint(equalTo: rewardTitleLabel.rightAnchor, constant: 8).isActive = true
        rewardAchievedImageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
    }
    
}











