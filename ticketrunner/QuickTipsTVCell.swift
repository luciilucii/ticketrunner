//
//  QuickTipsTVCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 23.12.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class QuickTipsTVCell: BaseCell {
    
    let headlineLabel: H2 = {
        let label = H2()
        label.textAlignment = .left
        label.text = "The Sky is the limit!"
        return label
    }()
    
    let subtitleLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.numberOfLines = 0
        label.text = """
        Ready to get the best gifts of the week? Start to promoting Britney Spears event link on Social Media and get the VIP Access
        """
        return label
    }()
    
    let checkmarkImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Checkmark")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCodes.controllerBackground
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        addSubview(checkmarkImageView)
        checkmarkImageView.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 40, height: 40)
        checkmarkImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        checkmarkImageView.layer.cornerRadius = 20
        
        addSubview(headlineLabel)
        headlineLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: checkmarkImageView.leftAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 25)
        
        addSubview(subtitleLabel)
        subtitleLabel.anchor(top: headlineLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: checkmarkImageView.leftAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
        
        addSubview(seperatorView)
        seperatorView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
    }
    
}








