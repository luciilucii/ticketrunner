//
//  ShowMoreButton.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 20.10.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class ShowMoreButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.titleLabel?.font = UIFont.boldSourceSansPro(ofSize: 16)
        self.setTitle("show more", for: .normal)
        self.setTitleColor(ColorCodes.lightGrayText, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
