//
//  EventRewardsController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 09.10.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class EventRewardsController: ScrollController, RewardsContainerEventCellDelegate {
    
    var event: Event? {
        didSet {
            rewardsContainer.event = self.event
        }
    }
    
    lazy var rewardsContainer: RewardsContainer = {
        let container = RewardsContainer()
        container.delegate = self
        return container
    }()
    
    lazy var eventRewardsTableContainer: EventRewardsTableContainer = {
        let container = EventRewardsTableContainer()
        container.eventRewardsController = self
        container.event = self.event
        return container
    }()
    
    let testView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var promoteButton: TicketrunnerBlueButton = {
        let button = TicketrunnerBlueButton(title: "Promote")
        button.addTarget(self, action: #selector(handlePromote), for: .touchUpInside)
        button.layer.zPosition = 1
        return button
    }()
    
    let promoteHelperView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCodes.controllerBackground
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.setupScrollView(height: 1500)
        
        super.setupController()
        
        setupNavBarButtons()
        
        setupWhiteTitle(title: "Rewards")
        
        setupViews()
    }
    
    var eventRewardsTableContainerHeight: CGFloat? {
        didSet {
            guard let height = eventRewardsTableContainerHeight else { return }
            eventRewardsTableContainerHeightAnchor?.constant = height
            
            UIView.animate(withDuration: 0.5, animations: {
                self.eventRewardsTableContainer.layoutIfNeeded()
            }) { _ in
                //completion here
            }
        }
    }
    
    var eventRewardsTableContainerHeightAnchor: NSLayoutConstraint?
    
    override func setupViews() {
        super.setupViews()
        
        scrollContainerView.addSubview(rewardsContainer)
        scrollContainerView.addSubview(eventRewardsTableContainer)
        view.addSubview(promoteButton)
        view.addSubview(promoteHelperView)
        
        rewardsContainer.anchor(top: scrollContainerView.topAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 128)
        
        eventRewardsTableContainer.anchor(top: rewardsContainer.bottomAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        if #available(iOS 11.0, *) {
            promoteButton.anchor(top: nil, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 50)
        } else {
            // Fallback on earlier versions
            promoteButton.anchor(top: nil, left: view.leftAnchor, bottom: bottomLayoutGuide.topAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 50)
        }
        
        promoteHelperView.anchor(top: promoteButton.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: -5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        
        setupEventRewardsTableContainerAnchor()
    }
    
    func setupEventRewardsTableContainerAnchor() {
        let height = eventRewardsTableContainer.getContainerHeight()
        
        eventRewardsTableContainerHeightAnchor = eventRewardsTableContainer.heightAnchor.constraint(equalToConstant: height)
        eventRewardsTableContainerHeightAnchor?.isActive = true
    }
    
    func shouldShowTriangles() -> Bool {
        return true
    }
    
    func progressBarBackgroundWidth() -> CGFloat {
        return view.frame.width - 32
    }
    
    func shouldProgressBarAnimate() -> Bool {
        return true
    }
    
    @objc func handlePromote() {
        let promoteController = EventPromoteController()
        self.show(promoteController, sender: self)
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
