//
//  ShareFacebookController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 10.11.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class ShareFacebookController: ScrollController {
    
    var event: Event? {
        didSet {
            self.facebookShareView.event = event
        }
    }
    
    let stepView: StepsView = {
        let view = StepsView()
        view.setupThirdStep()
        return view
    }()
    
    lazy var facebookShareView: FacebookShareView = {
        let view = FacebookShareView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.setupScrollView(height: 2500)
        
        super.setupController()
        
        setupNavBarButtons()
        
        hideKeyboardWhenTappedAround(views: [view, scrollContainerView, scrollView])
        
        setupWhiteTitle(title: "Share through Facebook")
    }
    
    override func setupViews() {
        super.setupViews()
        
        scrollContainerView.addSubview(stepView)
        scrollContainerView.addSubview(facebookShareView)
        
        
        stepView.anchor(top: scrollContainerView.topAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 150)
        
        
        facebookShareView.anchor(top: stepView.bottomAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 298)
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
