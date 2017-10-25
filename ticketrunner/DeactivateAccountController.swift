//
//  DeactivateAccountController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 16.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class DeactivateAccountController: UIViewController, UIScrollViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        
        setupViews()
        setupWhiteTitle(title: "Deactivate")
        
        view.backgroundColor = ColorCodes.controllerBackground
    }
    
    let deactivateTitleLabel: H2 = {
        let label = H2()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Do you really want to X your Account?"
        label.numberOfLines = 0
        return label
    }()
    
    let deactivateDescriptionLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "You are about to delete all your information and events from Ticketrunner. Once you’ve checked the box and hit that delete button everything will be gone baby gone - forever!\n\nPlease Contact us if there is anything we can help you with"
        return label
    }()
    
    let stopSwitchController: UISwitch = {
        let switchView = UISwitch()
        switchView.isOn = false
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.onTintColor = UIColor(red:0.25, green:0.89, blue:0.56, alpha:1.0)
        return switchView
    }()
    
    let stopDescriptionLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "I want to stop using Ticketrunner and go back to old school promoting"
        return label
    }()
    
    let deactivateButton: TicketrunnerBlueButton = {
        let button = TicketrunnerBlueButton(title: "Deactivate")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleDeactivate), for: .touchUpInside)
        button.backgroundColor = ColorCodes.ticketrunnerRed
        button.tintColor = UIColor.white
        return button
    }()
    
    func setupViews() {
        
        view.addSubview(deactivateTitleLabel)
        view.addSubview(deactivateDescriptionLabel)
        
        view.addSubview(stopSwitchController)
        view.addSubview(stopDescriptionLabel)
        
        view.addSubview(deactivateButton)
        
        deactivateTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        deactivateTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        deactivateTitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        deactivateTitleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        deactivateDescriptionLabel.topAnchor.constraint(equalTo: deactivateTitleLabel.bottomAnchor).isActive = true
        deactivateDescriptionLabel.leftAnchor.constraint(equalTo: deactivateTitleLabel.leftAnchor).isActive = true
        deactivateDescriptionLabel.rightAnchor.constraint(equalTo: deactivateTitleLabel.rightAnchor).isActive = true
        deactivateDescriptionLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        stopSwitchController.topAnchor.constraint(equalTo: deactivateDescriptionLabel.bottomAnchor, constant: 8).isActive = true
        stopSwitchController.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        stopSwitchController.heightAnchor.constraint(equalToConstant: 32).isActive = true
        stopSwitchController.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        stopDescriptionLabel.centerYAnchor.constraint(equalTo: stopSwitchController.centerYAnchor).isActive = true
        stopDescriptionLabel.leftAnchor.constraint(equalTo: stopSwitchController.rightAnchor, constant: 4).isActive = true
        stopDescriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        stopDescriptionLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        deactivateButton.topAnchor.constraint(equalTo: stopDescriptionLabel.bottomAnchor, constant: 16).isActive = true
        deactivateButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        deactivateButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        deactivateButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    
    @objc func handleDeactivate() {
        if stopSwitchController.isOn == true {
            print("Hello, are you stupid?!")
            let alertController = UIAlertController(title: "Deactivate Account", message: "Do you really want to deactivate your Account?", preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
                
                alertController.dismiss(animated: true, completion: nil)
                
            }))
            
            alertController.addAction(UIAlertAction(title: "Deactivate", style: .default, handler: { (action) in
                
                print("Fuck, we lost one!")
                
            }))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
}
