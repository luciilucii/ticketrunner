//
//  ConfirmationController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 06.07.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class ConfirmationController: UIViewController {
    
    let confirmationImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let confirmationTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0)
        label.numberOfLines = 0
        label.text = "Awesome!\nNow we just need you to confirm your account please."
        return label
    }()
    
    let confirmationDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.text = "We just sent you an email. Please check your inbox and click on the link to verify your account. Didn’t receive anything? Just click the button below and we’ll be happy to resend it."
        return label
    }()
    
    let resendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Resend Email", for: .normal)
        button.addTarget(self, action: #selector(handleResend), for: .touchUpInside)
        return button
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cancel")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.imageView?.tintColor = UIColor.darkGray
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        
        confirmationImageView.loadGif(name: "Verification-email")
    }
    
    fileprivate func setupViews() {
        view.addSubview(confirmationImageView)
        view.addSubview(confirmationTitleLabel)
        view.addSubview(backButton)
        view.addSubview(confirmationDescriptionLabel)
        view.addSubview(resendButton)
        
        backButton.anchor(top: view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 26, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 44, height: 44)
        confirmationImageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 65, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 150)
        confirmationTitleLabel.anchor(top: confirmationImageView.bottomAnchor, left: confirmationImageView.leftAnchor, bottom: nil, right: confirmationImageView.rightAnchor, paddingTop: 25, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 80)
        confirmationDescriptionLabel.anchor(top: confirmationTitleLabel.bottomAnchor, left: confirmationTitleLabel.leftAnchor, bottom: nil, right: confirmationTitleLabel.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 100)
        resendButton.anchor(top: confirmationDescriptionLabel.bottomAnchor, left: confirmationDescriptionLabel.leftAnchor, bottom: nil, right: confirmationDescriptionLabel.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 32)
        
    }
    
    func handleResend() {
        print(123)
    }
    
    func handleDismiss() {
        dismiss(animated: true) {
            UIApplication.shared.statusBarStyle = .lightContent
        }
    }
    
}
