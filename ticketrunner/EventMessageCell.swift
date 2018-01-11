//
//  EventMessageCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 21.12.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

enum EventMessageCellType {
    case accepted
    case notMuchTimeLeft
}

class EventMessageCell: TableCell {
    
    var cellType: EventMessageCellType? {
        didSet {
            guard let cellType = cellType else { return }
            switch cellType {
            case .accepted:
                view.backgroundColor = ColorCodes.ticketrunnerGreen
            case .notMuchTimeLeft:
                view.backgroundColor = ColorCodes.darkPurple
            }
        }
    }
    
    let eventImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderColor = ColorCodes.homeYellow.cgColor
        iv.layer.borderWidth = 2
        iv.image = #imageLiteral(resourceName: "event")
        return iv
    }()
    
    let titleLabel: H1 = {
        let label = H1()
        label.text = "Almost There!"
        label.textColor = UIColor.white
        label.textAlignment = .left
        return label
    }()
    
    let descriptionLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.textColor = UIColor.white
        label.text = "Only 2 more weeks until Tomorrowland and you are missing 200° to get Backstage Access"
        label.numberOfLines = 0
        return label
    }()
    
    override func setupViews() {
        
        addSubview(shadowView)
        addSubview(view)
        shadowView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
        view.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
        
        shadowView.layer.shadowOpacity = 0.4
        shadowView.layer.shadowOffset = CGSize(width: 3.0, height: 2.0)
        shadowView.layer.shadowColor = UIColor.darkGray.cgColor
        shadowView.layer.shadowRadius = 5.0
        
        view.addSubview(eventImageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        
        eventImageView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 75, height: 75)
        eventImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        eventImageView.layer.cornerRadius = 75 / 2
        
        titleLabel.anchor(top: topAnchor, left: eventImageView.rightAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 8, width: 0, height: 35)
        
        descriptionLabel.anchor(top: titleLabel.bottomAnchor, left: eventImageView.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
        
        
    }
    
}










