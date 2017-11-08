//
//  NewChatCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 07.11.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class NewChatCell: TableCell {
    
    let newMessageLabel: H2 = {
        let label = H2()
        label.textAlignment = .left
        label.text = "New Message"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        view.backgroundColor = UIColor.white
        
        
        setupCellViews()
    }
    
    fileprivate func setupCellViews() {
        
        view.addSubview(newMessageLabel)
        
        newMessageLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
        
    }
    
}
