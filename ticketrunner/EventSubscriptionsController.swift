//
//  EventSubscriptionsController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 16.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class EventSubscriptionController: UIViewController, UIScrollViewDelegate {
    
    var titleLabel: UILabel!
    let titleString = "Subscriptions"
    
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        
        setupViews()
        setupTitleLabel()
        setupScrollView(height: 2500)
        
        view.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0)
    }
    
    func setupScrollView(height: CGFloat) {
        
        self.scrollView = UIScrollView()
        self.scrollView.delegate = self
        self.scrollView.contentSize = CGSize(width: view.frame.width, height: height)
        scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 65, 0)
        
        scrollView.frame = view.bounds
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollContainerView)
        
        scrollContainerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: scrollView.contentSize.height)
    }
    
    let scrollContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    let selectCategoriesTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SELECT EVENT CATEGORIES FOR INVITATIONS"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return label
    }()
    
    let eventSubscriptionsTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Event Subscriptions"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return label
    }()
    
    let eventSubscriptionDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.lineBreakMode = .byWordWrapping
        label.text = "We want you to stay informed about all events coming up that might interest you and your friends and followers. You can choose your favorite genres and also how far away the event location may be. We'll send you a quick heads up everytime a new event pops up in our backend."
        return label
    }()
    
    let genreContainer: GenreContainer = {
        let container = GenreContainer()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .green
        return container
    }()
    
    let subscribeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Subscribe", for: .normal)
        button.addTarget(self, action: #selector(handleSubscribe), for: .touchUpInside)
        button.backgroundColor = UIColor(red:0.00, green:0.75, blue:0.95, alpha:1.0)
        button.tintColor = UIColor.white
        return button
    }()
    
    func setupViews() {
        
        scrollContainerView.addSubview(selectCategoriesTitleLabel)
        scrollContainerView.addSubview(eventSubscriptionsTitleLabel)
        scrollContainerView.addSubview(eventSubscriptionDescriptionLabel)
        scrollContainerView.addSubview(genreContainer)
        scrollContainerView.addSubview(subscribeButton)
        
        selectCategoriesTitleLabel.topAnchor.constraint(equalTo: scrollContainerView.topAnchor, constant: 25).isActive = true
        selectCategoriesTitleLabel.leftAnchor.constraint(equalTo: scrollContainerView.leftAnchor, constant: 16).isActive = true
        selectCategoriesTitleLabel.rightAnchor.constraint(equalTo: scrollContainerView.rightAnchor, constant: -16).isActive = true
        selectCategoriesTitleLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        eventSubscriptionsTitleLabel.topAnchor.constraint(equalTo: selectCategoriesTitleLabel.bottomAnchor, constant: 0).isActive = true
        eventSubscriptionsTitleLabel.leftAnchor.constraint(equalTo: selectCategoriesTitleLabel.leftAnchor).isActive = true
        eventSubscriptionsTitleLabel.rightAnchor.constraint(equalTo: selectCategoriesTitleLabel.rightAnchor).isActive = true
        eventSubscriptionsTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        eventSubscriptionDescriptionLabel.topAnchor.constraint(equalTo: eventSubscriptionsTitleLabel.bottomAnchor).isActive = true
        eventSubscriptionDescriptionLabel.leftAnchor.constraint(equalTo: eventSubscriptionsTitleLabel.leftAnchor).isActive = true
        eventSubscriptionDescriptionLabel.rightAnchor.constraint(equalTo: eventSubscriptionsTitleLabel.rightAnchor).isActive = true
        eventSubscriptionDescriptionLabel.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        genreContainer.topAnchor.constraint(equalTo: eventSubscriptionDescriptionLabel.bottomAnchor, constant: 16).isActive = true
        genreContainer.leftAnchor.constraint(equalTo: eventSubscriptionDescriptionLabel.leftAnchor).isActive = true
        genreContainer.rightAnchor.constraint(equalTo: eventSubscriptionDescriptionLabel.rightAnchor).isActive = true
        genreContainer.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        subscribeButton.topAnchor.constraint(equalTo: genreContainer.bottomAnchor, constant: 16).isActive = true
        subscribeButton.leftAnchor.constraint(equalTo: genreContainer.leftAnchor).isActive = true
        subscribeButton.rightAnchor.constraint(equalTo: genreContainer.rightAnchor).isActive = true
        subscribeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
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
    
    func handleSubscribe() {
        //TODO: create logic
        print("Subscribe")
    }
    
}
