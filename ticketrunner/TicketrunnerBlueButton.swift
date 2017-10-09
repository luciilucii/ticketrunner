//
//  TicketrunnerBlueButton.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 09.10.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class TicketrunnerBlueButton: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        
        self.backgroundColor = ColorCodes.ticketrunnerBlue
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
