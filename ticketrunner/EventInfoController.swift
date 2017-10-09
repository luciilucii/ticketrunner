//
//  EventInfoController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 09.10.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class EventInfoController: ScrollController {
    
    var event: Event? {
        didSet {
            print(event?.name)
        }
    }
    
    let eventImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .brown
        iv.image = #imageLiteral(resourceName: "event5")
        return iv
    }()
    
    let eventInfoHeadlineView: EventInfoHeadlineView = {
        let view = EventInfoHeadlineView()
        return view
    }()
    
    let eventInfoDescriptionView: EventInfoDescriptionView = {
        let view = EventInfoDescriptionView()
        return view
    }()
    
    let eventInfoLineUpContainerView: EventInfoLineUpContainerView = {
        let view = EventInfoLineUpContainerView()
        return view
    }()
    
    let eventInfoMapView: EventInfoMapView = {
        let view = EventInfoMapView()
        return view
    }()
    
    lazy var promoteButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = ColorCodes.ticketrunnerBlue
        button.layer.cornerRadius = 5
        button.setTitle("Promote", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor.white, for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(handlePromote), for: .touchUpInside)
        return button
    }()
    
    let promoteButtonHelperView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCodes.controllerBackground
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.setupScrollView(height: 1500)
        
        super.setupController()
        
        setupNavBarButtons()
        
        setupWhiteTitle(title: "Event Info")
        
        setupViews()
    }
    
    override func setupViews() {
        scrollContainerView.addSubview(eventImageView)
        scrollContainerView.addSubview(eventInfoHeadlineView)
        scrollContainerView.addSubview(eventInfoDescriptionView)
        scrollContainerView.addSubview(eventInfoLineUpContainerView)
        scrollContainerView.addSubview(eventInfoMapView)
        
        view.addSubview(promoteButton)
        view.addSubview(promoteButtonHelperView)
        
        eventImageView.anchor(top: topLayoutGuide.topAnchor, left: scrollContainerView.leftAnchor, bottom: scrollContainerView.topAnchor, right: scrollContainerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: -175, paddingRight: 0, width: 0, height: 0)
        
        eventInfoHeadlineView.anchor(top: scrollContainerView.topAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 175, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 106 /*die 150 nur als beispiel, it's view.frame.width / 2.7*/)
        
        eventInfoDescriptionView.anchor(top: eventInfoHeadlineView.bottomAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 185)
        
        
        eventInfoLineUpContainerView.anchor(top: eventInfoDescriptionView.bottomAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 324)
        
        eventInfoMapView.anchor(top: eventInfoLineUpContainerView.bottomAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 300)
        
        
        if #available(iOS 11.0, *) {
            promoteButton.anchor(top: nil, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 50)
        } else {
            // Fallback on earlier versions
            promoteButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 50)
        }
        
        promoteButtonHelperView.anchor(top: promoteButton.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
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
    
    func handlePromote() {
        let promoteController = EventPromoteController()
        self.show(promoteController, sender: self)
    }
    
}
