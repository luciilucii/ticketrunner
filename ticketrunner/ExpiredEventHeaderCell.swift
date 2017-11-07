//
//  ExpiredEventHeaderCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 04.11.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class ExpiredEventHeaderCell: TableCell {
    
    var downButtonState = ButtonState.down
    
    let headlineLabel: HeadlineLabel = {
        let label = HeadlineLabel(title: "Expired Events")
        return label
    }()
    
    lazy var downButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "down_button").withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = ColorCodes.inactiveElementsGrey
        button.addTarget(self, action: #selector(handleDownUp), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        layer.cornerRadius = 5
        clipsToBounds = true
        view.backgroundColor = UIColor.white
        
        setupSubViews()
    }
    
    fileprivate func setupSubViews() {
        
        view.addSubview(headlineLabel)
        view.addSubview(downButton)
        
        headlineLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        downButton.anchor(top: nil, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 12, width: 25, height: 25)
        downButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    @objc func handleDownUp() {
        if downButtonState == .up {
            self.downButtonState = .down
//            delegate?.handleUpDown(buttonState: .down)
            
            UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.downButton.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                self.layoutIfNeeded()
            }, completion: { (completed) in
                //completion
            })
            
            
        } else {
            self.downButtonState = .up
//            delegate?.handleUpDown(buttonState: .up)
            
            
            UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.downButton.transform = CGAffineTransform(rotationAngle: CGFloat(0))
                self.layoutIfNeeded()
            }, completion: { (completed) in
                //completion
            })
        }
    }
    
}













