//
//  WhiteView.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 05.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class WhiteView: CustomUIView {
    
    override func setupViews() {
        super.setupViews()
        
        layer.cornerRadius = 5
        backgroundColor = .white
        setupShadows()
        
    }
    
}
