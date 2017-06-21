//
//  SettingsController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 29.05.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit
import Intercom

class SettingsPoint: NSObject {
    let name: SettingName
    let imageName: String
    
    init(name: SettingName, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}

enum SettingName: String {
    case Personal = "Personal Settings"
    case Subscription = "Event Subscriptions"
    case Password = "Change Password"
    case Accounts = "Connected Accounts"
    case Deactivate = "Deactivate Account"
}

class SettingsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var titleLabel: UILabel!
    let titleString = "Settings"
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        
        setupTitleLabel()
        setupMenuBar()
        
        setupCollectionView()
        
        Intercom.setLauncherVisible(true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        Intercom.setLauncherVisible(false)
    }
    
    let settingPoints: [SettingsPoint] = {
        
        let personalSettingPoint = SettingsPoint(name: .Personal, imageName: "personal_setting")
        let paymentSettingPoint = SettingsPoint(name: .Subscription, imageName: "payment_setting")
        let passwordSettingPoint = SettingsPoint(name: .Password, imageName: "password_setting")
        let accountsSettingPoint = SettingsPoint(name: .Accounts, imageName: "accounts_setting")
        let deactivateSettingPoint = SettingsPoint(name: .Deactivate, imageName: "deactivate_setting")
        
        return [personalSettingPoint, paymentSettingPoint, passwordSettingPoint, accountsSettingPoint, deactivateSettingPoint]
    }()
    
    func setupMenuBar() {
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu_icon_3")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleMenu))
        menuButton.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = menuButton
        
    }
    
    func setupCollectionView() {
        collectionView?.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0)
        collectionView?.register(SettingCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView?.contentInset = UIEdgeInsetsMake(8, 0, 8, 0)
    }
    
    var menu: Menu!
    
    func handleMenu() {
        menu.showMenu()
        
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
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settingPoints.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width - 8, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SettingCell
        
        let setting = settingPoints[indexPath.item]
        
        cell.backgroundColor = UIColor.white
        cell.settingTitleLabel.text = setting.name.rawValue
        cell.settingImageView.image = UIImage(named: setting.imageName)
        
        cell.layer.cornerRadius = 5
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let setting = settingPoints[indexPath.item]
        
        if setting.name == .Personal {
            let controller = PersonalSettingsController()
            show(controller, sender: self)
        }
        
        if setting.name == .Subscription {
            let controller = EventSubscriptionController()
            show(controller, sender: self)
        }
        
        if setting.name == .Password {
            let controller = ChangePasswordController()
            show(controller, sender: self)
        }
        
        if setting.name == .Accounts {
            let controller = ConnectedAccountsController()
            show(controller, sender: self)
        }
        
        if setting.name == .Deactivate {
            let controller = DeactivateAccountController()
            show(controller, sender: self)
        }
        
    }
    
}








