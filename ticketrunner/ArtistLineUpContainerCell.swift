//
//  ArtistLineUpContainerCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 01.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class ArtistLineUpContainerCell: BaseCell {
    
    let artistImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = UIColor(red:0.72, green:0.55, blue:0.99, alpha:1.0)
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 50
        return iv
    }()
    
    let artistNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Long Artist Name with lots of letters"
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(artistImageView)
        addSubview(artistNameLabel)
        
        //x,y,w,h
        artistImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        artistImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        artistImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        artistImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        //x,y,w,h
        artistNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        artistNameLabel.topAnchor.constraint(equalTo: artistImageView.bottomAnchor, constant: 4).isActive = true
        artistNameLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -8).isActive = true
        artistNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
}
