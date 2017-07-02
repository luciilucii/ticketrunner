//
//  EventController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 28.05.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class EventController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var titleLabel: UILabel!
    var events = EventResource().getEvents()
    
    let eventResource = EventResource()
    
    let cellId = "cellId"
    
    var refresher: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        
        setupViews()
        setupTitleLabel()
        setupMenuBar()
        setupNavBarButton()
        
        setupCollectionView()
        
        events = eventResource.getEvents()
        
        view.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0)
    }
    
    fileprivate func setupNavBarButton() {
        let searchButton = UIBarButtonItem(image: #imageLiteral(resourceName: "search_icon"), style: .plain, target: self, action: #selector(handleSearch))
        
        navigationItem.rightBarButtonItem = searchButton
    }
    
    func handleSearch() {
        
        let filterSearchController = FilterSearchController()
        let navController = UINavigationController(rootViewController: filterSearchController)
        present(navController, animated: true, completion: nil)
    }
    
    func setupMenuBar() {
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu_icon_3")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleMenu))
        menuButton.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = menuButton
        
    }
    
    func setupCollectionView() {
        collectionView?.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0)
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
    
    func loadData() {
        collectionView?.reloadData()
        stopRefresher()
    }
    
    func stopRefresher() {
        self.refresher.endRefreshing()
    }

    var menu: Menu!
    
    func handleMenu() {
        menu.showMenu()
    }
    
    func setupViews() {
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! EventCell
        
        cell.backgroundColor = UIColor.white
        
        
        
        let event = events[indexPath.item]
        
        cell.currentEvent = event
        
        cell.progressBar.progressBackgroundBarWidthAnchor = view.frame.width - 48
        
        cell.promoteButton.tag = indexPath.item
        cell.promoteButton.addTarget(self, action: #selector(handlePromote), for: .touchUpInside)
        
        cell.rewardsButton.tag = indexPath.item
        cell.rewardsButton.addTarget(self, action: #selector(handleRewards), for: .touchUpInside)
        
        cell.eventInfoButton.tag = indexPath.item
        cell.eventInfoButton.addTarget(self, action: #selector(handleShowEventInfo), for: .touchUpInside)
        
        cell.titleLabel.text = event.name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = CGFloat(501)
        let width = view.frame.width - 16
        
        let size = CGSize(width: width, height: height)
        
        return size
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let event = events[indexPath.item]
        let controller = setupDetailController(event: event)
        
        show(controller, sender: self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
    
    func handlePromote(sender: UIButton) {
        let event = events[sender.tag]
        handlePromoteFor(event: event)
    }
    
    func handleRewards(sender: UIButton) {
        let event = events[sender.tag]
        handleRewardsFor(event: event)
    }
    
    func handleShowEventInfo(sender: UIButton) {
        let event = events[sender.tag]
        handleShowEventInfoFor(event: event)
    }
    
    func setupTitleLabel() {
        let titleView = UIView()
        titleView.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        
        titleLabel = UILabel()
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.text = "Events"
        titleView.addSubview(titleLabel)
        
        //x,y,w,h
        titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        
        self.navigationItem.titleView = titleView
    }
    
}
