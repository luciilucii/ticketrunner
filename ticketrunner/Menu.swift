//
//  Menu.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 27.05.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit
import Intercom

class MenuPoint: NSObject {
    let name: MenuName
    let imageName: String
    
    init(name: MenuName, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}

enum MenuName: String {
    case Home = "Home"
    case Rewards = "My Rewards"
    case Events = "Events"
    case Messages = "Messages"
    case Settings = "Settings"
    case Language = "Language"
    case Logout = "Logout"
    
}

class Menu: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let blackView = UIView()
    
    var currentUser: User?
    
    var startController: UIViewController?
    var endController: UIViewController?
    
    var homeController: HomeTableController?
    
    let menuView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.zPosition = 10
        return view
    }()
    
    let menuPoints: [MenuPoint] = {
        
        let homeMenuPoint = MenuPoint(name: .Home, imageName: "")
        let rewardsMenuPoint = MenuPoint(name: .Rewards, imageName: "")
        let eventMenuPoint = MenuPoint(name: .Events, imageName: "")
        let messagesMenuPoint = MenuPoint(name: .Messages, imageName: "")
        let settingsMenuPoint = MenuPoint(name: .Settings, imageName: "")
        let languageMenuPoint = MenuPoint(name: .Language, imageName: "british-flag")
        let logoutMenuPoint = MenuPoint(name: .Logout, imageName: "")
        
        
        return [homeMenuPoint, eventMenuPoint, rewardsMenuPoint, messagesMenuPoint, settingsMenuPoint, languageMenuPoint, logoutMenuPoint]
    }()
    
    
    func showMenu() {
        if let window = UIApplication.shared.keyWindow {
            //TODO: Alpha anpassen
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            blackView.layer.zPosition = 6
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            window.addSubview(menuView)
            
            setupMenu()
            
            //x,y,w,h
            let menuWidth = window.frame.width / 1.33
            menuView.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: window.frame.height)
            
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.blackView.alpha = 1
                self.menuView.frame = CGRect(x: 0, y: 0, width: menuWidth, height: window.frame.height)
                
                window.windowLevel = UIWindowLevelStatusBar
                
            }, completion: nil)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuPoints.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        
        let menuPoint = menuPoints[indexPath.item]
        cell.menuPoint = menuPoint
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //TODO: Initialize the right width
        
        return CGSize(width: menuView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let menuPoint = menuPoints[indexPath.item]
        
        if menuPoint.name == MenuName.Home {
            setupHomeController()
        }
        
        if menuPoint.name == MenuName.Rewards {
            let tableController = RewardsTableController(style: .grouped)
            tableController.menu = self
            let navController = UINavigationController(rootViewController: tableController)
            
            self.showMenuController(controller: navController)
            tableController.menu.startController = tableController
        }
        
        if menuPoint.name == MenuName.Events {
            let layout = UICollectionViewFlowLayout()
            let controller = EventController(collectionViewLayout: layout)
            controller.menu = self
            let eventController = UINavigationController(rootViewController: controller)

            self.showMenuController(controller: eventController)
            controller.menu.startController = controller
        }
        
        if menuPoint.name == MenuName.Messages {
            let controller = MessagesController()
            let messagesController = UINavigationController(rootViewController: controller)
            controller.menu = self
            self.showMenuController(controller: messagesController)
            controller.menu.startController = controller
        }
        
        if menuPoint.name == MenuName.Settings {
            let layout = UICollectionViewFlowLayout()
            let controller = SettingsController(collectionViewLayout: layout)
            let settingsController = UINavigationController(rootViewController: controller)
            controller.menu = self
            self.showMenuController(controller: settingsController)
            controller.menu.startController = controller
        }
        
        if menuPoint.name == MenuName.Language {
            let layout = UICollectionViewFlowLayout()
            let controller = LanguageController(collectionViewLayout: layout)
            let languageController = UINavigationController(rootViewController: controller)
            controller.menu = self
            self.showMenuController(controller: languageController)
            controller.menu.startController = controller
        }
        
        if menuPoint.name == MenuName.Logout {
            handleDismiss()
            self.handleLogout()
            return
        }
        
        handleDismiss()
        
    }
    
    func showMenuController(controller: UIViewController) {
        startController?.present(controller, animated: false, completion: nil)
    }
    
    func handleLogout() {
        
        UserDefaults.standard.removeObject(forKey: "sessionKey")
        
        setupHomeController()
        
        let layout = UICollectionViewFlowLayout()
        let loginStartController = StartController(collectionViewLayout: layout)
        loginStartController.homeController = homeController
        startController?.present(loginStartController, animated: true, completion: nil)
    }
    
    func setupHomeController() {
//        let layout = UICollectionViewFlowLayout()
//        let controller = HomeController(collectionViewLayout: layout)
//        let homeController = UINavigationController(rootViewController: controller)
        
        let controller = HomeTableController(style: .plain)
        let homeController = UINavigationController(rootViewController: controller)
        
        controller.menu = self
        controller.currentUser = currentUser
        self.showMenuController(controller: homeController)
        controller.menu?.startController = controller
    }
    
    func handleNewViewController(menuPoint: MenuPoint) {
        
        guard let controller = self.endController else {
            return
        }
        self.startController?.present(controller, animated: false, completion: nil)
        handleDismiss()
        
    }
    
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { 
            
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
            
                let menuWidth = window.frame.width / 1.5
                self.menuView.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: window.frame.height)
                window.windowLevel = UIWindowLevelNormal
            }
            
        }, completion: nil)
    }
    
    //MenuContent
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .green
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "profile_avatar")
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 50
        return iv
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.alwaysBounceVertical = true
        return cv
    }()
    
    let cellId = "cellId"
    
    func setupMenu() {
        
        menuView.addSubview(profileImageView)
        menuView.addSubview(collectionView)
        
        //x,y,w,h
        profileImageView.centerXAnchor.constraint(equalTo: menuView.centerXAnchor).isActive = true
        profileImageView.topAnchor.constraint(equalTo: menuView.topAnchor, constant: 35).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        //x,y,w,h
        collectionView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16).isActive = true
        collectionView.leftAnchor.constraint(equalTo: menuView.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: menuView.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: menuView.bottomAnchor).isActive = true
        
    }
    
    func showEventController() {
        let indexPath = IndexPath(item: 1, section: 0)
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredVertically)
        self.collectionView(collectionView, didSelectItemAt: indexPath)
    }
    
    func showMessagesController() {
        let indexPath = IndexPath(item: 3, section: 0)
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredVertically)
        self.collectionView(collectionView, didSelectItemAt: indexPath)
    }
    
    override init() {
        super.init()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.allowsMultipleSelection = false
        collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
    }
}
