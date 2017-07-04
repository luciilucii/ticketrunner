//
//  EventCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 28.05.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class EventCell: UICollectionViewCell {
    
    //INFO: Height of the Eventcell is 369 + imageview
    
    var currentEvent: Event? {
        didSet {
            guard let event = currentEvent else { return }
            progressBar.event = event
        }
    }
    
    let eventImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .green
        iv.image = UIImage(named: "event5")
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Masquerade & Crime - Um Vaters Willen, Hercule Poirot ermittelt!"
        label.textAlignment = .left
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
    
    let promoteBarContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var progressBar: ProgressBarContainer = {
        let container = ProgressBarContainer()
        let width = self.frame.width - 16
        container.progressBackgroundBarWidthAnchor = width
        container.shouldTrianglesShowUp = true
        return container
    }()
    
    let soldTicketsLabel: UILabel = {
        let label = UILabel()
        label.text = "12"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red:0.25, green:0.89, blue:0.56, alpha:1.0)
        return label
    }()
    
    let promoteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red:0.00, green:0.75, blue:0.95, alpha:1.0)
        button.setTitle("Promote", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.tintColor = UIColor.white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let rewardsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Rewards", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0), for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    let eventInfoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Event Info", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0), for: .normal)
        return button
    }()
    
    let promoteSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let rewardsSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        
        addSubview(eventImageView)
        addSubview(titleLabel)
        addSubview(dateLabel)
        addSubview(streetLabel)
        addSubview(locationLabel)
        addSubview(promoteBarContainerView)
        addSubview(promoteButton)
        addSubview(rewardsButton)
        addSubview(eventInfoButton)
        
        //x,y,w,h
        eventImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        eventImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        eventImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        guard let cellWidth = cellWidth else { return }
        let height = cellWidth / 2.7
        eventImageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        
        //x,y,w,h
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        titleLabel.topAnchor.constraint(equalTo: eventImageView.bottomAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        //x,y,w,h
        streetLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        streetLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        streetLabel.rightAnchor.constraint(equalTo: centerXAnchor).isActive = true
        streetLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        //x,y,w,h
        dateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        dateLabel.topAnchor.constraint(equalTo: streetLabel.topAnchor).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        //x,y,w,h
        locationLabel.leftAnchor.constraint(equalTo: streetLabel.leftAnchor).isActive = true
        locationLabel.topAnchor.constraint(equalTo: streetLabel.bottomAnchor).isActive = true
        locationLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        locationLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        //x,y,w,h
        promoteBarContainerView.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 8).isActive = true
        promoteBarContainerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        promoteBarContainerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        promoteBarContainerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        //x,y,w,h
        promoteButton.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        promoteButton.topAnchor.constraint(equalTo: promoteBarContainerView.bottomAnchor).isActive = true
        promoteButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        promoteButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //x,y,w,h
        rewardsButton.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        rewardsButton.topAnchor.constraint(equalTo: promoteButton.bottomAnchor).isActive = true
        rewardsButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        rewardsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //x,y,w,h
        eventInfoButton.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        eventInfoButton.topAnchor.constraint(equalTo: rewardsButton.bottomAnchor).isActive = true
        eventInfoButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        eventInfoButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(promoteSeperatorView)
        addSubview(rewardsSeperatorView)
        
        //x,y,w,h
        promoteSeperatorView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        promoteSeperatorView.bottomAnchor.constraint(equalTo: promoteButton.bottomAnchor).isActive = true
        promoteSeperatorView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        promoteSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //x,y,w,h
        rewardsSeperatorView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        rewardsSeperatorView.bottomAnchor.constraint(equalTo: rewardsButton.bottomAnchor).isActive = true
        rewardsSeperatorView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        rewardsSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
    func setupPromoteBarContainer() {
        
        promoteBarContainerView.addSubview(soldTicketsLabel)
        promoteBarContainerView.addSubview(progressBar)
        
        promoteBarContainerView.addContraintsWithFormat(format: "H:|-8-[v0]-8-|", views: progressBar)
        promoteBarContainerView.addContraintsWithFormat(format: "V:|[v0(30)]-8-[v1]-8-|", views: soldTicketsLabel, progressBar)
        promoteBarContainerView.addContraintsWithFormat(format: "H:|-8-[v0]-8-|", views: soldTicketsLabel)
    }
    
}








