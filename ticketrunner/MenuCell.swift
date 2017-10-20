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
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0) : UIColor.white
            menuLabel.textColor = isHighlighted ? UIColor.white : UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0)
            
        }
    }
    
    let menuLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSourceSansPro(ofSize: 20)
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
        
        addSubview(menuLabel)
        addSubview(menuImageView)
        
        addContraintsWithFormat(format: "H:|-50-[v0]|", views: menuLabel)
        addContraintsWithFormat(format: "V:|[v0]|", views: menuLabel)
        
        addContraintsWithFormat(format: "H:|-50-[v0(30)]", views: menuImageView)
        menuImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        menuImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    
}
