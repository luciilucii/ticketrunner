//
//  ActiveEventsHeader.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 26.01.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class ActiveEventsHeader: BaseCell {
    
    let calendarImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Calendar")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let titleLabel: H1 = {
        let label = H1()
        
        let attributedText = NSMutableAttributedString(string: "Active ", attributes: [NSAttributedStringKey.font: UIFont.boldSourceSansPro(ofSize: 28), NSAttributedStringKey.foregroundColor: UIColor.black])
        attributedText.append(NSMutableAttributedString(string: "Events", attributes: [NSAttributedStringKey.font: UIFont.boldSourceSansPro(ofSize: 28), NSAttributedStringKey.foregroundColor: ColorCodes.darkPurple]))
        
        
        label.attributedText = attributedText
        return label
    }()
    
    let searchTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Search for all Events"
        tf.leftView = UIImageView(image: #imageLiteral(resourceName: "search_icon").withRenderingMode(.alwaysTemplate))
        tf.leftView?.tintColor = ColorCodes.darkPurple
        tf.leftViewMode = .always
        tf.backgroundColor = UIColor.white
        tf.layer.cornerRadius = 10
        tf.font = UIFont.sourceSansPro(ofSize: 16)
        tf.setupShadows()
        
        return tf
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(calendarImageView)
        addSubview(titleLabel)
        addSubview(searchTextField)
        
        calendarImageView.anchor(top: topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 150)
        calendarImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        titleLabel.anchor(top: calendarImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 35)
        
        searchTextField.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 60)
        
        
    }
    
}








