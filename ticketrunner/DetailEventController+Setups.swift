//
//  DetailEventController+Setups.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 02.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

extension DetailEventController {
    
    func setupScrollView(height: CGFloat) {
        
        self.scrollView = UIScrollView()
        self.scrollView.delegate = self
        self.scrollView.contentSize = CGSize(width: view.frame.width, height: height)
        scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 120, 0)
        
        scrollView.frame = view.bounds
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollContainerView)
        
        scrollContainerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: scrollView.contentSize.height)
    }
    

    
    func setupViews() {
        
        scrollContainerView.addSubview(eventImageView)
        scrollContainerView.addSubview(eventInfoContainer)
        scrollContainerView.addSubview(promoteContainerView)
        scrollContainerView.addSubview(artistLineUpContainer)
        scrollContainerView.addSubview(mapView)
        scrollContainerView.addSubview(facebookContainer)
        
        guard let promoteHeight = eventRewardsContainer?.getHeight() else {
            return
        }
        
        guard let artistsHeight = lineUpContainer?.getHeight() else {
            return
        }
        
        view.addSubview(promoteFixedContainerView)
        
        //x,y,w,h
        eventImageView.topAnchor.constraint(equalTo: scrollContainerView.topAnchor).isActive = true
        eventImageView.leftAnchor.constraint(equalTo: scrollContainerView.leftAnchor).isActive = true
        eventImageView.rightAnchor.constraint(equalTo: scrollContainerView.rightAnchor).isActive = true
        let height = view.frame.width / 2.7
        eventImageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        //x,y,w,h
        eventInfoContainer.topAnchor.constraint(equalTo: eventImageView.bottomAnchor).isActive = true
        eventInfoContainer.leftAnchor.constraint(equalTo: scrollContainerView.leftAnchor).isActive = true
        eventInfoContainer.rightAnchor.constraint(equalTo: scrollContainerView.rightAnchor).isActive = true
        eventInfoContainer.heightAnchor.constraint(equalToConstant: 317).isActive = true
        
        //x,y,w,h
        promoteContainerView.topAnchor.constraint(equalTo: eventInfoContainer.bottomAnchor, constant: 8).isActive = true
        promoteContainerView.leftAnchor.constraint(equalTo: scrollContainerView.leftAnchor).isActive = true
        promoteContainerView.rightAnchor.constraint(equalTo: scrollContainerView.rightAnchor).isActive = true
        promoteContainerView.heightAnchor.constraint(equalToConstant: promoteHeight).isActive = true
        
        //x,y,w,h
        artistLineUpContainer.leftAnchor.constraint(equalTo: scrollContainerView.leftAnchor).isActive = true
        artistLineUpContainer.topAnchor.constraint(equalTo: promoteContainerView.bottomAnchor, constant: 8).isActive = true
        artistLineUpContainer.rightAnchor.constraint(equalTo: scrollContainerView.rightAnchor).isActive = true
        artistLineUpContainer.heightAnchor.constraint(equalToConstant: artistsHeight).isActive = true
        
        //x,y,w,h
        mapView.topAnchor.constraint(equalTo: artistLineUpContainer.bottomAnchor, constant: 8).isActive = true
        mapView.leftAnchor.constraint(equalTo: scrollContainerView.leftAnchor).isActive = true
        mapView.rightAnchor.constraint(equalTo: scrollContainerView.rightAnchor).isActive = true
        
        if currentEvent?.latidute != nil && currentEvent?.longitude != nil {
            mapViewHeightAnchor = mapView.heightAnchor.constraint(equalToConstant: 250)
            
        }
        mapViewHeightAnchor?.isActive = true
        
        //x,y,w,h
        facebookContainer.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: facebookContainerTopAnchorConstant).isActive = true
        facebookContainer.leftAnchor.constraint(equalTo: scrollContainerView.leftAnchor).isActive = true
        facebookContainer.rightAnchor.constraint(equalTo: scrollContainerView.rightAnchor).isActive = true
        facebookContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        //x,y,w,h
        promoteFixedContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        promoteFixedContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        promoteFixedContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        promoteFixedContainerView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        
        
        setupEventInfoContainer()
        setupPromoteFixedContainer()
        setupFacebookContainer()
        setupPromoteBarContainer()
        
    }
    
    func setupEventInfoContainer() {
        eventInfoContainer.addSubview(eventNameLabel)
        eventInfoContainer.addSubview(dateLabel)
        eventInfoContainer.addSubview(genreLabel)
        eventInfoContainer.addSubview(locationLabel)
        
        eventInfoContainer.addSubview(eventDesriptionHeadlineLabel)
        eventInfoContainer.addSubview(descriptionLabel)
        eventInfoContainer.addSubview(moreDescriptionButton)
        
        //x,y,w,h
        eventNameLabel.topAnchor.constraint(equalTo: eventInfoContainer.topAnchor).isActive = true
        eventNameLabel.leftAnchor.constraint(equalTo: eventInfoContainer.leftAnchor, constant: 16).isActive = true
        eventNameLabel.rightAnchor.constraint(equalTo: eventInfoContainer.rightAnchor, constant: -16).isActive = true
        eventNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //x,y,w,h
        dateLabel.leftAnchor.constraint(equalTo: eventInfoContainer.leftAnchor, constant: 32).isActive = true
        dateLabel.topAnchor.constraint(equalTo: eventNameLabel.bottomAnchor, constant: 8).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //x,y,w,h
        genreLabel.rightAnchor.constraint(equalTo: eventInfoContainer.rightAnchor, constant: -32).isActive = true
        genreLabel.topAnchor.constraint(equalTo: dateLabel.topAnchor).isActive = true
        genreLabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
        genreLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //x,y,w,h
        locationLabel.leftAnchor.constraint(equalTo: dateLabel.leftAnchor).isActive = true
        locationLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor).isActive = true
        locationLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        locationLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //x,y,w,h
        eventDesriptionHeadlineLabel.centerXAnchor.constraint(equalTo: eventInfoContainer.centerXAnchor).isActive = true
        eventDesriptionHeadlineLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 8).isActive = true
        eventDesriptionHeadlineLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        eventDesriptionHeadlineLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //x,y,w,h
        descriptionLabel.topAnchor.constraint(equalTo: eventDesriptionHeadlineLabel.bottomAnchor, constant: 4).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: eventInfoContainer.leftAnchor, constant: 16).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: eventInfoContainer.rightAnchor, constant: -16).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 105).isActive = true
        
        //x,y,w,h
        moreDescriptionButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor).isActive = true
        moreDescriptionButton.rightAnchor.constraint(equalTo: eventInfoContainer.rightAnchor, constant: -16).isActive = true
        moreDescriptionButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        moreDescriptionButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    func setupPromoteBarContainer() {
        promoteBarContainerView.addSubview(soldTicketsLabel)
        
        promoteBarContainerView.addSubview(progressBarContainer)
        
        
        promoteBarContainerView.addContraintsWithFormat(format: "H:|-8-[v0]-8-|", views: soldTicketsLabel)
        promoteBarContainerView.addContraintsWithFormat(format: "H:|-8-[v0]-8-|", views: progressBarContainer)
        promoteBarContainerView.addContraintsWithFormat(format: "V:|[v0][v1]|", views: soldTicketsLabel, progressBarContainer)
        
        
    }
    
    
    func setupFacebookContainer() {
        
        facebookContainer.addSubview(facebookImageView)
        facebookContainer.addSubview(facebookLabel)
        
        facebookContainer.addContraintsWithFormat(format: "H:|[v0(50)]-8-[v1]-8-|", views: facebookImageView, facebookLabel)
        facebookContainer.addContraintsWithFormat(format: "V:|[v0]|", views: facebookImageView)
        facebookContainer.addContraintsWithFormat(format: "V:|[v0]|", views: facebookLabel)
        
        
    }
    
    func setupPromoteFixedContainer() {
        promoteFixedContainerView.addSubview(promoteButton)
        promoteFixedContainerView.addSubview(promoteEventNameLabel)
        
        //x,y,w,h
        promoteEventNameLabel.leftAnchor.constraint(equalTo: promoteFixedContainerView.leftAnchor, constant: 8).isActive = true
        promoteEventNameLabel.centerYAnchor.constraint(equalTo: promoteFixedContainerView.centerYAnchor).isActive = true
        promoteEventNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        promoteEventNameLabel.rightAnchor.constraint(equalTo: promoteButton.leftAnchor, constant: -8).isActive = true
        
        //x,y,w,h
        promoteButton.rightAnchor.constraint(equalTo: promoteFixedContainerView.rightAnchor, constant: -8).isActive = true
        promoteButton.centerYAnchor.constraint(equalTo: promoteFixedContainerView.centerYAnchor).isActive = true
        promoteButton.widthAnchor.constraint(equalToConstant: 125).isActive = true
        promoteButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
    }
    
}
