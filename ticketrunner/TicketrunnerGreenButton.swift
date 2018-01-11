//
//  TicketrunnerGreenButton.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 09.10.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class TicketrunnerGreenButton: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        
        self.backgroundColor = ColorCodes.ticketrunnerGreen
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.titleLabel?.font = UIFont.boldSourceSansPro(ofSize: 16)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class TicketrunnerBorderedButton: UIButton {
    
    init(title: String, color: UIColor = ColorCodes.lightGrayText) {
        super.init(frame: .zero)
        
        self.backgroundColor = .clear
        self.setTitle(title, for: .normal)
        self.setTitleColor(color, for: .normal)
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.titleLabel?.font = UIFont.boldSourceSansPro(ofSize: 16)
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 2
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class TicketrunnerGrayButton: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        
        self.backgroundColor = ColorCodes.lightGrayText
        self.setTitle(title, for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.titleLabel?.font = UIFont.boldSourceSansPro(ofSize: 16)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
