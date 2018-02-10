//
//  RewardInfoModalController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 10.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class RewardInfoModalController: UIViewController {
    
    let whiteView = WhiteView()
    
    lazy var rewardsImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "event_neu")
        return iv
    }()
    
    let titleLabel: H1 = {
        let label = H1()
        label.text = "Name of the reward"
        label.textColor = ColorCodes.darkPurple
        return label
    }()
    
    let descriptionLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.text = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let pointsLabel: H2 = {
        let label = H2()
        label.text = "920°"
        return label
    }()
    
    let separatorView = UIView()
    
    let progressBarBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCodes.inactiveElementsGrey
        view.clipsToBounds = true
        return view
    }()
    
    let progressBarView = GreenBarView()
    
    let rewardsUnlockedLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.text = "6/10 rewards unlocked"
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        separatorView.backgroundColor = ColorCodes.inactiveElementsGrey
        
        setupModalCancelButton()
        
        view.addSubview(whiteView)
        
        whiteView.anchor(top: nil, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 388))
        whiteView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        whiteView.addSubview(rewardsImageView)
        whiteView.addSubview(titleLabel)
        whiteView.addSubview(descriptionLabel)
        whiteView.addSubview(separatorView)
        whiteView.addSubview(pointsLabel)
        whiteView.addSubview(progressBarBackgroundView)
        progressBarBackgroundView.addSubview(progressBarView)
        whiteView.addSubview(rewardsUnlockedLabel)
        
        rewardsImageView.anchor(top: whiteView.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 85, height: 85)
        rewardsImageView.layer.cornerRadius = 85/2
        rewardsImageView.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        
        titleLabel.anchor(top: rewardsImageView.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 30))
        
        descriptionLabel.anchor(top: titleLabel.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 100))
        
        separatorView.anchor(top: descriptionLabel.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0.5))
        
        pointsLabel.anchor(top: separatorView.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 20))
        
        progressBarBackgroundView.anchor(top: pointsLabel.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 8, left: 32, bottom: 0, right: 32), size: .init(width: 0, height: 15))
        progressBarBackgroundView.layer.cornerRadius = 15/2
        
        progressBarView.anchor(top: progressBarBackgroundView.topAnchor, left: progressBarBackgroundView.leadingAnchor, bottom: progressBarBackgroundView.bottomAnchor, right: progressBarBackgroundView.centerXAnchor, padding: .zero, size: .zero)
        
        rewardsUnlockedLabel.anchor(top: progressBarBackgroundView.bottomAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 25))
        
        
    }
    
}







