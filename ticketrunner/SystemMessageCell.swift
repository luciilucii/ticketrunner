//
//  SystemMessageCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 11.08.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

protocol SystemMessageCellDelegate {
    func didTapCancel(indexPath: IndexPath)
}

class SystemMessageCell: TableCell {
    
    var indexPath: IndexPath?
    
    var delegate: SystemMessageCellDelegate?
    
    let alertImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "System Message Icon").withRenderingMode(.alwaysTemplate)
        iv.tintColor = UIColor.white
        return iv
    }()
    
    let headlineLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.font = UIFont.boldSourceSansPro(ofSize: 14)
        label.textColor = UIColor.white
        label.text = "System Alert Message"
        return label
    }()
    
    let messageLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.textColor = .white
        label.text = "This is the actual message. This could be long, could be short. It is displayed in full length."
        label.numberOfLines = 0
        return label
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "cancel").withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = UIColor(white: 0, alpha: 0.15)
        button.addTarget(self, action: #selector(handleDeleteCell), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        layer.cornerRadius = 5
//        view.backgroundColor = ColorCodes.homeYellow
        view.backgroundColor = ColorCodes.ticketrunnerRed
        
        view.addSubview(alertImageView)
        alertImageView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
        alertImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        view.addSubview(headlineLabel)
        headlineLabel.anchor(top: view.topAnchor, left: alertImageView.rightAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 4, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 25)
        
        view.addSubview(messageLabel)
        messageLabel.anchor(top: headlineLabel.bottomAnchor, left: headlineLabel.leftAnchor, bottom: view.bottomAnchor, right: headlineLabel.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 8, paddingRight: 0, width: 0, height: 0)
        
        view.addSubview(cancelButton)
        cancelButton.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 4, width: 35, height: 35)
        
        
    }
    
    @objc func handleDeleteCell() {
        guard let indexPath = indexPath else { return }
        delegate?.didTapCancel(indexPath: indexPath)
    }
    
}
