//
//  HeadlineLabel.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 09.10.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class HeadlineLabel: UILabel {
    
    init(title: String) {
        super.init(frame: .zero)
        
        self.textColor = ColorCodes.textColorGrey
        self.text = title
        self.textAlignment = .center
        self.font = UIFont.boldSystemFont(ofSize: 14)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
