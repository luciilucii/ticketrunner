//
//  FilterSearchController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 30.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class FilterSearchController: UIViewController {
    
    var eventController: EventController?
    
    var titleLabel: UILabel!
    let titleString = "Search & Filter"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        setupTitleLabel()
        setupNavBarButtons()
    }
    
    fileprivate func setupNavBarButtons() {
        let closeButton = UIBarButtonItem(image: #imageLiteral(resourceName: "cancel").withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleClose))
        closeButton.tintColor = UIColor.white
        let filterButton = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(handleSearch))
        
        navigationItem.leftBarButtonItem = closeButton
        navigationItem.rightBarButtonItem = filterButton
    }
    
    func handleClose() {
        dismiss(animated: true, completion: nil)
    }
    
    func handleSearch() {
        
        dismiss(animated: true) {
            
            //TODO: Put the Search mechanism here
            self.eventController?.collectionView?.reloadData()
        }
    }
    
    func setupTitleLabel() {
        let titleView = UIView()
        titleView.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        
        titleLabel = UILabel()
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.text = "\(titleString)"
        titleView.addSubview(titleLabel)
        
        //x,y,w,h
        titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        
        self.navigationItem.titleView = titleView
    }
}
