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
            guard let event = event else { return }
            
            eventRewardsTableContainer.event = event
            
            setupViews()
        }
    }
    
    var eventRewardsTableContainerHeightAnchor: NSLayoutConstraint?
    var testViewHeightAnchor: NSLayoutConstraint?
    var testViewBottomAnchor: NSLayoutConstraint?
    
    var eventRewardsTableContainerHeight: CGFloat? {
        didSet {
            self.updateEventRewardsContainer()
        }
    }
    
    func updateEventRewardsContainer() {
        guard let height = eventRewardsTableContainerHeight else { return }
        
        testViewHeightAnchor?.constant = height / 10
        testViewBottomAnchor?.constant = height / 10
        
        print(height / 10)
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.view.layoutIfNeeded()
        }, completion: nil)
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
    
    lazy var testView: UIView = {
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
        
    }
    
    override func setupViews() {
        super.setupViews()
        
        scrollContainerView.addSubview(rewardsContainer)
        scrollContainerView.addSubview(eventRewardsTableContainer)
        
        view.addSubview(promoteButton)
        view.addSubview(promoteHelperView)
        view.addSubview(testView)
        
        
        rewardsContainer.anchor(top: scrollContainerView.topAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 128)
        
        let tableContainerHeight = eventRewardsTableContainer.getContainerHeight()
        
        self.eventRewardsTableContainerHeight = tableContainerHeight
        
        eventRewardsTableContainer.anchor(top: rewardsContainer.bottomAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        eventRewardsTableContainerHeightAnchor = eventRewardsTableContainer.heightAnchor.constraint(equalToConstant: tableContainerHeight)
        eventRewardsTableContainerHeightAnchor?.isActive = true
        
        
        if #available(iOS 11.0, *) {
            promoteButton.anchor(top: nil, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 50)
        } else {
            // Fallback on earlier versions
            promoteButton.anchor(top: nil, left: view.leftAnchor, bottom: bottomLayoutGuide.topAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 50)
        }
        
        promoteHelperView.anchor(top: promoteButton.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: -5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        testView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 40)
        
        
        
//        testViewHeightAnchor = testView.heightAnchor.constraint(equalToConstant: tableContainerHeight / 10)
//        testViewHeightAnchor?.isActive = true
        
        testViewBottomAnchor = testView.bottomAnchor.constraint(equalTo: promoteButton.topAnchor, constant: -(tableContainerHeight / 10))
        testViewBottomAnchor?.isActive = true
        
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
        let sellTicketsController = SellTicketsController()
        sellTicketsController.event = self.event
        self.show(sellTicketsController, sender: self)
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
    
    @objc func reduceTicketPoints() {
        let minusInt = 150
        let currentInt = rewardsContainer.ticketPoints
        
        rewardsContainer.soldTicketsLabel.count(fromValue: Float(currentInt), to: Float(currentInt - minusInt), withDuration: 3.0, animationType: .EaseOut, counterType: .TicketPoints)
    }
    
}








