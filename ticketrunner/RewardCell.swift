//
//  RewardCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 02.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class RewardCell: BaseCell, ProgressBarContainerDelegate {
    
    var reward: Reward? {
        didSet {
            progressBarContainer.reward = reward
        }
    }
    
    let rewardImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.image = #imageLiteral(resourceName: "Icon Merchandise")
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let rewardTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textAlignment = .left
        label.textColor = ColorCodes.textColorGrey
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let rewardSubtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "for first 50 tickets sold"
        label.textAlignment = .left
        label.textColor = ColorCodes.lightGrayText
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
    
    lazy var progressBarContainer: ProgressBarContainer = {
        let container = ProgressBarContainer()
        return container
    }()
    
    override func setupViews() {
        super.setupViews()
        
        progressBarContainer.delegate = self
        progressBarContainer.rewardCell = self
        
        addSubview(rewardImageView)
        addSubview(rewardTitleLabel)
        addSubview(rewardSubtitleLabel)
        addSubview(seperatorView)
        addSubview(rewardAchievedImageView)
        addSubview(progressBarContainer)
        
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
        
        progressBarContainer.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 9, paddingLeft: 0, paddingBottom: 9, paddingRight: 8, width: 100, height: 0)
        
    }
    
    func shouldShowTriangles() -> Bool {
        return false
    }
    
    func shouldProgressBarAnimate() -> Bool {
        return true
    }
    
    func progressBarBackgroundWidth() -> CGFloat {
        return CGFloat(100)
    }
    
}











