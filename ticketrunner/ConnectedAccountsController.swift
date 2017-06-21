//
//  ConnectedAccountsController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 16.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class ConnectedAccountsController: UIViewController, UIScrollViewDelegate {
    
    var titleLabel: UILabel!
    let titleString = "Accounts"
    
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        
        setupViews()
        setupTitleLabel()
        
        view.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0)
    }
    
    let accountsTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Connected Acconts"
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return label
    }()
    
    let twitterImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "twitter")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = UIColor(red:0.48, green:0.48, blue:0.48, alpha:1.0)
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let facebookImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "facebook-icon")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = UIColor(red:0.48, green:0.48, blue:0.48, alpha:1.0)
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let whatsappImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "whatsapp")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = UIColor(red:0.48, green:0.48, blue:0.48, alpha:1.0)
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let twitterSwitchController: UISwitch = {
        let switchView = UISwitch()
        switchView.isOn = false
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.onTintColor = UIColor(red:0.25, green:0.89, blue:0.56, alpha:1.0)
        switchView.addTarget(self, action: #selector(twitterSwitchValueDidChange), for: .valueChanged)
        return switchView
    }()
    
    let facebookSwitchController: UISwitch = {
        let switchView = UISwitch()
        switchView.isOn = false
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.onTintColor = UIColor(red:0.25, green:0.89, blue:0.56, alpha:1.0)
        switchView.addTarget(self, action: #selector(facebookSwitchValueDidChange), for: .valueChanged)
        return switchView
    }()
    
    let whatsappSwitchController: UISwitch = {
        let switchView = UISwitch()
        switchView.isOn = false
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.onTintColor = UIColor(red:0.25, green:0.89, blue:0.56, alpha:1.0)
        switchView.addTarget(self, action: #selector(whatsappSwitchValueDidChange), for: .valueChanged)
        return switchView
    }()
    
    func setupViews() {
        
        view.addSubview(accountsTitleLabel)
        view.addSubview(twitterImageView)
        view.addSubview(facebookImageView)
        view.addSubview(whatsappImageView)
        
        view.addSubview(twitterSwitchController)
        view.addSubview(facebookSwitchController)
        view.addSubview(whatsappSwitchController)
        
        
        accountsTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        accountsTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        accountsTitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 16).isActive = true
        accountsTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        twitterImageView.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -8).isActive = true
        twitterImageView.topAnchor.constraint(equalTo: accountsTitleLabel.bottomAnchor, constant: 16).isActive = true
        twitterImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        twitterImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        twitterSwitchController.topAnchor.constraint(equalTo: twitterImageView.bottomAnchor, constant: 4).isActive = true
        twitterSwitchController.centerXAnchor.constraint(equalTo: twitterImageView.centerXAnchor).isActive = true
        twitterSwitchController.heightAnchor.constraint(equalToConstant: 32).isActive = true
        twitterSwitchController.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        facebookImageView.topAnchor.constraint(equalTo: twitterImageView.topAnchor).isActive = true
        facebookImageView.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 4).isActive = true
        facebookImageView.heightAnchor.constraint(equalTo: twitterImageView.heightAnchor).isActive = true
        facebookImageView.widthAnchor.constraint(equalTo: twitterImageView.widthAnchor).isActive = true
        
        facebookSwitchController.topAnchor.constraint(equalTo: facebookImageView.bottomAnchor, constant: 4).isActive = true
        facebookSwitchController.centerXAnchor.constraint(equalTo: facebookImageView.centerXAnchor).isActive = true
        facebookSwitchController.widthAnchor.constraint(equalToConstant: 50).isActive = true
        facebookSwitchController.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        whatsappImageView.topAnchor.constraint(equalTo: twitterImageView.bottomAnchor, constant: 65).isActive = true
        whatsappImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        whatsappImageView.heightAnchor.constraint(equalTo: twitterImageView.heightAnchor).isActive = true
        whatsappImageView.widthAnchor.constraint(equalTo: twitterImageView.widthAnchor).isActive = true
        
        whatsappSwitchController.topAnchor.constraint(equalTo: whatsappImageView.bottomAnchor, constant: 4).isActive = true
        whatsappSwitchController.centerXAnchor.constraint(equalTo: whatsappImageView.centerXAnchor).isActive = true
        whatsappSwitchController.heightAnchor.constraint(equalToConstant: 32).isActive = true
        whatsappSwitchController.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    
    func setupTitleLabel() {
        let titleView = UIView()
        titleView.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        
        titleLabel = UILabel()
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.text = "\(titleString)"
        titleView.addSubview(titleLabel)
        
        //x,y,w,h
        titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        
        self.navigationItem.titleView = titleView
    }
    
    func twitterSwitchValueDidChange() {
        
        if twitterSwitchController.isOn == true {
            twitterImageView.tintColor = UIColor(red:0.11, green:0.63, blue:0.95, alpha:1.0)
        } else {
            twitterImageView.tintColor = UIColor(red:0.48, green:0.48, blue:0.48, alpha:1.0)
        }
    }
    
    func facebookSwitchValueDidChange() {
        if facebookSwitchController.isOn == true {
            facebookImageView.tintColor = UIColor(red:0.07, green:0.21, blue:0.49, alpha:1.0)
        } else {
            facebookImageView.tintColor = UIColor(red:0.48, green:0.48, blue:0.48, alpha:1.0)
        }
    }
    
    func whatsappSwitchValueDidChange() {
        if whatsappSwitchController.isOn == true {
            whatsappImageView.tintColor = UIColor(red:0.09, green:0.62, blue:0.05, alpha:1.0)
        } else {
            whatsappImageView.tintColor = UIColor(red:0.48, green:0.48, blue:0.48, alpha:1.0)
        }
    }
    
}
