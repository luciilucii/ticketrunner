//
//  HomeController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 26.05.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit
import MobileCoreServices
import Intercom

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var titleLabel: UILabel!
    let userResource = UserResource()
    var currentUser: User? {
        didSet {
            guard let user = currentUser else {
                return
            }
            
            guard let userName = user.firstname else {
                return
            }
            
        }
    }
    
    var menu: Menu?
    var userImage: UIImage? {
        didSet{
            collectionView?.reloadData()
        }
    }
    
    var userEvents = [Event]()
    
    private let cellId = "cellId"
    private let headerId = "headerId"
    private let noEventId = "noEventId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkIfMenuIsSet()
        checkIfUserIsLoggedIn()
        
//        userEvents = EventResource().getEvents()
        
        navigationController?.navigationBar.isTranslucent = false
        
        view.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0)
        setupTitleLabel()
        setupMenuBar()
        setupCollectionView()
        
    }
    
    func setupCollectionView() {
        collectionView?.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0)
        collectionView?.register(EventCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(HomeHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        
        collectionView?.register(HomeNoEventCell.self, forCellWithReuseIdentifier: noEventId)
        
        collectionView?.contentInset = UIEdgeInsetsMake(0, 0, 8, 0)
        
    }
    
    func checkIfMenuIsSet() {
        if menu == nil {
            menu = Menu()
            menu?.startController = self
        }
    }
    
    func checkIfUserIsLoggedIn() {
        
        if currentUser == nil {
            menu?.handleLogout()
        }
        
    }
    
    func setupMenuBar() {
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu_icon_3")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleMenu))
        menuButton.tintColor = UIColor.white
        
        navigationItem.leftBarButtonItem = menuButton
        
    }
    
    func setupTitleLabel() {
        let titleView = UIView()
        titleView.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        
        titleLabel = UILabel()
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.text = "Home"
        titleView.addSubview(titleLabel)
        
        //x,y,w,h
        titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        
        self.navigationItem.titleView = titleView
    }
    
    func checkIfUserHasPromotedEvents() {
        if userEvents.count == 0 {
            
        } else {
            
        }
    }
    
    func handleMenu() {
        menu?.showMenu()
        menu?.homeController = self
        
    }
    
    func handleSelectProfileImage() {
        
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.navigationBar.barTintColor = UIColor.white
        
        picker.navigationBar.tintColor = UIColor.black
        
        picker.allowsEditing = true
        
        present(picker, animated: true) { 
            UIApplication.shared.statusBarStyle = .default
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImageFromPicker = editedImage
        }
        if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            
            self.userImage = selectedImage
        }

        dismiss(animated: true) {
            UIApplication.shared.statusBarStyle = .lightContent
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("picker canceled")
        
        dismiss(animated: true) { 
            UIApplication.shared.statusBarStyle = .lightContent
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if userEvents.count == 0 {
            
            let height = CGFloat(488)
            let width = view.frame.width - 16
            
            let size = CGSize(width: width, height: height)
            
            return size
            
        } else {
            let height = CGFloat(494)
            let width = view.frame.width - 16
            
            let size = CGSize(width: width, height: height)
            
            return size
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if userEvents.count == 0 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: noEventId, for: indexPath) as! HomeNoEventCell
            
            cell.homeController = self
            
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! EventCell
            
            cell.backgroundColor = UIColor.white
            
            let event = userEvents[indexPath.item]
            
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
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 210)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! HomeHeader
        header.homeController = self
        
        if let userImage = userImage {
            header.avatarImageView.image = userImage
        }
        
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if userEvents.count == 0 {
            return 1
        } else {
            return userEvents.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let event = userEvents[indexPath.item]
        let controller = setupDetailController(event: event)
        
        show(controller, sender: self)
    }
    
    func handlePromote(sender: UIButton) {
        let event = userEvents[sender.tag]
        handlePromoteFor(event: event)
    }
    
    
    func handleRewards(sender: UIButton) {
        let event = userEvents[sender.tag]
        handleRewardsFor(event: event)
    }
    
    func handleShowEventInfo(sender: UIButton) {
        
        let event = userEvents[sender.tag]
        handleShowEventInfoFor(event: event)
    }
    
}










