//
//  ScrollController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 09.10.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class ScrollController: UIViewController, UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func setupController() {
        navigationController?.navigationBar.isTranslucent = false
        
        setupViews()
//        setupScrollView(height: 2500)
        
        view.backgroundColor = ColorCodes.controllerBackground
    }
    
    func setupScrollView(height: CGFloat) {
        
        self.scrollView = UIScrollView()
        self.scrollView.delegate = self
        self.scrollView.contentSize = CGSize(width: view.frame.width, height: height)
        scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 65, 0)
        
//        scrollView.anchor(top: topLayoutGuide.topAnchor, left: view.leftAnchor, bottom: bottomLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        scrollView.frame = view.bounds
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollContainerView)
        
        scrollContainerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: scrollView.contentSize.height)
    }
    
    let scrollContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
//    func setupMenuBar() {
//        let menuButton = UIBarButtonItem(image: #imageLiteral(resourceName: "menu_icon_3-CHANGE").withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleMenu))
//        menuButton.tintColor = UIColor.white
//        navigationItem.leftBarButtonItem = menuButton
//        
//    }
    
//    lazy var menu: Menu = {
//        let menu = Menu()
//        menu.startController = self
//        return menu
//    }()
//
//    @objc func handleMenu() {
//        menu.showMenu()
//
//    }
    
    func setupViews() {
        
    }
    
}
