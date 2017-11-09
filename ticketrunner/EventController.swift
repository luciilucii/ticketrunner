//
//  EventController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 28.05.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class EventController: UICollectionViewController, UICollectionViewDelegateFlowLayout, EventCellDelegate {
    
    var events = EventResource().getEvents()
    var filteredEvents: [Event]?
    
    let eventResource = EventResource()
    
    let cellId = "cellId"
    
    var refresher: UIRefreshControl!
    
    var alreadyAnimatedArray = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        
        setupViews()
        setupWhiteTitle(title: "Events")
        setupMenuBar()
        setupNavBarButton()
        
        setupCollectionView()
        
        events = eventResource.getEvents()
        
        view.backgroundColor = ColorCodes.controllerBackground
    }
    
    fileprivate func setupNavBarButton() {
        let searchButton = UIBarButtonItem(image: #imageLiteral(resourceName: "search_icon"), style: .plain, target: self, action: #selector(handleSearch))
        
        navigationItem.rightBarButtonItem = searchButton
    }
    
    @objc func handleSearch() {
        let filterSearchController = FilterSearchController()
        filterSearchController.events = events
        filterSearchController.eventController = self
        let navController = UINavigationController(rootViewController: filterSearchController)
        present(navController, animated: true, completion: nil)
    }
    
    func setupMenuBar() {
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu_icon_3")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleMenu))
        menuButton.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = menuButton
        
    }
    
    func setupCollectionView() {
        collectionView?.backgroundColor = ColorCodes.controllerBackground
        collectionView?.register(EventCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        collectionView?.contentInset = UIEdgeInsetsMake(8, 0, 8, 0)
        
        refresher = UIRefreshControl()
        self.collectionView!.alwaysBounceVertical = true
        collectionView?.addSubview(refresher)
        refresher.addTarget(self, action: #selector(loadData), for: .valueChanged)
        self.collectionView!.addSubview(refresher)
        
    }
    
    @objc func loadData() {
        collectionView?.reloadData()
        stopRefresher()
    }
    
    func stopRefresher() {
        self.refresher.endRefreshing()
    }

    var menu: Menu!
    
    @objc func handleMenu() {
        menu.showMenu()
    }
    
    func setupViews() {
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! EventCell
        
        checkIfAnimated(cell: cell, int: indexPath.item)
        
        var event: Event?
        
        if filteredEvents != nil {
            event = filteredEvents?[indexPath.item]
        } else {
            event = events[indexPath.item]
        }
        
        guard let currentEvent = event else { return cell }
        
        cell.currentEvent = currentEvent
        cell.delegate = self
        
        return cell
    }
    
    func checkIfAnimated(cell: EventCell, int: Int) {
        if !alreadyAnimatedArray.contains(int) {
            alreadyAnimatedArray.append(int)
            cell.shouldAnimateProgressBar = true
        } else {
            cell.shouldAnimateProgressBar = false
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = CGFloat(497) + ((view.frame.width - 16) / 2.7)
        let width = view.frame.width - 16
        
        let size = CGSize(width: width, height: height)
        
        return size
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var event: Event?
        
        if filteredEvents != nil {
            event = filteredEvents?[indexPath.item]
        } else {
            event = events[indexPath.item]
        }
        
        let controller = EventInfoController()
        controller.event = event
        
        show(controller, sender: self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if filteredEvents != nil {
            guard let returnCount = filteredEvents?.count else { return 0 }
            return returnCount
        } else {
            return events.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func didTapPromote(event: Event) {
        let promoteController = EventPromoteController()
        promoteController.event = event
        
        let sellController = SellTicketsController()
        sellController.event = event
        self.show(sellController, sender: self)
    }
    
    func didTapRewards(event: Event) {
        let eventRewardsController = EventRewardsController()
        eventRewardsController.event = event
        
        let newController = EventRewardsTableController(style: .grouped)
        newController.event = event
        
        self.show(newController, sender: self)
    }
    
    func didTapEventInfo(event: Event) {
        let eventInfoController = EventInfoController()
        eventInfoController.event = event
        self.show(eventInfoController, sender: self)
    }
    
    func didTapLeaderboards(event: Event) {
        let layout = UICollectionViewFlowLayout()
        let controller = LeaderboardController(collectionViewLayout: layout)
        self.show(controller, sender: self)
    }
    
}
