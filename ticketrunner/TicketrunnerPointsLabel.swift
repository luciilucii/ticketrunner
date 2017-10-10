//
//  TicketrunnerPointsLabel.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 09.10.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class TicketrunnerPointsLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.textColor = ColorCodes.ticketrunnerGreen
        self.textAlignment = .center
        self.font = UIFont.boldSystemFont(ofSize: 18)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
