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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
    
    fileprivate func setupNavBarButtons() {
        let closeButton = UIBarButtonItem(image: #imageLiteral(resourceName: "close.png"), style: .plain, target: self, action: #selector(handleClose))
        let filterButton = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(handleSearch))
        
        navigationItem.leftBarButtonItem = closeButton
        navigationItem.rightBarButtonItem = filterButton
    }
    
    func handleClose() {
        dismiss(animated: true, completion: nil)
    }
    
    func handleSearch() {
        
        dismiss(animated: true) { 
            self.eventController?.collectionView?.reloadData()
        }
    }
}
