//
//  EventTableCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 21.10.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class EventTableCell: TableCell, RewardsContainerEventCellDelegate {
    
    var delegate: EventCellDelegate?
    
    var homeController: HomeTableController? {
        didSet {
            self.cellWidth = self.frame.width
            setupViewsInCell()
        }
    }
    
    //INFO: Height of the Eventcell is 419 + imageview
    
    var currentEvent: Event? {
        didSet {
            guard let eventName = currentEvent?.name else { return }
            self.titleLabel.text = eventName
            
            guard let event = currentEvent else { return }
            rewardsContainer.event = event
        }
    }
    
    var shouldAnimateProgressBar = true {
        didSet {
            rewardsContainer.animateProgressBar = shouldAnimateProgressBar
        }
    }
    
    lazy var eventInfoView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDidTapEventInfoContainer)))
        return view
    }()
    
    let eventImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .green
        iv.image = #imageLiteral(resourceName: "event_neu")
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let titleLabel: H2 = {
        let label = H2()
        label.text = "Masquerade & Crime - Um Vaters Willen, Hercule Poirot ermittelt!"
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "01/09/2017"
        label.textAlignment = .right
        return label
    }()
    
    let streetLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.text = "Körnebachstraße 72"
        label.textAlignment = .left
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.text = "Cologne, Germany"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var rewardsContainer: RewardsContainer = {
        let container = RewardsContainer()
        container.delegate = self
        container.isUserInteractionEnabled = true
        container.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRewards)))
        return container
    }()
    
    //next Cut
    
    lazy var promoteButton: TicketrunnerBlueButton = {
        let button = TicketrunnerBlueButton(title: "Promote")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlePromote), for: .touchUpInside)
        return button
    }()
    
    @objc func handlePromote() {
        guard let event = currentEvent else { return }
        delegate?.didTapPromote(event: event)
    }
    
    lazy var rewardsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Rewards", for: .normal)
        button.titleLabel?.font = UIFont.boldSourceSansPro(ofSize: 16)
        button.setTitleColor(ColorCodes.textColorGrey, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(handleRewards), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()
    
    @objc func handleRewards() {
        guard let event = currentEvent else { return }
        delegate?.didTapRewards(event: event)
    }
    
    lazy var eventInfoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Event Info", for: .normal)
        button.titleLabel?.font = UIFont.boldSourceSansPro(ofSize: 16)
        button.setTitleColor(ColorCodes.textColorGrey, for: .normal)
        button.addTarget(self, action: #selector(handleEventInfo), for: .touchUpInside)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 5
        return button
    }()
    
    @objc func handleEventInfo() {
        guard let event = currentEvent else { return }
        delegate?.didTapEventInfo(event: event)
    }
    
    lazy var leaderboardButton: UIButton = {
        let button = UIButton()
        button.setTitle("Leaderboard", for: .normal)
        button.titleLabel?.font = UIFont.boldSourceSansPro(ofSize: 16)
        button.setTitleColor(ColorCodes.textColorGrey, for: .normal)
        button.addTarget(self, action: #selector(handleEventLeaderboard), for: .touchUpInside)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 5
        return button
    }()
    
    @objc func handleEventLeaderboard() {
        guard let event = currentEvent else { return }
        delegate?.didTapLeaderboards(event: event)
    }
    
    var cellWidth: CGFloat?
    
    override func setupViews() {
        
    }
    
    fileprivate func setupViewsInCell() {
        guard let cellWidth = cellWidth else { return }
        addSubview(eventInfoView)
        addSubview(rewardsContainer)
        
        eventInfoView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 108 + (cellWidth / 2.7))
        
        rewardsContainer.anchor(top: eventInfoView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 128)
        
        
        eventInfoView.addSubview(eventImageView)
        eventInfoView.addSubview(titleLabel)
        eventInfoView.addSubview(dateLabel)
        eventInfoView.addSubview(streetLabel)
        eventInfoView.addSubview(locationLabel)
        
        addSubview(promoteButton)
        addSubview(rewardsButton)
        addSubview(eventInfoButton)
        addSubview(leaderboardButton)
        
        //x,y,w,h
        
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
        promoteButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        promoteButton.topAnchor.constraint(equalTo: rewardsContainer.bottomAnchor, constant: 4).isActive = true
        promoteButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        promoteButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //x,y,w,h
        rewardsButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        rewardsButton.topAnchor.constraint(equalTo: promoteButton.bottomAnchor, constant: 4).isActive = true
        rewardsButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        rewardsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //x,y,w,h
        eventInfoButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        eventInfoButton.topAnchor.constraint(equalTo: rewardsButton.bottomAnchor, constant: 4).isActive = true
        eventInfoButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        eventInfoButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        leaderboardButton.anchor(top: eventInfoButton.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
    }
    
    func shouldShowTriangles() -> Bool {
        return true
    }
    
    func progressBarBackgroundWidth() -> CGFloat {
        let width = self.frame.width - 32
        return width
    }
    
    func shouldProgressBarAnimate() -> Bool {
        return shouldAnimateProgressBar
    }
    
    @objc func handleDidTapEventInfoContainer() {
        guard let event = currentEvent else { return }
        delegate?.didTapEventInfo(event: event)
    }
    
}

class ExpiredEventTableCell: EventTableCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.titleLabel.text = "Expire Events"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}










