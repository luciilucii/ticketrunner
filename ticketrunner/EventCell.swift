//
//  EventCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 28.05.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

protocol EventCellDelegate {
    func didTapPromote(event: Event)
    
    func didTapRewards(event: Event)
    
    func didTapEventInfo(event: Event)
    
    func didTapLeaderboards(event: Event)
}

class EventCell: UICollectionViewCell, ProgressBarContainerDelegate {
    
    var delegate: EventCellDelegate?
    
    //INFO: Height of the Eventcell is 419 + imageview
    
    var currentEvent: Event? {
        didSet {
            guard let event = currentEvent else { return }
            progressBar.event = event
        }
    }
    
    var shouldAnimateProgressBar = true {
        didSet {
            progressBar.animateProgressBar = shouldAnimateProgressBar
        }
    }
    
    let eventInfoView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    let progressBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    let eventImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .green
        iv.image = #imageLiteral(resourceName: "event_neu")
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Masquerade & Crime - Um Vaters Willen, Hercule Poirot ermittelt!"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "01/09/2017"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return label
    }()
    
    let streetLabel: UILabel = {
        let label = UILabel()
        label.text = "Körnebachstraße 72"
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Cologne, Germany"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //Cut
    
    let promoteBarContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
    
    //next Cut
    
    lazy var promoteButton: TicketrunnerBlueButton = {
        let button = TicketrunnerBlueButton(title: "Promote")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlePromote), for: .touchUpInside)
        return button
    }()
    
    func handlePromote() {
        guard let event = currentEvent else { return }
        delegate?.didTapPromote(event: event)
    }
    
    lazy var rewardsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Rewards", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0), for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(handleRewards), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()
    
    func handleRewards() {
        guard let event = currentEvent else { return }
        delegate?.didTapRewards(event: event)
    }
    
    lazy var eventInfoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Event Info", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0), for: .normal)
        button.addTarget(self, action: #selector(handleEventInfo), for: .touchUpInside)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 5
        return button
    }()
    
    func handleEventInfo() {
        guard let event = currentEvent else { return }
        delegate?.didTapEventInfo(event: event)
    }
    
    lazy var leaderboardButton: UIButton = {
        let button = UIButton()
        button.setTitle("Leaderboard", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0), for: .normal)
        button.addTarget(self, action: #selector(handleEventLeaderboard), for: .touchUpInside)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 5
        return button
    }()
    
    func handleEventLeaderboard() {
        guard let event = currentEvent else { return }
        delegate?.didTapLeaderboards(event: event)
    }
    
    var cellWidth: CGFloat?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cellWidth = frame.width
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        setupPromoteBarContainer()
        
        addSubview(eventInfoView)
        addSubview(progressBackgroundView)
        
        eventInfoView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 230)
        
        progressBackgroundView.anchor(top: eventInfoView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 116)
        
        
        eventInfoView.addSubview(eventImageView)
        eventInfoView.addSubview(titleLabel)
        eventInfoView.addSubview(dateLabel)
        eventInfoView.addSubview(streetLabel)
        eventInfoView.addSubview(locationLabel)
        
        
        
        progressBackgroundView.addSubview(promoteBarContainerView)
        
        
        addSubview(promoteButton)
        addSubview(rewardsButton)
        addSubview(eventInfoButton)
        addSubview(leaderboardButton)
        
        //x,y,w,h
        guard let cellWidth = cellWidth else { return }
        eventImageView.anchor(top: eventInfoView.topAnchor, left: eventInfoView.leftAnchor, bottom: nil, right: eventInfoView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: cellWidth / 2.7)
        
        
        
        
        //x,y,w,h
        titleLabel.leftAnchor.constraint(equalTo: eventInfoView.leftAnchor, constant: 8).isActive = true
        titleLabel.topAnchor.constraint(equalTo: eventImageView.bottomAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: eventInfoView.rightAnchor, constant: -8).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        //x,y,w,h
        streetLabel.leftAnchor.constraint(equalTo: eventInfoView.leftAnchor, constant: 8).isActive = true
        streetLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        streetLabel.rightAnchor.constraint(equalTo: centerXAnchor).isActive = true
        streetLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        //x,y,w,h
        dateLabel.rightAnchor.constraint(equalTo: eventInfoView.rightAnchor, constant: -8).isActive = true
        dateLabel.topAnchor.constraint(equalTo: streetLabel.topAnchor).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        //x,y,w,h
        locationLabel.leftAnchor.constraint(equalTo: streetLabel.leftAnchor).isActive = true
        locationLabel.topAnchor.constraint(equalTo: streetLabel.bottomAnchor).isActive = true
        locationLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        locationLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        
        //x,y,w,h
        promoteBarContainerView.topAnchor.constraint(equalTo: progressBackgroundView.topAnchor, constant: 8).isActive = true
        promoteBarContainerView.leftAnchor.constraint(equalTo: progressBackgroundView.leftAnchor, constant: 8).isActive = true
        promoteBarContainerView.rightAnchor.constraint(equalTo: progressBackgroundView.rightAnchor, constant: -8).isActive = true
        promoteBarContainerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        
        //x,y,w,h
        promoteButton.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        promoteButton.topAnchor.constraint(equalTo: progressBackgroundView.bottomAnchor, constant: 4).isActive = true
        promoteButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        promoteButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //x,y,w,h
        rewardsButton.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        rewardsButton.topAnchor.constraint(equalTo: promoteButton.bottomAnchor, constant: 4).isActive = true
        rewardsButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        rewardsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //x,y,w,h
        eventInfoButton.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        eventInfoButton.topAnchor.constraint(equalTo: rewardsButton.bottomAnchor, constant: 4).isActive = true
        eventInfoButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        eventInfoButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        leaderboardButton.anchor(top: eventInfoButton.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        
    }
    
    func setupPromoteBarContainer() {
        
        promoteBarContainerView.addSubview(soldTicketsLabel)
        promoteBarContainerView.addSubview(progressBar)
        
        promoteBarContainerView.addContraintsWithFormat(format: "H:|-8-[v0]-8-|", views: progressBar)
        promoteBarContainerView.addContraintsWithFormat(format: "V:|[v0(30)]-8-[v1]-8-|", views: soldTicketsLabel, progressBar)
        promoteBarContainerView.addContraintsWithFormat(format: "H:|-8-[v0]-8-|", views: soldTicketsLabel)
    }
    
    func shouldShowTriangles() -> Bool {
        return true
    }
    
    func progressBarBackgroundWidth() -> CGFloat {
        let width = self.frame.width - 16
        return width
    }
    
    func shouldProgressBarAnimate() -> Bool {
        return true
    }
}








