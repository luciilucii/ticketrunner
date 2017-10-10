//
//  EventRewardsController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 09.10.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class EventRewardsController: ScrollController {
    
    var event: Event? {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.setupScrollView(height: 1500)
        
        super.setupController()
        
        setupNavBarButtons()
        
        setupWhiteTitle(title: "Rewards")
        
        setupViews()
        
        
    }
    
    override func setupViews() {
        super.setupViews()
        
        
    }
    
    func setupNavBarButtons() {
        
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "icon_back").withRenderingMode(.alwaysTemplate), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.tintColor = UIColor.white
        button.addTarget(self, action: #selector(handlePopView), for: .touchUpInside)
        
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 45)
        
        let backButton = UIBarButtonItem(customView: button)
        backButton.width = 15
        
        let menuCustomView = UIButton()
        menuCustomView.setImage(#imageLiteral(resourceName: "menu_icon_3").withRenderingMode(.alwaysTemplate), for: .normal)
        menuCustomView.addTarget(self, action: #selector(handleNavigationMenu), for: .touchUpInside)
        menuCustomView.tintColor = UIColor.white
        
        menuCustomView.frame = CGRect(x: 0, y: 0, width: 35, height: 45)
        let menuButton = UIBarButtonItem(customView: menuCustomView)
        menuButton.width = 45
        
        navigationItem.leftBarButtonItems = [backButton, menuButton]
    }
    
    func handlePopView() {
        navigationController?.popViewController(animated: true)
    }
    
    func handleNavigationMenu() {
        handleMenu()
    }
    
}
