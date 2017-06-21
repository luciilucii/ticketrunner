//
//  DetailPromoteController+Setups.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 10.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

extension DetailPromoteEventController {
    
    func setupViews() {
        
        scrollContainerView.addSubview(eventImageView)
        scrollContainerView.addSubview(eventTitleLabel)
        scrollContainerView.addSubview(titleSeperatorView)
        scrollContainerView.addSubview(linkContainerView)
        scrollContainerView.addSubview(linkSeperatorView)
        scrollContainerView.addSubview(directShareContainerView)
        scrollContainerView.addSubview(facebookPreviewContainer)
        scrollContainerView.addSubview(shareSeperatorView)
        scrollContainerView.addSubview(facebookPreviewSeperatorView)
        scrollContainerView.addSubview(landingPagePreviewContainer)
        
        //No ScrollView
        view.addSubview(linkCopiedLabel)
        
        //x,y,w,h
        eventImageView.topAnchor.constraint(equalTo: scrollContainerView.topAnchor, constant: 8).isActive = true
        eventImageView.leftAnchor.constraint(equalTo: scrollContainerView.leftAnchor, constant: 8).isActive = true
        eventImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        eventImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //x,y,w,h
        eventTitleLabel.topAnchor.constraint(equalTo: eventImageView.topAnchor).isActive = true
        eventTitleLabel.leftAnchor.constraint(equalTo: eventImageView.rightAnchor, constant: 8).isActive = true
        eventTitleLabel.rightAnchor.constraint(equalTo: scrollContainerView.rightAnchor, constant: -8).isActive = true
        eventTitleLabel.heightAnchor.constraint(equalTo: eventImageView.heightAnchor).isActive = true
        
        //x,y,w,h
        titleSeperatorView.topAnchor.constraint(equalTo: eventImageView.bottomAnchor, constant: 8).isActive = true
        titleSeperatorView.leftAnchor.constraint(equalTo: scrollContainerView.leftAnchor).isActive = true
        titleSeperatorView.rightAnchor.constraint(equalTo: scrollContainerView.rightAnchor).isActive = true
        titleSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        //x,y,w,h
        linkContainerView.topAnchor.constraint(equalTo: titleSeperatorView.bottomAnchor, constant: 8).isActive = true
        linkContainerView.leftAnchor.constraint(equalTo: scrollContainerView.leftAnchor).isActive = true
        linkContainerView.rightAnchor.constraint(equalTo: scrollContainerView.rightAnchor).isActive = true
        linkContainerView.heightAnchor.constraint(equalToConstant: 252).isActive = true
        
        setupLinkContainer()
        
        
        //x,y,w,h
        linkCopiedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        linkCopiedLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        linkCopiedLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        linkCopiedLabelBottomAnchor = linkCopiedLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 35)
        linkCopiedLabelBottomAnchor?.isActive = true
        
        //x,y,w,h
        linkSeperatorView.topAnchor.constraint(equalTo: linkContainerView.bottomAnchor, constant: 8).isActive = true
        linkSeperatorView.leftAnchor.constraint(equalTo: scrollContainerView.leftAnchor).isActive = true
        linkSeperatorView.rightAnchor.constraint(equalTo: scrollContainerView.rightAnchor).isActive = true
        linkSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //x,y,w,h
        directShareContainerView.leftAnchor.constraint(equalTo: scrollContainerView.leftAnchor).isActive = true
        directShareContainerView.rightAnchor.constraint(equalTo: scrollContainerView.rightAnchor).isActive = true
        directShareContainerView.topAnchor.constraint(equalTo: linkSeperatorView.bottomAnchor, constant: 8).isActive = true
        directShareContainerView.heightAnchor.constraint(equalToConstant: 314).isActive = true
        
        setupDirectShareViews()
        
        //x,y,w,h
        shareSeperatorView.topAnchor.constraint(equalTo: directShareContainerView.bottomAnchor, constant: 8).isActive = true
        shareSeperatorView.leftAnchor.constraint(equalTo: scrollContainerView.leftAnchor).isActive = true
        shareSeperatorView.rightAnchor.constraint(equalTo: scrollContainerView.rightAnchor).isActive = true
        shareSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //x,y,w,h
        facebookPreviewContainer.topAnchor.constraint(equalTo: shareSeperatorView.bottomAnchor, constant: 8).isActive = true
        facebookPreviewContainer.leftAnchor.constraint(equalTo: scrollContainerView.leftAnchor).isActive = true
        facebookPreviewContainer.rightAnchor.constraint(equalTo: scrollContainerView.rightAnchor).isActive = true
        facebookPreviewContainer.heightAnchor.constraint(equalToConstant: 521).isActive = true
        
        facebookPreviewSeperatorView.topAnchor.constraint(equalTo: facebookPreviewContainer.bottomAnchor, constant: 8).isActive = true
        facebookPreviewSeperatorView.leftAnchor.constraint(equalTo: scrollContainerView.leftAnchor).isActive = true
        facebookPreviewSeperatorView.rightAnchor.constraint(equalTo: scrollContainerView.rightAnchor).isActive = true
        facebookPreviewSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        setupFacebookPreviewContainer()
        
        landingPagePreviewContainer.topAnchor.constraint(equalTo: facebookPreviewSeperatorView.bottomAnchor, constant: 8).isActive = true
        landingPagePreviewContainer.leftAnchor.constraint(equalTo: scrollContainerView.leftAnchor).isActive = true
        landingPagePreviewContainer.rightAnchor.constraint(equalTo: scrollContainerView.rightAnchor).isActive = true
        landingPagePreviewContainer.heightAnchor.constraint(equalToConstant: 563).isActive = true
        
