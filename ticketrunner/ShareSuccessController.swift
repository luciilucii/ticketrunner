//
//  ShareSuccessController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 03.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class ShareSuccessController: ScrollController {
    
    let stepsView: StepsView = {
        let view = StepsView()
        view.setupThirdStep()
        return view
    }()
    
    lazy var shareSuccessView = ShareSuccessView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.setupScrollView(height: 712)
        
        super.setupController()
        
        setupNavBarButtons()
        
        setupWhiteTitle(title: "Promote Event")
        
        hideKeyboardWhenTappedAround(views: [view, scrollContainerView])
        
        setupViews()
    }
    
    override func setupViews() {
        
        scrollContainerView.addSubview(stepsView)
        scrollContainerView.addSubview(shareSuccessView)
        
        
        stepsView.anchor(top: scrollContainerView.topAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 150)
        
        shareSuccessView.anchor(top: stepsView.bottomAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 465)
        
    }
    
    func setupNavBarButtons() {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "icon_back").withRenderingMode(.alwaysTemplate), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.tintColor = ColorCodes.ticketrunnerPurple
        button.addTarget(self, action: #selector(handlePopView), for: .touchUpInside)
        
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 45)
        
        let backButton = UIBarButtonItem(customView: button)
        backButton.width = 15
        
        let menuCustomView = UIButton()
        menuCustomView.setImage(#imageLiteral(resourceName: "menu_icon_3").withRenderingMode(.alwaysTemplate), for: .normal)
        menuCustomView.addTarget(self, action: #selector(handleNavigationMenu), for: .touchUpInside)
        menuCustomView.tintColor = ColorCodes.ticketrunnerPurple
        
        menuCustomView.frame = CGRect(x: 0, y: 0, width: 35, height: 45)
        let menuButton = UIBarButtonItem(customView: menuCustomView)
        menuButton.width = 45
        
        navigationItem.leftBarButtonItems = [backButton, menuButton]
    }
    
    @objc func handlePopView() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleNavigationMenu() {
        handleMenu()
    }
    
    @objc func handleMenu() {
        menu.showMenu()
    }
    
    lazy var menu: Menu = {
        let menu = Menu()
        menu.startController = self
        return menu
    }()
    
}
