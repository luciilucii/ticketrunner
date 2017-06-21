//
//  LandingPagePreviewContainer.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 11.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class LandingPagePreviewContainer: UIView, UITextViewDelegate {
    
    var detailController: DetailPromoteEventController?
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Landing Page Preview"
        label.textColor = UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "You can choose to direct everyone to your Landing page to provide more info about the event you are promoting, and helps increase sales."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        label.numberOfLines = 5
        return label
    }()
    
    let activateBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        return view
    }()
    
    let activateSwitchController: UISwitch = {
        let switchView = UISwitch()
        switchView.isOn = false
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.onTintColor = UIColor(red:0.25, green:0.89, blue:0.56, alpha:1.0)
        switchView.addTarget(self, action: #selector(switchValueDidChange), for: .valueChanged)
        return switchView
    }()
    
    let activateLandingPageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Activate Landing Page"
        label.textColor = UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let landingPageBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        return view
    }()
    
    let landingPageProfileImageSwitchController: UISwitch = {
        let switchView = UISwitch()
        switchView.isOn = true
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.onTintColor = UIColor(red:0.25, green:0.89, blue:0.56, alpha:1.0)
        switchView.addTarget(self, action: #selector(profileSwitchValueDidChange), for: .valueChanged)
        return switchView
    }()
    
    let landingPageProfileImageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Show my profile picture"
        label.textColor = UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let customTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Custom Landing Page message"
        label.textColor = UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let customTextSubtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "You can choose to direct everyone to your Landing page to provide more info about the event you are promoting, and helps increase sales."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        label.numberOfLines = 5
        return label
    }()
    
    lazy var customMessageTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.backgroundColor = UIColor.white
        textView.delegate = self
        textView.layer.borderColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor
//        textView.text = "Add a personal Message to your Landing Page"
        textView.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return textView
    }()
    
    let previewLandingPageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Preview Landing Page", for: .normal)
        button.addTarget(self, action: #selector(handlePreview), for: .touchUpInside)
        button.backgroundColor = UIColor(red:0.00, green:0.75, blue:0.95, alpha:1.0)
        button.tintColor = UIColor.white
        return button
    }()
    
    let updateLandingPageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Update Landing Page", for: .normal)
        button.addTarget(self, action: #selector(handleUpdateLandingPage), for: .touchUpInside)
        button.backgroundColor = UIColor(red:0.25, green:0.89, blue:0.56, alpha:1.0)
        button.tintColor = UIColor.white
        return button
    }()
    
    func switchValueDidChange() {
        
        if activateSwitchController.isOn == true {
            print("on")
        } else {
            print("off")
        }
        
    }
    
    func profileSwitchValueDidChange() {
        if landingPageProfileImageSwitchController.isOn == true {
            print("profile on")
        } else {
            print("profile off")
        }
    }
    
    func handlePreview() {
        print("Preview")
    }
    
    func handleUpdateLandingPage() {
        print("Update")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
    }
    
    func setupViews() {
        
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(activateBackgroundView)
        addSubview(activateSwitchController)
        addSubview(activateLandingPageLabel)
        addSubview(landingPageBackgroundView)
        addSubview(landingPageProfileImageSwitchController)
        addSubview(landingPageProfileImageLabel)
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        subtitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        subtitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        subtitleLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        
        
        activateSwitchController.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 8).isActive = true
        activateSwitchController.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        activateSwitchController.widthAnchor.constraint(equalToConstant: 50).isActive = true
        activateSwitchController.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        activateBackgroundView.topAnchor.constraint(equalTo: activateSwitchController.topAnchor).isActive = true
        activateBackgroundView.leftAnchor.constraint(equalTo: activateSwitchController.leftAnchor).isActive = true
        activateBackgroundView.rightAnchor.constraint(equalTo: activateSwitchController.rightAnchor).isActive = true
        activateBackgroundView.bottomAnchor.constraint(equalTo: activateSwitchController.bottomAnchor, constant: -1).isActive = true
        
        
        activateLandingPageLabel.leftAnchor.constraint(equalTo: activateSwitchController.rightAnchor, constant: 8).isActive = true
        activateLandingPageLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        activateLandingPageLabel.topAnchor.constraint(equalTo: activateSwitchController.topAnchor).isActive = true
        activateLandingPageLabel.bottomAnchor.constraint(equalTo: activateSwitchController.bottomAnchor).isActive = true
        
        landingPageProfileImageSwitchController.leftAnchor.constraint(equalTo: activateSwitchController.leftAnchor).isActive = true
        landingPageProfileImageSwitchController.rightAnchor.constraint(equalTo: activateSwitchController.rightAnchor).isActive = true
        landingPageProfileImageSwitchController.topAnchor.constraint(equalTo: activateSwitchController.bottomAnchor, constant: 16).isActive = true
        landingPageProfileImageSwitchController.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        landingPageBackgroundView.topAnchor.constraint(equalTo: landingPageProfileImageSwitchController.topAnchor).isActive = true
        landingPageBackgroundView.leftAnchor.constraint(equalTo: landingPageProfileImageSwitchController.leftAnchor).isActive = true
        landingPageBackgroundView.rightAnchor.constraint(equalTo: landingPageProfileImageSwitchController.rightAnchor).isActive = true
        landingPageBackgroundView.bottomAnchor.constraint(equalTo: landingPageProfileImageSwitchController.bottomAnchor, constant: -1).isActive = true
        
        
        landingPageProfileImageLabel.leftAnchor.constraint(equalTo: landingPageProfileImageSwitchController.rightAnchor, constant: 8).isActive = true
        landingPageProfileImageLabel.topAnchor.constraint(equalTo: landingPageProfileImageSwitchController.topAnchor).isActive = true
        landingPageProfileImageLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        landingPageProfileImageLabel.bottomAnchor.constraint(equalTo: landingPageProfileImageSwitchController.bottomAnchor).isActive = true
        
        setupCustomTextViews()
        
        
    }
    
    func setupCustomTextViews() {
        
        addSubview(customTextLabel)
        addSubview(customTextSubtitleLabel)
        addSubview(customMessageTextView)
        addSubview(previewLandingPageButton)
        addSubview(updateLandingPageButton)
        
        customTextLabel.topAnchor.constraint(equalTo: landingPageProfileImageLabel.bottomAnchor, constant: 16).isActive = true
        customTextLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        customTextLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        customTextLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        customTextSubtitleLabel.topAnchor.constraint(equalTo: customTextLabel.bottomAnchor).isActive = true
        customTextSubtitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        customTextSubtitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        customTextSubtitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        customMessageTextView.topAnchor.constraint(equalTo: customTextSubtitleLabel.bottomAnchor, constant: 8).isActive = true
        customMessageTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        customMessageTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        customMessageTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        previewLandingPageButton.topAnchor.constraint(equalTo: customMessageTextView.bottomAnchor).isActive = true
        previewLandingPageButton.leftAnchor.constraint(equalTo: customMessageTextView.leftAnchor).isActive = true
        previewLandingPageButton.rightAnchor.constraint(equalTo: customMessageTextView.rightAnchor).isActive = true
        previewLandingPageButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        updateLandingPageButton.topAnchor.constraint(equalTo: previewLandingPageButton.bottomAnchor, constant: 8).isActive = true
        updateLandingPageButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        updateLandingPageButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        updateLandingPageButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if textView == customMessageTextView {
            guard let controller = detailController else {
                return
            }
            
            controller.isCustomLandingPageMessageIsEditing = true
        }
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if textView == customMessageTextView {
            guard let controller = detailController else {
                return
            }
            
            controller.isCustomLandingPageMessageIsEditing = false
        }
        
    }
    
}