        setupLandingPagePreviewContainer()
        
    }
    
    func setupLinkContainer() {
        
        linkContainerView.addSubview(linkTitleLabel)
        linkContainerView.addSubview(linkTextLabel)
        linkContainerView.addSubview(linkLabel)
        linkContainerView.addSubview(copyLinkButton)
        
        //x,y,w,h
        linkTitleLabel.topAnchor.constraint(equalTo: linkContainerView.topAnchor).isActive = true
        linkTitleLabel.leftAnchor.constraint(equalTo: scrollContainerView.leftAnchor, constant: 8).isActive = true
        linkTitleLabel.rightAnchor.constraint(equalTo: scrollContainerView.rightAnchor, constant: -8).isActive = true
        linkTitleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        //x,y,w,h
        linkTextLabel.topAnchor.constraint(equalTo: linkTitleLabel.bottomAnchor, constant: 8).isActive = true
        linkTextLabel.leftAnchor.constraint(equalTo: scrollContainerView.leftAnchor, constant: 16).isActive = true
        linkTextLabel.rightAnchor.constraint(equalTo: scrollContainerView.rightAnchor, constant: -16).isActive = true
        linkTextLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        //x,y,w,h
        linkLabel.topAnchor.constraint(equalTo: linkTextLabel.bottomAnchor, constant: 8).isActive = true
        linkLabel.leftAnchor.constraint(equalTo: scrollContainerView.leftAnchor, constant: 16).isActive = true
        linkLabel.rightAnchor.constraint(equalTo: scrollContainerView.rightAnchor, constant: -16).isActive = true
        linkLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        //x,y,w,h
        copyLinkButton.topAnchor.constraint(equalTo: linkLabel.bottomAnchor).isActive = true
        copyLinkButton.leftAnchor.constraint(equalTo: linkLabel.leftAnchor).isActive = true
        copyLinkButton.rightAnchor.constraint(equalTo: linkLabel.rightAnchor).isActive = true
        copyLinkButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    func setupDirectShareViews() {
        
        directShareContainerView.addSubview(directShareTitleLabel)
        directShareContainerView.addSubview(directShareDescriptionLabel)
        directShareContainerView.addSubview(facebookLogoImageView)
        directShareContainerView.addSubview(facebookShareTextView)
        directShareContainerView.addSubview(shareFacebookButton)
        
        //x,y,w,h
        
        directShareTitleLabel.topAnchor.constraint(equalTo: directShareContainerView.topAnchor, constant: 8).isActive = true
        directShareTitleLabel.centerXAnchor.constraint(equalTo: directShareContainerView.centerXAnchor).isActive = true
        directShareTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        directShareTitleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        //x,y,w,h
        directShareDescriptionLabel.topAnchor.constraint(equalTo: directShareTitleLabel.bottomAnchor).isActive = true
        directShareDescriptionLabel.leftAnchor.constraint(equalTo: directShareContainerView.leftAnchor, constant: 16).isActive = true
        directShareDescriptionLabel.rightAnchor.constraint(equalTo: directShareContainerView.rightAnchor, constant: -16).isActive = true
        directShareDescriptionLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //x,y,w,h
        facebookLogoImageView.topAnchor.constraint(equalTo: directShareDescriptionLabel.bottomAnchor, constant: 8).isActive = true
        facebookLogoImageView.leftAnchor.constraint(equalTo: scrollContainerView.leftAnchor, constant: 16).isActive = true
        facebookLogoImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        facebookLogoImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        //x,y,w,h
        facebookShareTextView.topAnchor.constraint(equalTo: facebookLogoImageView.bottomAnchor).isActive = true
        facebookShareTextView.leftAnchor.constraint(equalTo: facebookLogoImageView.leftAnchor).isActive = true
        facebookShareTextView.rightAnchor.constraint(equalTo: scrollContainerView.rightAnchor, constant: -16).isActive = true
        facebookShareTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        shareFacebookButton.topAnchor.constraint(equalTo: facebookShareTextView.bottomAnchor).isActive = true
        shareFacebookButton.leftAnchor.constraint(equalTo: facebookShareTextView.leftAnchor).isActive = true
        shareFacebookButton.rightAnchor.constraint(equalTo: facebookShareTextView.rightAnchor).isActive = true
        shareFacebookButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    func setupFacebookPreviewContainer() {
        
        facebookPreviewContainer.addSubview(facebookPreviewContainerView)
        
        facebookPreviewContainerView.topAnchor.constraint(equalTo: facebookPreviewContainer.topAnchor).isActive = true
        facebookPreviewContainerView.leftAnchor.constraint(equalTo: facebookPreviewContainer.leftAnchor).isActive = true
        facebookPreviewContainerView.rightAnchor.constraint(equalTo: facebookPreviewContainer.rightAnchor).isActive = true
        facebookPreviewContainerView.bottomAnchor.constraint(equalTo: facebookPreviewContainer.bottomAnchor).isActive = true
        
    }
    
    func setupLandingPagePreviewContainer() {
        
        landingPagePreviewContainer.addSubview(landingPagePreviewContainerView)
        
        landingPagePreviewContainerView.topAnchor.constraint(equalTo: landingPagePreviewContainer.topAnchor).isActive = true
        landingPagePreviewContainerView.leftAnchor.constraint(equalTo: landingPagePreviewContainer.leftAnchor).isActive = true
        landingPagePreviewContainerView.rightAnchor.constraint(equalTo: landingPagePreviewContainer.rightAnchor).isActive = true
        landingPagePreviewContainerView.bottomAnchor.constraint(equalTo: landingPagePreviewContainer.bottomAnchor).isActive = true
        
    }
    
}













