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
    let headerId = "headerId"
    
    var refresher: UIRefreshControl!
    
    var alreadyAnimatedArray = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround(views: [view])
        
        
        navigationController?.navigationBar.isTranslucent = false
        
        setupViews()
        setupWhiteTitle(title: "Events")
        setupMenuBar()
        setupNavBarButton()
        
        setupShadowToNavigationBar()
        
        setupCollectionView()
        
        events = eventResource.getEvents()
        
        view.backgroundColor = ColorCodes.controllerBackground
    }
    
    fileprivate func setupNavBarButton() {
        let searchButton = UIBarButtonItem(image: #imageLiteral(resourceName: "search_icon"), style: .plain, target: self, action: #selector(handleSearch))
        searchButton.tintColor = ColorCodes.ticketrunnerPurple
        
        let bellButton = UIBarButtonItem(image: #imageLiteral(resourceName: "bell_icon").withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleBellForThisController))
        bellButton.tintColor = UIColor.black
        
        navigationItem.rightBarButtonItems = [bellButton, searchButton]
    }
    
    @objc func handleBellForThisController() {
        print("bell")
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
        menuButton.tintColor = ColorCodes.ticketrunnerPurple
        navigationItem.leftBarButtonItem = menuButton
        
    }
    
    func setupCollectionView() {
        collectionView?.backgroundColor = ColorCodes.controllerBackground
        collectionView?.register(EventsShowCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(ActiveEventsHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
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
    
    lazy var viewFrameWidth = view.frame.width
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! EventsShowCell
        
//        checkIfAnimated(cell: cell, int: indexPath.item)
//
//        var event: Event?
//
//        if filteredEvents != nil {
//            event = filteredEvents?[indexPath.item]
//        } else {
//            event = events[indexPath.item]
//        }
//
//        guard let currentEvent = event else { return cell }
//
//        cell.event = currentEvent
        
        
        cell.events = self.events
        cell.delegate = self
        
        cell.cellWidth = self.viewFrameWidth
        
        return cell
    }
    
    func checkIfAnimated(cell: HomeEventContainerCell, int: Int) {
        if !alreadyAnimatedArray.contains(int) {
            alreadyAnimatedArray.append(int)
            cell.shouldAnimateProgressBar = true
        } else {
            cell.shouldAnimateProgressBar = false
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let height = CGFloat(497) + ((view.frame.width - 16) / 2.7)
        
        let height: CGFloat = 552
        let width = view.frame.width 
        
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
//        if filteredEvents != nil {
//            guard let returnCount = filteredEvents?.count else { return 0 }
//            return returnCount
//        } else {
//            return events.count
//        }
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! ActiveEventsHeader
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
    func didTapPromote(event: Event) {
        
        let sellController = SellTicketsController()
        sellController.event = event
        self.show(sellController, sender: self)
    }
    
    func didTapRewards(event: Event) {
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









