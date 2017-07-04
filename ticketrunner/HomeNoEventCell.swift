//
//  HomeNoEventCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 03.07.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class HomeNoEventCell: BaseCell {
    
    var homeController: HomeController?
    
    let noEventImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Huge Festival")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let noEventTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "You're not promoting any events"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0)
        return label
    }()
    
    let noEventDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "That’s why we can’t provide you with any info here. That’s not cool at all.\n\nWe should change that quickly.\n\nSimply click on the Promote button and share the event with your friends and followers."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return label
    }()
    
    lazy var promoteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red:0.00, green:0.75, blue:0.95, alpha:1.0)
        button.setTitle("Promote", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.tintColor = UIColor.white
        button.addTarget(self, action: #selector(handlePromote), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        addSubview(noEventImageView)
        addSubview(noEventTitleLabel)
        addSubview(noEventDescriptionLabel)
        addSubview(promoteButton)
        
        noEventImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 250)
        noEventTitleLabel.anchor(top: noEventImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        noEventDescriptionLabel.anchor(top: noEventTitleLabel.bottomAnchor, left: noEventTitleLabel.leftAnchor, bottom: nil, right: noEventTitleLabel.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 150)
        
        promoteButton.anchor(top: noEventDescriptionLabel.bottomAnchor, left: noEventDescriptionLabel.leftAnchor, bottom: nil, right: noEventDescriptionLabel.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
    }
    
    func handlePromote() {
        
        homeController?.menu?.showEventController()
        
//        let layout = UICollectionViewFlowLayout()
//        let eventContoller = EventController(collectionViewLayout: layout)
//        
//        eventContoller.menu = homeController?.menu
//        let navController = UINavigationController(rootViewController: eventContoller)
//        
//        homeController?.present(navController, animated: false, completion: nil)
    }
    
    
    
}
