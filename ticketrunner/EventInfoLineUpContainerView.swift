//
//  EventInfoLineUpContainerView.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 09.10.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class EventInfoLineUpContainerView: CustomUIView {
    
    var event: Event? {
        didSet {
            print("hello dog")
        }
    }
    
    let lineUpContainer: ArtistLineUpContainer = {
        let container = ArtistLineUpContainer()
        return container
    }()
    
    override func setupViews() {
        super.setupViews()
        
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        backgroundColor = .white
        
        addSubview(lineUpContainer)
        
        lineUpContainer.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 324)
    }
    
}
