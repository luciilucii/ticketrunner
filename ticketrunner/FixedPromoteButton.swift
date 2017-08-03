//
//  FixedPromoteButton.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 03.08.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class FixedPromoteButton: NSObject {
    
    var view: UIView?
    
    lazy var promoteButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red:0.00, green:0.74, blue:1.00, alpha:1.0)
        button.setTitle("Promote", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.tintColor = UIColor.white
        button.layer.zPosition = 5
        button.addTarget(self, action: #selector(handlePromote), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    func handlePromote() {
        print("Hello")
    }
    
    override init() {
        super.init()
        
    }
    
    func setupViews() {
        
        if let keyWindow = UIApplication.shared.keyWindow {
            
            view = UIView()
            view?.layer.zPosition = 5
            view?.backgroundColor = .purple
//            view?.frame = keyWindow.frame
            
            guard let unwrappedView = view else {
                return
            }
            
            keyWindow.addSubview(unwrappedView)
            
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                unwrappedView.anchor(top: nil, left: keyWindow.leftAnchor, bottom: keyWindow.bottomAnchor, right: keyWindow.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
                
                
            }, completion: { (completedAnimation) in
                //maybe here sth later
            })
            
            unwrappedView.addSubview(promoteButton)
            promoteButton.anchor(top: unwrappedView.topAnchor, left: unwrappedView.leftAnchor, bottom: nil, right: unwrappedView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        }
        
    }
    
}
