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
        
        scrollContainerView.addSubview(facebookShareView)
        
        facebookShareView.anchor(top: scrollContainerView.topAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 500)
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
