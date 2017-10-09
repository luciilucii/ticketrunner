//
//  FixedPromoteButton.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 03.08.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class FixedPromoteButton: UIButton {
    
    var viewController: UIViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = ColorCodes.ticketrunnerBlue
        self.setTitle("Promote", for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        self.addTarget(self, action: #selector(handleShowPromoteController), for: .touchUpInside)
        self.setTitleColor(UIColor.white, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleShowPromoteController() {
        let controller = FixedPromoteController()
        let navController = UINavigationController(rootViewController: controller)

        viewController?.present(navController, animated: true, completion: {
            //completion here
        })
    }
    
}







