//
//  ShareLinkController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 10.11.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

enum ShareLinkControllerMode {
    case publicMode
    case privateMode
}

class ShareLinkController: UIViewController, ShareLinkViewDelegate {
    
    var event: Event? {
        didSet {
            shareLinkPublicView.event = event
            shareLinkPersonalView.event = event
        }
    }
    
    let stepView: StepsView = {
        let view = StepsView()
        view.setupSecondStep()
        return view
    }()
    
    lazy var shareLinkPublicView: ShareLinkPublicView = {
        let view = ShareLinkPublicView()
        view.controller = self
        view.delegate = self
        return view
    }()
    
    lazy var shareLinkPersonalView: ShareLinkPersonalView = {
        let view = ShareLinkPersonalView()
        view.controller = self
        view.delegate = self
        return view
    }()
    
    var controllerMode: ShareLinkControllerMode
    
    init(controllerMode: ShareLinkControllerMode) {
        self.controllerMode = controllerMode
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWhiteTitle(title: "Share Ticketrunner Link")
        setupNavBarButtons()
        
        view.backgroundColor = ColorCodes.controllerBackground
        
        if controllerMode == .privateMode {
            self.setupPersonalController()
        } else {
            self.setupPublicController()
        }
    }
    
    fileprivate func setupPersonalController() {
        view.addSubview(stepView)
        view.addSubview(shareLinkPersonalView)
        
        if #available(iOS 11.0, *) {
            stepView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 150)
        } else {
            // Fallback on earlier versions
            stepView.anchor(top: topLayoutGuide.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 150)
        }
        
        shareLinkPersonalView.anchor(top: stepView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 278)
        
    }
    
    fileprivate func setupPublicController() {
        view.addSubview(stepView)
        view.addSubview(shareLinkPublicView)
        
        if #available(iOS 11.0, *) {
            stepView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 150)
        } else {
            // Fallback on earlier versions
            stepView.anchor(top: topLayoutGuide.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 150)
        }
        
        shareLinkPublicView.anchor(top: stepView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 220)
        
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
    
    func didTapFacebook(event: Event) {
        let facebookController = ShareFacebookController()
        facebookController.event = event
        self.navigationController?.pushViewController(facebookController, animated: true)
    }
    
    func didTapTwitter(event: Event) {
        let shareController = ShareTwitterController()
        shareController.event = event
        self.navigationController?.pushViewController(shareController, animated: true)
    }
    
    func didTapEmail(event: Event) {
        let emailController = ShareEmailController()
        emailController.event = event
        self.navigationController?.pushViewController(emailController, animated: true)
    }
    
    func didTapWhatsapp(event: Event) {
        let whatsappController = ShareWhatsappController()
        whatsappController.event = event
        self.navigationController?.pushViewController(whatsappController, animated: true)
    }
    
    func didTapGetLink(event: Event) {
        let getLinkController = ShareGetLinkController()
        getLinkController.event = event
        self.navigationController?.pushViewController(getLinkController, animated: true)
    }
    
}







