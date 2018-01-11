//
//  MenuCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 28.05.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    func setupViews() {
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class MenuCell: BaseCell {
    
    var isMenuSelected = false
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0) : UIColor.white
            if isMenuSelected {
                menuLabel.textColor = ColorCodes.darkPurple
            } else {
                menuLabel.textColor = isHighlighted ? UIColor.white : ColorCodes.textColorGrey
            }
        }
    }
    
    let menuLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSourceSansPro(ofSize: 22)
        label.textColor = ColorCodes.textColorGrey
        return label
    }()
    
    let menuImageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 15
        iv.layer.masksToBounds = true
        iv.isHidden = true
        return iv
    }()
    
    var menuPoint: MenuPoint? {
        didSet {
            menuLabel.text = menuPoint?.name.rawValue
            
            guard let imageName = menuPoint?.imageName else {
                return
            }
            if imageName == "" {
                menuImageView.isHidden = true
                menuLabel.isHidden = false
            } else {
                menuLabel.isHidden = true
                menuImageView.isHidden = false
                menuImageView.image = UIImage(named: imageName)
            }
        }
    }
    
    override func setupViews() {
        let view = UIView()
        addSubview(view)
        view.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 50, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        // Create a gradient layer
        let gradient = CAGradientLayer()
        
        // gradient colors in order which they will visually appear
        gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        
        // Gradient from left to right
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        // set the gradient layer to the same size as the view
        gradient.frame = view.frame
        // add the gradient layer to the views layer for rendering
//        view.layer.addSublayer(gradient)
        
        
        view.addSubview(menuLabel)
        addSubview(menuImageView)
        
        menuLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
//        view.mask = menuLabel
        
        menuImageView.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 50, paddingBottom: 0, paddingRight: 0, width: 30, height: 30)
        menuImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    
}
