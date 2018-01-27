//
//  HomeEventContainerCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 09.12.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class HomeEventContainerCell: BaseCell, ProgressBarContainerDelegate {
    
    var event: Event? {
        didSet {
            guard let event = event else { return }
            progressContainer.event = event
        }
    }
    
    var shouldAnimateProgressBar = true {
        didSet {
            progressContainer.animateProgressBar = shouldAnimateProgressBar
        }
    }
    
    let whiteBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
//        view.clipsToBounds = true
        return view
    }()
    
    let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    var delegate: EventCellDelegate?
    
    let eventImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .brown
        imageView.image = #imageLiteral(resourceName: "event_neu")
        return imageView
    }()
    
    let genreLabel: SmallTextLabel = {
        let label = SmallTextLabel()
        label.text = "Electronic"
        label.textColor = ColorCodes.textColorGrey
        label.backgroundColor = ColorCodes.lightGrayText
        label.textAlignment = .center
        label.clipsToBounds = true
        return label
    }()
    
    let dateLabel: SmallTextLabel = {
        let label = SmallTextLabel()
        label.text = "15/02/2018"
        label.textColor = ColorCodes.textColorGrey
        label.backgroundColor = ColorCodes.lightGrayText
        label.textAlignment = .center
        label.clipsToBounds = true
        return label
    }()
    
    let eventTitleLabel: H1 = {
        let label = H1()
        label.text = "Panama Open Air Festival 2018"
        label.numberOfLines = 2
        return label
    }()
    
    let subtitleLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.text = "Dresselndorfer Str. 25 Burbach, Germany"
        label.textAlignment = .center
        return label
    }()
    
    let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCodes.controllerBackground
        return view
    }()
    
    let ticketPointsLabel: H1 = {
        let label = H1()
        label.text = "1.926°"
        return label
    }()
    
    lazy var progressContainer: ProgressBarContainer = {
        let container = ProgressBarContainer()
        container.delegate = self
        container.isProgressBarGradient = true
        container.ticketProgressLabelForReward.isHidden = true
        return container
    }()
    
    let rewardsUnlockedLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.text = "6/10 Rewards unlocked"
        label.textAlignment = .center
        return label
    }()
    
    let seperatorContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCodes.controllerBackground
        return view
    }()
    
    lazy var promoteButton: TicketrunnerRedGradientButton = {
        let button = TicketrunnerRedGradientButton(title: "Promote")
        button.addTarget(self, action: #selector(handlePromote), for: .touchUpInside)
        button.applyGradient(colours: [ColorCodes.ticketrunnerRed.cgColor, ColorCodes.gradientPurple.cgColor])
        
        return button
    }()
    
    lazy var eventInfoButton: TicketrunnerBorderedButton = {
        let button = TicketrunnerBorderedButton(title: "Event Info")
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(handleInfo), for: .touchUpInside)
        return button
    }()
    
    lazy var historyButton: TicketrunnerBorderedButton = {
        let button = TicketrunnerBorderedButton(title: "History")
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(handleInfo), for: .touchUpInside)
        return button
    }()
    
    lazy var leaderboardButton: TicketrunnerBorderedButton = {
        let button = TicketrunnerBorderedButton(title: "Leaderboard")
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(handleLeaderboard), for: .touchUpInside)
        return button
    }()
    
    lazy var rewardsButton: TicketrunnerBorderedButton = {
        let button = TicketrunnerBorderedButton(title: "Rewards")
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(handleRewards), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
                
        layer.cornerRadius = 5
        clipsToBounds = true
        backgroundColor = .clear
        
        whiteBackgroundView.layer.shadowOpacity = 0.4
        whiteBackgroundView.layer.shadowOffset = CGSize(width: 3.0, height: 2.0)
        whiteBackgroundView.layer.shadowColor = UIColor.darkGray.cgColor
        whiteBackgroundView.layer.shadowRadius = 5.0
        
        addSubview(whiteBackgroundView)
        addSubview(whiteView)
        
        whiteBackgroundView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
        whiteView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
        
        
        whiteView.addSubview(eventImageView)
        whiteView.addSubview(genreLabel)
        whiteView.addSubview(dateLabel)
        whiteView.addSubview(eventTitleLabel)
        whiteView.addSubview(subtitleLabel)
        whiteView.addSubview(seperatorView)
        
        whiteView.addSubview(ticketPointsLabel)
        whiteView.addSubview(progressContainer)
        whiteView.addSubview(rewardsUnlockedLabel)
        whiteView.addSubview(seperatorContainerView)
        
        whiteView.addSubview(promoteButton)
        whiteView.addSubview(eventInfoButton)
        whiteView.addSubview(historyButton)
        whiteView.addSubview(leaderboardButton)
        whiteView.addSubview(rewardsButton)
        
        eventImageView.anchor(top: whiteView.topAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 120)
        
        genreLabel.anchor(top: nil, left: whiteView.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 100, height: 20)
        genreLabel.centerYAnchor.constraint(equalTo: eventImageView.bottomAnchor).isActive = true
        genreLabel.layer.cornerRadius = 10
        
        dateLabel.anchor(top: nil, left: nil, bottom: nil, right: whiteView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 100, height: 20)
        dateLabel.centerYAnchor.constraint(equalTo: eventImageView.bottomAnchor).isActive = true
        dateLabel.layer.cornerRadius = 10
        
        eventTitleLabel.anchor(top: genreLabel.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 38)
        
        subtitleLabel.anchor(top: eventTitleLabel.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 25)
        
        seperatorView.anchor(top: subtitleLabel.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        
        
        ticketPointsLabel.anchor(top: seperatorView.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 30)
        
        progressContainer.anchor(top: ticketPointsLabel.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 40)
        
        rewardsUnlockedLabel.anchor(top: progressContainer.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 20)
        
        seperatorContainerView.anchor(top: rewardsUnlockedLabel.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        
        
        
        promoteButton.anchor(top: seperatorContainerView.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
        eventInfoButton.anchor(top: promoteButton.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.centerXAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 4, width: 0, height: 50)
        
        historyButton.anchor(top: eventInfoButton.topAnchor, left: whiteView.centerXAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 0, paddingLeft: 4, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
        leaderboardButton.anchor(top: eventInfoButton.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.centerXAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 4, width: 0, height: 50)
        
        rewardsButton.anchor(top: eventInfoButton.bottomAnchor, left: whiteView.centerXAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 8, paddingLeft: 4, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
        
        promoteButton.applyGradient(colours: [ColorCodes.ticketrunnerRed.cgColor, UIColor.black.cgColor])
        
    }
    
    @objc func handlePromote() {
        guard let event = event else { return }
        delegate?.didTapPromote(event: event)
    }
    
    @objc func handleInfo() {
        guard let event = event else { return }
        delegate?.didTapEventInfo(event: event)
    }
    
    @objc func handleLeaderboard() {
        guard let event = event else { return }
        delegate?.didTapLeaderboards(event: event)
    }
    
    @objc func handleRewards() {
        guard let event = event else { return }
        delegate?.didTapRewards(event: event)
    }
    
    func shouldShowTriangles() -> Bool {
        return false
    }
    
    func progressBarBackgroundWidth() -> CGFloat {
        return (250 - 16)
    }
    
    func shouldProgressBarAnimate() -> Bool {
        return false
    }
    
}








