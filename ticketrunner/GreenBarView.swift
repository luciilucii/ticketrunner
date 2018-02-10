//
//  GreenBarView.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 10.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class GreenBarView: CustomUIView {
    
    override func setupViews() {
        super.setupViews()
        
        
    }
    
    override var bounds: CGRect {
        didSet {
            self.applyGradient(colours: [ColorCodes.ticketrunnerBlue.cgColor, ColorCodes.ticketrunnerGreen.cgColor])
        }
    }
    
}
