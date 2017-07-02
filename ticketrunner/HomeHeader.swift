//
//  HomeHeader.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 14.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class HomeHeader: BaseCell {
    
    var homeController: HomeController?
    
    var user: User?
    
    let ticketsSoldView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ticketsSoldImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "home tickets sold")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.isHidden = true
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let ticketsSoldLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tickets sold!"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = UIColor(red:0.73, green:0.76, blue:0.96, alpha:1.0)
        label.textAlignment = .center
        return label
    }()
    
    let awesomeLabel: UILabel = {
        let label = UILabel()
        label.text = "That's awesome! Congrats"
        label.textColor = UIColor(red:0.98, green:0.68, blue:0.39, alpha:1.0)
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let ticketCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 48)
        label.text = ""
        label.isHidden = true
        label.textAlignment = .center
        return label
    }()
    
    let noTicketsSoldLeftImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "home welcome LEFT")
        iv.contentMode = .scaleAspectFit
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let noTicketsSoldRightImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "home welcome Right")
        iv.contentMode = .scaleAspectFit
        iv.layer.masksToBounds = true
        return iv
    }()
    
    lazy var avatarImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 50
        iv.image = UIImage(named: "profile_avatar")
        iv.contentMode = .scaleAspectFill
        iv.isUserInteractionEnabled = true
        iv.alpha = 0
        iv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfileImage)))
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
        user = UserResource().getUser()
        
        addSubview(ticketsSoldView)
        
        
        let ticketsSoldViewHeight: CGFloat = 210
        
        //x,y,w,h
        ticketsSoldView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        ticketsSoldView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        ticketsSoldView.widthAnchor.constraint(equalToConstant: frame.width - 16).isActive = true
        ticketsSoldView.heightAnchor.constraint(equalToConstant: ticketsSoldViewHeight).isActive = true
        
        setupTicketsSoldView()
        setupVariables()
        
        setupAnimationTimer()
    }
    
    fileprivate func setupAnimationTimer() {
        _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(animateProfileImageView), userInfo: nil, repeats: false)
        
    }
    
    func animateProfileImageView() {
        
        avatarImageViewCenterYAnchor?.constant = 0
        
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 2, options: .curveEaseOut, animations: { 
            
            self.avatarImageView.alpha = 1
            self.layoutIfNeeded()
            
        }, completion: nil)
        
    }
    
    var avatarImageViewCenterYAnchor: NSLayoutConstraint?
    
    func setupTicketsSoldView() {
        
        ticketsSoldView.addSubview(welcomeLabel)
        ticketsSoldView.addSubview(ticketsSoldImageView)
        ticketsSoldView.addSubview(ticketsSoldLabel)
        ticketsSoldView.addSubview(ticketCountLabel)
        ticketsSoldView.addSubview(awesomeLabel)
        
        //x,y,w,h
        welcomeLabel.topAnchor.constraint(equalTo: ticketsSoldView.topAnchor).isActive = true
        welcomeLabel.leftAnchor.constraint(equalTo: ticketsSoldView.leftAnchor).isActive = true
        welcomeLabel.rightAnchor.constraint(equalTo: ticketsSoldView.rightAnchor).isActive = true
        welcomeLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //x,y,w,h
        ticketsSoldImageView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor).isActive = true
        ticketsSoldImageView.leftAnchor.constraint(equalTo: ticketsSoldView.leftAnchor).isActive = true
        ticketsSoldImageView.rightAnchor.constraint(equalTo: ticketsSoldView.rightAnchor).isActive = true
        ticketsSoldImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        //x,y,w,h
        ticketCountLabel.centerXAnchor.constraint(equalTo: ticketsSoldImageView.centerXAnchor, constant: -3).isActive = true
        ticketCountLabel.centerYAnchor.constraint(equalTo: ticketsSoldImageView.centerYAnchor).isActive = true
        ticketCountLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        ticketCountLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        //x,y,w,h
        ticketsSoldLabel.topAnchor.constraint(equalTo: ticketsSoldImageView.bottomAnchor, constant: 8).isActive = true
        ticketsSoldLabel.leftAnchor.constraint(equalTo: ticketsSoldView.leftAnchor).isActive = true
        ticketsSoldLabel.rightAnchor.constraint(equalTo: ticketsSoldView.rightAnchor).isActive = true
        ticketsSoldLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //x,y,w,h
        awesomeLabel.topAnchor.constraint(equalTo: ticketsSoldLabel.bottomAnchor).isActive = true
        awesomeLabel.leftAnchor.constraint(equalTo: ticketsSoldView.leftAnchor).isActive = true
        awesomeLabel.rightAnchor.constraint(equalTo: ticketsSoldView.rightAnchor).isActive = true
        awesomeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
        //MARK: views when no tickets sold
        ticketsSoldView.addSubview(noTicketsSoldLeftImageView)
        ticketsSoldView.addSubview(noTicketsSoldRightImageView)
        ticketsSoldView.addSubview(avatarImageView)
        
        noTicketsSoldLeftImageView.leftAnchor.constraint(equalTo: ticketsSoldView.leftAnchor).isActive = true
        noTicketsSoldLeftImageView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor).isActive = true
        noTicketsSoldLeftImageView.rightAnchor.constraint(equalTo: ticketsSoldView.centerXAnchor).isActive = true
        noTicketsSoldLeftImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        noTicketsSoldRightImageView.leftAnchor.constraint(equalTo: ticketsSoldView.centerXAnchor).isActive = true
        noTicketsSoldRightImageView.topAnchor.constraint(equalTo: noTicketsSoldLeftImageView.topAnchor).isActive = true
        noTicketsSoldRightImageView.rightAnchor.constraint(equalTo: ticketsSoldView.rightAnchor).isActive = true
        noTicketsSoldRightImageView.heightAnchor.constraint(equalTo: noTicketsSoldLeftImageView.heightAnchor).isActive = true
        
        avatarImageView.centerXAnchor.constraint(equalTo: ticketsSoldView.centerXAnchor).isActive = true
        
        avatarImageViewCenterYAnchor = avatarImageView.centerYAnchor.constraint(equalTo: noTicketsSoldLeftImageView.centerYAnchor, constant: 100)
        avatarImageViewCenterYAnchor?.isActive = true
        
        avatarImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    func setupVariables() {
        
        guard let user = user else {
            return
        }
        
        let ticketsSoldForUser = UserResource().getTicketsSoldFor(user: user)
        
        if ticketsSoldForUser == 0 {
            
            ticketsSoldImageView.isHidden = true
            ticketCountLabel.isHidden = true
            ticketsSoldLabel.text = "Upload Your Profile Picture"
            awesomeLabel.text = "Press that Button"
            
            noTicketsSoldLeftImageView.isHidden = false
            noTicketsSoldRightImageView.isHidden = false
            avatarImageView.isHidden = false
            
        } else if ticketsSoldForUser == 1 {
            
            ticketsSoldLabel.text = "Ticket sold!"
            ticketsSoldImageView.isHidden = false
            ticketCountLabel.isHidden = false
            awesomeLabel.text = "That's awesome! Keep going"
            
            noTicketsSoldLeftImageView.isHidden = true
            noTicketsSoldRightImageView.isHidden = true
            avatarImageView.isHidden = true
            
        } else {
            
            ticketsSoldLabel.text = "Tickets sold!"
            ticketsSoldImageView.isHidden = false
            ticketCountLabel.isHidden = false
            awesomeLabel.text = "That's awesome! Congrats"
            
            noTicketsSoldLeftImageView.isHidden = true
            noTicketsSoldRightImageView.isHidden = true
            avatarImageView.isHidden = true
            
        }
        
        let ticketsSoldString = String(ticketsSoldForUser)
        ticketCountLabel.text = ticketsSoldString
        
        
    }
    
    func handleSelectProfileImage() {
        homeController?.handleSelectProfileImage()
    }
    
    
}

