//
//  EventInfoDescriptionView.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 09.10.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class EventInfoDescriptionView: CustomUIView {
    
    let eventDesriptionHeadlineLabel: H2 = {
        let label = H2()
        label.text = "Event Description"
        return label
    }()
    
    let descriptionLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 5
        label.lineBreakMode = .byTruncatingTail
        label.text = "Ein Herrensitz in Cornwall: Nicolas Conman, Selfmademillionär und Oberhaupt eines neureichen Familienclans, feiert seinen 60. Geburtstag. Da er dem Tod geweiht ist, kommen noch mehr Erbschleicher als üblich. Seine Angehörigen zermürbt das alljährliche Possenspiel. Die Rangelei um Nicolas' Gunst und Habe schürt Heimlichkeiten, Intrigen, Lügen und Verrat. Doch dieses Jahr hat die Familie noch ganz andere Sorgen. Denn wie es aussieht, geht einer von ihnen über Leichen und versetzt die Teegesellschaft in Angst und Schrecken…"
        return label
    }()
    
    let moreDescriptionButton: ShowMoreButton = {
        let button = ShowMoreButton(frame: .zero)
//        button.addTarget(self, action: #selector(handleShowEventDescription), for: .touchUpInside)
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












