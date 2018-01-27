//
//  AcceptedTicketrunnerModalController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 22.01.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class AcceptedTicketrunnerModalController: UIViewController {
    
    var event: Event?
    
    let whiteView = UIView()
    
    let eventImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "event_neu")
        return iv
    }()
    
    let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .white
        return iv
    }()
    
    let titleLabel: H1 = {
        let label = H1()
        label.text = "Congrats Jake!"
        label.textColor = ColorCodes.darkPurple
        return label
    }()
    
    let textLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.numberOfLines = 0
        label.text = "You just got accepted as a Ticketrunner of Panama Open Air 2018. Start selling right now and get 200°."
        label.textAlignment = .center
        label.textColor = ColorCodes.textColorGrey
        label.font = UIFont.sourceSansPro(ofSize: 20)
        return label
    }()
    
    lazy var startButton: TicketrunnerGreenButton = {
        let button = TicketrunnerGreenButton(title: "Start Selling Tickets")
        button.addTarget(self, action: #selector(handleStartSelling), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        view.isOpaque = false
        
        whiteView.backgroundColor = UIColor.white
        whiteView.clipsToBounds = true
        whiteView.layer.cornerRadius = 5
        
        setupModalCancelButton()
        
        setupViews()
    }
    
    fileprivate func setupViews() {
        
        view.addSubview(whiteView)
        
        whiteView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 425)
        whiteView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        whiteView.addSubview(eventImageView)
        whiteView.addSubview(iconImageView)
        whiteView.addSubview(titleLabel)
        whiteView.addSubview(textLabel)
        whiteView.addSubview(startButton)
        
        eventImageView.anchor(top: whiteView.topAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 125)
        
        iconImageView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        iconImageView.centerYAnchor.constraint(equalTo: eventImageView.bottomAnchor).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        iconImageView.layer.cornerRadius = 100/2
        
        titleLabel.anchor(top: iconImageView.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        textLabel.anchor(top: titleLabel.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 120)
        
        startButton.anchor(top: textLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 250, height: 50)
        startButton.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        
    }
    
    @objc func handleStartSelling() {
        print("Start Selling")
    }
    
}








