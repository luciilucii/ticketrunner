//
//  EventPromoteController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 09.10.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class EventPromoteController: ScrollController {
    
    var event: Event? {
        didSet {
            
        }
    }
    
    lazy var promoteShareLinkView: PromoteShareLinkView = {
        let view = PromoteShareLinkView()
        view.promoteController = self
        return view
    }()
    
    lazy var landingPagePreviewContainer: LandingPagePreviewContainer = {
        let view = LandingPagePreviewContainer()
        return view
    }()
    
    let linkCopiedLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = ColorCodes.ticketrunnerGreen
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Link copied!"
        label.layer.cornerRadius = 35/2
        label.clipsToBounds = true
        label.font = UIFont.boldSourceSansPro(ofSize: 16)
        return label
    }()
    
    var linkCopiedLabelBottomAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.setupScrollView(height: 807)
        
        super.setupController()
        
        setupNavBarButtons()
        
        setupWhiteTitle(title: "Promote Event")
        
        hideKeyboardWhenTappedAround(views: [view, scrollContainerView, landingPagePreviewContainer, promoteShareLinkView])
        
        setupViews()
        setupKeyboardObservers()
    }
    
    override func setupViews() {
        super.setupViews()
        
        
        scrollContainerView.addSubview(promoteShareLinkView)
        scrollContainerView.addSubview(landingPagePreviewContainer)
        
        promoteShareLinkView.anchor(top: scrollContainerView.topAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 258)
        
        landingPagePreviewContainer.anchor(top: promoteShareLinkView.bottomAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 460)
        
        view.addSubview(linkCopiedLabel)
        
        linkCopiedLabel.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 35)
        
        
        
        
        linkCopiedLabelBottomAnchor = linkCopiedLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 35)
        linkCopiedLabelBottomAnchor?.isActive = true
    }
    
    func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func handleKeyboardWillShow(notification: NSNotification) {
        let keyboardDuration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue
        
        guard let duration = keyboardDuration else { return }
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            self.scrollView.contentOffset.y = self.landingPagePreviewContainer.customMessageTextView.frame.minY + 228
            
        }, completion: nil)
    }
    
    @objc func handleKeyboardWillHide(notification: NSNotification) {
        let keyboardDuration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue
        
        guard let duration = keyboardDuration else {
            return
        }
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            self.scrollView.contentOffset.y = self.scrollView.contentSize.height - self.view.frame.height - 65
            
        }, completion: nil)
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
    
    func handleCopy() {
        timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(handleShowLinkCopied), userInfo: nil, repeats: false)
        dismissTimer = Timer.scheduledTimer(timeInterval: 1.8, target: self, selector: #selector(handleDismissLinkCopied), userInfo: nil, repeats: false)
    }
    
    var timer: Timer?
    var dismissTimer: Timer?
    
    @objc func handleShowLinkCopied() {
        
        linkCopiedLabelBottomAnchor?.constant = -8
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
    }
    
    @objc func handleDismissLinkCopied() {
        linkCopiedLabelBottomAnchor?.constant = 35
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            self.view.layoutIfNeeded()
            
        }, completion: nil)
    }
    
}












