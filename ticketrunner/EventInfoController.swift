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
            setupViews()
        }
    }
    
    var containerArray = [UIView]()
    
    let eventImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
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
    
    lazy var eventInfoLineUpContainerView: ArtistLineUpContainer = {
        let view = ArtistLineUpContainer()
        view.controller = self
        return view
    }()
    
    let eventInfoMapView: EventInfoMapView = {
        let view = EventInfoMapView()
        return view
    }()
    
    lazy var videoView: EventInfoVideoContainer = {
        let container = EventInfoVideoContainer()
        container.controller = self
        return container
    }()
    
    lazy var promoteButton: TicketrunnerBlueButton = {
        let button = TicketrunnerBlueButton(title: "Promote")
        button.addTarget(self, action: #selector(handlePromote), for: .touchUpInside)
        button.layer.zPosition = 1
        return button
    }()
    
    let promoteButtonHelperView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCodes.controllerBackground
        return view
    }()
    
    lazy var facebookButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.white
        button.setTitle("Facebook", for: .normal)
        button.setTitleColor(ColorCodes.ticketrunnerBlue, for: .normal)
        button.addTarget(self, action: #selector(handleShowInFacebook), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.setupScrollView(height: 2500)
        
        super.setupController()
        
        setupNavBarButtons()
        
        setupWhiteTitle(title: "Event Info")
        
    }
    
    override func setupViews() {
        scrollContainerView.addSubview(eventImageView)
        scrollContainerView.addSubview(eventInfoHeadlineView)
        scrollContainerView.addSubview(eventInfoDescriptionView)
        
        
        view.addSubview(promoteButton)
        view.addSubview(promoteButtonHelperView)
        
        let eventImageHeight = view.frame.width / 2.7
        
        eventImageView.anchor(top: topLayoutGuide.topAnchor, left: scrollContainerView.leftAnchor, bottom: scrollContainerView.topAnchor, right: scrollContainerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: -eventImageHeight, paddingRight: 0, width: 0, height: 0)
        
        eventInfoHeadlineView.anchor(top: scrollContainerView.topAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: eventImageHeight, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 106 /*die 150 nur als beispiel, it's view.frame.width / 2.7*/)
        
        eventInfoDescriptionView.anchor(top: eventInfoHeadlineView.bottomAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 185)
        
        
        
        if #available(iOS 11.0, *) {
            promoteButton.anchor(top: nil, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 50)
        } else {
            // Fallback on earlier versions
            promoteButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 50)
        }
        
        promoteButtonHelperView.anchor(top: promoteButton.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: -5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        
        setupViewsInController()
    }
    
    fileprivate func setupViewsInController() {
        containerArray.append(eventImageView)
        containerArray.append(eventInfoHeadlineView)
        containerArray.append(eventInfoDescriptionView)
        //TODO: Setup all containers in array & anchor the optional container to the last container in the array
        
        if let eventArtists = event?.artists {
            eventInfoLineUpContainerView.artists = eventArtists
            let height = eventInfoLineUpContainerView.getHeight()
            scrollContainerView.addSubview(eventInfoLineUpContainerView)
            
            guard let lastContainer = containerArray.last else { return }
            
            eventInfoLineUpContainerView.anchor(top: lastContainer.bottomAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: height)
            
            containerArray.append(eventInfoLineUpContainerView)
            
        }
        
        if let videoLink = event?.videoLink {
            scrollContainerView.addSubview(videoView)
            
            let height = (((view.frame.width - 32) / 16) * 9) + 46
            guard let lastContainer = containerArray.last else { return }
            
            videoView.anchor(top: lastContainer.bottomAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: height)
            
            
            containerArray.append(videoView)
        }
        
        if event?.latidute != nil && event?.longitude != nil {
            scrollContainerView.addSubview(eventInfoMapView)
            guard let lastContainer = containerArray.last else { return }
            eventInfoMapView.anchor(top: lastContainer.bottomAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 300)
            
            containerArray.append(eventInfoMapView)
        }
        
        if let facebookLink = event?.facebookPageLink {
            scrollContainerView.addSubview(facebookButton)
            
            guard let lastContainer = containerArray.last else { return }
            facebookButton.anchor(top: lastContainer.bottomAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
            
        }
        
        eventInfoMapView.currentEvent = event
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

    @objc func handlePromote() {
        let sellTicketsController = SellTicketsController()
        sellTicketsController.event = self.event
        self.show(sellTicketsController, sender: self)
    }
    
    @objc func handleShowInFacebook() {
        print("facebook")
    }
    
}
