//
//  CustomPointAnnotation.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 10.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit
import MapKit

class CustomPointAnnotation: MKPointAnnotation {
    
    var pinCustomImageName: String!
    
}

class CustomAnnotationView: MKPinAnnotationView {
    let selectedLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 140, height: 38))
    
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(false, animated: animated)
        
        if(selected)
        {
            // Do customization, for example:
            selectedLabel.text = "Hello World!!"
            selectedLabel.textAlignment = .center
            selectedLabel.font = UIFont.sourceSansPro(ofSize: 16)
            selectedLabel.backgroundColor = ColorCodes.controllerBackground
            selectedLabel.layer.borderColor = ColorCodes.textColorGrey.cgColor
            selectedLabel.layer.borderWidth = 2
            selectedLabel.layer.cornerRadius = 5
            selectedLabel.layer.masksToBounds = true
            
            selectedLabel.center.x = 0.5 * self.frame.size.width
            selectedLabel.center.y = -0.5 * selectedLabel.frame.height
            self.addSubview(selectedLabel)
        }
        else
        {
            selectedLabel.removeFromSuperview()
        }
    }
}
