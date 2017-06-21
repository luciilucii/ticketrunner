//
//  FacebookPreviewContainer.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 11.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class FacebookPreviewContainer: UIView {
    
    let facebookPreviewTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Facebook Post Preview"
        label.textColor = UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let facebookPreviewSubtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This is what it will look like when one of our Ticketrunners shares your their link to your event on Facebook."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        label.numberOfLines = 5
        return label
    }()
    
    //MARK: Facebook Post
    
    let facebookPostContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let facebookPostProfileImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "profile_avatar")
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let facebookPostNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Florian Eckelmann"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor(red:0.07, green:0.21, blue:0.49, alpha:1.0)
        return label
    }()
    
    let facebookPostDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return label
    }()
    
    //MARK: Facebook Post Link Container
    
    let facebookPostLinkContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0).cgColor
        return view
    }()
    
    let facebookPostLinkContainerImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        iv.image = UIImage(named: "event")
        return iv
    }()
    
    let facebookPostLinkContainerTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0)
        label.text = "This is a Hello Kitty Event"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let facebookPostLinkContainerDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        label.numberOfLines = 4
        label.text = "Ein Herrensitz in Cornwall: Nicolas Conman, Selfmademillionär und Oberhaupt eines neureichen Familienclans, feiert seinen 60. Geburtstag. Da er dem Tod geweiht ist, kommen noch mehr Erbschleicher als üblich. Seine Angehörigen zermürbt das alljährliche Possenspiel. Die Rangelei um Nicolas' Gunst und Habe schürt Heimlichkeiten, Intrigen, Lügen und Verrat. Doch dieses Jahr hat die Familie noch ganz andere Sorgen. Denn wie es aussieht, geht einer von ihnen über Leichen und versetzt die Teegesellschaft in Angst und Schrecken…"
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let facebookPostLinkContainerLink: UILabel = {
        let label = UILabel()
        label.text = "HTTP://BETA.TICKETRUNNER.COM/"
        label.textColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0)
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        setupFacebookPreviewContainer()
        
    }
    
    func setupFacebookPreviewContainer() {
        
        addSubview(facebookPreviewTitleLabel)
        addSubview(facebookPreviewSubtitleLabel)
        addSubview(facebookPostContainerView)
        
        
        
        //x,y,w,h
        facebookPreviewTitleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        facebookPreviewTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        facebookPreviewTitleLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        facebookPreviewTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //x,y,w,h
        facebookPreviewSubtitleLabel.topAnchor.constraint(equalTo: facebookPreviewTitleLabel.bottomAnchor).isActive = true
        facebookPreviewSubtitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        facebookPreviewSubtitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        facebookPreviewSubtitleLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        //x,y,w,h
        facebookPostContainerView.topAnchor.constraint(equalTo: facebookPreviewSubtitleLabel.bottomAnchor).isActive = true
        facebookPostContainerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        facebookPostContainerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        facebookPostContainerView.heightAnchor.constraint(equalToConstant: 413).isActive = true
        
        setupfacebookPostContainerView()
    }
    
    func setupfacebookPostContainerView() {
        facebookPostContainerView.addSubview(facebookPostProfileImageView)
        facebookPostContainerView.addSubview(facebookPostNameLabel)
        facebookPostContainerView.addSubview(facebookPostLinkContainer)
        facebookPostContainerView.addSubview(facebookPostDescriptionLabel)
        
        //x,y,w,h
        facebookPostProfileImageView.topAnchor.constraint(equalTo: facebookPostContainerView.topAnchor, constant: 8).isActive = true
        facebookPostProfileImageView.leftAnchor.constraint(equalTo: facebookPostContainerView.leftAnchor, constant: 8).isActive = true
        facebookPostProfileImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        facebookPostProfileImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        //x,y,w,h
        facebookPostNameLabel.topAnchor.constraint(equalTo: facebookPostProfileImageView.topAnchor).isActive = true
        facebookPostNameLabel.leftAnchor.constraint(equalTo: facebookPostProfileImageView.rightAnchor, constant: 8).isActive = true
        facebookPostNameLabel.bottomAnchor.constraint(equalTo: facebookPostProfileImageView.bottomAnchor).isActive = true
        facebookPostNameLabel.rightAnchor.constraint(equalTo: facebookPostContainerView.rightAnchor, constant: -8).isActive = true
        
        //x,y,w,h
        facebookPostDescriptionLabel.topAnchor.constraint(equalTo: facebookPostProfileImageView.bottomAnchor, constant: 8).isActive = true
        facebookPostDescriptionLabel.leftAnchor.constraint(equalTo: facebookPostContainerView.leftAnchor, constant: 8).isActive = true
        facebookPostDescriptionLabel.rightAnchor.constraint(equalTo: facebookPostContainerView.rightAnchor, constant: -8).isActive = true
        facebookPostDescriptionLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        //x,y,w,h
        facebookPostLinkContainer.topAnchor.constraint(equalTo: facebookPostDescriptionLabel.bottomAnchor, constant: 8).isActive = true
        facebookPostLinkContainer.leftAnchor.constraint(equalTo: facebookPostContainerView.leftAnchor, constant: 8).isActive = true
        facebookPostLinkContainer.rightAnchor.constraint(equalTo: facebookPostContainerView.rightAnchor, constant: -8).isActive = true
        facebookPostLinkContainer.heightAnchor.constraint(equalToConstant: 241).isActive = true
        
        setupfacebookPostLinkContainer()
        
    }
    
    func setupfacebookPostLinkContainer() {
        
        facebookPostLinkContainer.addSubview(facebookPostLinkContainerImageView)
        facebookPostLinkContainer.addSubview(facebookPostLinkContainerTitleLabel)
        facebookPostLinkContainer.addSubview(facebookPostLinkContainerDescriptionLabel)
        facebookPostLinkContainer.addSubview(facebookPostLinkContainerLink)
        
        //x,y,w,h
        facebookPostLinkContainerImageView.topAnchor.constraint(equalTo: facebookPostLinkContainer.topAnchor).isActive = true
        facebookPostLinkContainerImageView.leftAnchor.constraint(equalTo: facebookPostLinkContainer.leftAnchor).isActive = true
        facebookPostLinkContainerImageView.rightAnchor.constraint(equalTo: facebookPostLinkContainer.rightAnchor).isActive = true
        facebookPostLinkContainerImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        //x,y,w,h
        facebookPostLinkContainerTitleLabel.leftAnchor.constraint(equalTo: facebookPostLinkContainer.leftAnchor, constant: 8).isActive = true
        facebookPostLinkContainerTitleLabel.topAnchor.constraint(equalTo: facebookPostLinkContainerImageView.bottomAnchor, constant: 8).isActive = true
        facebookPostLinkContainerTitleLabel.rightAnchor.constraint(equalTo: facebookPostLinkContainer.rightAnchor, constant: -8).isActive = true
        facebookPostLinkContainerTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //x,y,w,h
        facebookPostLinkContainerDescriptionLabel.leftAnchor.constraint(equalTo: facebookPostLinkContainer.leftAnchor, constant: 8).isActive = true
        facebookPostLinkContainerDescriptionLabel.topAnchor.constraint(equalTo: facebookPostLinkContainerTitleLabel.bottomAnchor, constant: 0).isActive = true
        facebookPostLinkContainerDescriptionLabel.rightAnchor.constraint(equalTo: facebookPostLinkContainer.rightAnchor, constant: -8).isActive = true
        facebookPostLinkContainerDescriptionLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        //x,y,w,h
        facebookPostLinkContainerLink.topAnchor.constraint(equalTo: facebookPostLinkContainerDescriptionLabel.bottomAnchor).isActive = true
        facebookPostLinkContainerLink.leftAnchor.constraint(equalTo: facebookPostLinkContainer.leftAnchor, constant: 8).isActive = true
        facebookPostLinkContainerLink.rightAnchor.constraint(equalTo: facebookPostLinkContainer.rightAnchor, constant: -8).isActive = true
        facebookPostLinkContainerLink.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
    }
    
}
