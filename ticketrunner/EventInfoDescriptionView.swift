//
//  EventInfoDescriptionView.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 09.10.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class EventInfoDescriptionView: CustomUIView {
    
    let eventDesriptionHeadlineLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorCodes.textColorGrey
        label.text = "Event Description"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 5
        label.font = UIFont.systemFont(ofSize: 14)
        label.lineBreakMode = .byTruncatingTail
        label.text = "Ein Herrensitz in Cornwall: Nicolas Conman, Selfmademillionär und Oberhaupt eines neureichen Familienclans, feiert seinen 60. Geburtstag. Da er dem Tod geweiht ist, kommen noch mehr Erbschleicher als üblich. Seine Angehörigen zermürbt das alljährliche Possenspiel. Die Rangelei um Nicolas' Gunst und Habe schürt Heimlichkeiten, Intrigen, Lügen und Verrat. Doch dieses Jahr hat die Familie noch ganz andere Sorgen. Denn wie es aussieht, geht einer von ihnen über Leichen und versetzt die Teegesellschaft in Angst und Schrecken…"
        return label
    }()
    
    let moreDescriptionButton: UIButton = {
        let button = UIButton()
        button.setTitle("show more", for: .normal)
//        button.addTarget(self, action: #selector(handleShowEventDescription), for: .touchUpInside)
        button.setTitleColor(ColorCodes.lightGrayText, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.backgroundColor = UIColor.white
        
        addSubview(eventDesriptionHeadlineLabel)
        addSubview(descriptionLabel)
        addSubview(moreDescriptionButton)
        
        eventDesriptionHeadlineLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        descriptionLabel.anchor(top: eventDesriptionHeadlineLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 4, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 105)
        
        moreDescriptionButton.anchor(top: descriptionLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 30)
    }
    
    
    
}












