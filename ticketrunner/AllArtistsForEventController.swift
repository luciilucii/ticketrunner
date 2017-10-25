//
//  AllArtistsForEventController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 03.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class AllArtistsForEventController: UIViewController {
    
    var event: Event?
    
    var artists: [Artist]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = ColorCodes.controllerBackground
        
        setupNavBarButtons()
        setupWhiteTitle(title: "Artists")
        setupViews()
        
    }
    
    
    var lineUpContainerHeight: CGFloat?
    
    func setupViews() {
        
        let lineUpContainer: ArtistLineUpContainer = {
            let container = ArtistLineUpContainer()
            container.artists = artists
            container.showMoreButton.isHidden = true
            return container
        }()
        view.addSubview(lineUpContainer)
        
        view.addContraintsWithFormat(format: "H:|-8-[v0]-8-|", views: lineUpContainer)
        view.addContraintsWithFormat(format: "V:|-8-[v0]-8-|", views: lineUpContainer)
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







