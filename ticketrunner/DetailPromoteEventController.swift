//
//  DetailPromoteEventController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 31.05.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit
import Social

class DetailPromoteEventController: UIViewController, UIScrollViewDelegate, UITextViewDelegate {
    
    var titleLabel: UILabel!
    
    var facebookPostDescriptionHeight: CGFloat?
    
    let titleString = "Promote Event"
    
    var scrollView: UIScrollView!
    
    var currentEvent: Event?
    
    var isCustomLandingPageMessageIsEditing: Bool? {
        didSet {
            guard let isEditing = isCustomLandingPageMessageIsEditing else {
                return
            }
            
            if isEditing == false {
                let yValue = landingPagePreviewContainer.frame.maxY - view.frame.height
                
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { 
                    
                    self.scrollView.contentOffset.y = yValue
                    
                }, completion: nil)
                
                
            } else {
                
                let yValue = scrollView.contentSize.height - landingPagePreviewContainerView.updateLandingPageButton.frame.height - landingPagePreviewContainerView.previewLandingPageButton.frame.height - landingPagePreviewContainerView.customMessageTextView.frame.height - 24 - 75
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { 
                    
                    self.scrollView.contentOffset.y = yValue
                    
                }, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        
        navigationController?.navigationBar.isTranslucent = false
        view.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0)
        
        hideKeyboardWhenTappedAround(views: [view])
        
        setupNavigationBar()
        setupTitleLabel()
        setupViews()
        
        facebookPreviewContainerView.facebookPostDescriptionLabel.text = facebookShareTextView.text
        
    }
    
    func setupNavigationBar() {
        let dismissButton = UIBarButtonItem(image: UIImage(named: "cancel"), style: .plain, target: self, action: #selector(handleDismiss))
        let shareButton = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(handleShare))
        
        navigationItem.leftBarButtonItem = dismissButton
        navigationItem.rightBarButtonItem = shareButton
    }
    
    func setupTitleLabel() {
        let titleView = UIView()
        titleView.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        
        titleLabel = UILabel()
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.text = "\(titleString)"
        titleView.addSubview(titleLabel)
        
        //x,y,w,h
        titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        
        self.navigationItem.titleView = titleView
    }
    
    func setupPaddingForTextfields(textFields: [UITextField]) {
        for textField in textFields {
            textField.setLeftPaddingPoints(5)
            textField.setRightPaddingPoints(5)
        }
    }
    
    let scrollContainerView: UIView = {
        let view = UIView()
        return view
    }()

    let eventImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "event")
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let eventTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello Kitty Event mit langem Titel"
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0)
        return label
    }()
    
    let titleSeperatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0)
        return view
    }()
    
    //MARK: Link
    
    let linkContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let linkTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Your Link"
        label.textColor = UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let linkTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Every ticket that is sold through this Link will be accredited to you. The same goues for every person that visited the ticket shop on your link and buys the ticket elsewhere within 30 days."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        label.numberOfLines = 5
        return label
    }()
    
    let linkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.backgroundColor = UIColor.white
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor
        label.text = "https://www.ticketrunner.com/events/seepark-6-mallorca-schlag"
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return label
    }()
    
    let copyLinkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Copy Link", for: .normal)
        button.addTarget(self, action: #selector(handleCopy), for: .touchUpInside)
        button.backgroundColor = UIColor(red:0.00, green:0.75, blue:0.95, alpha:1.0)
        button.tintColor = UIColor.white
        return button
    }()
    
    let linkSeperatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0)
        return view
    }()
    
    let linkCopiedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor(red:0.25, green:0.89, blue:0.56, alpha:1.0)
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.text = "Link copied!"
        return label
    }()
    
    //MARK: Direct Share
    
    let directShareContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let directShareTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Direct Share"
        label.textColor = UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let directShareDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Share your Link directly to Facebook. The cooler the text, the more tickets you sell."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        label.numberOfLines = 5
        return label
    }()
    
    let facebookLogoImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "facebook_blue")
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        return iv
    }()
    
    lazy var facebookShareTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.backgroundColor = UIColor.white
        textView.delegate = self
        textView.layer.borderColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0).cgColor
        textView.text = "Wow, schau dir dieses coole Event an!"
        textView.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return textView
    }()
    
    let shareFacebookButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Share", for: .normal)
        button.addTarget(self, action: #selector(handleShareFacebook), for: .touchUpInside)
        button.backgroundColor = UIColor(red:0.25, green:0.89, blue:0.56, alpha:1.0)
        button.tintColor = UIColor.white
        return button
    }()
    
    let shareSeperatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0)
        return view
    }()
    
    //Facebook Preview Container
    
    let facebookPreviewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let facebookPreviewContainerView: FacebookPreviewContainer = {
        let containerView = FacebookPreviewContainer()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    let facebookPreviewSeperatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0)
        return view
    }()
    
    //Landing Page Preview Container
    
    let landingPagePreviewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var landingPagePreviewContainerView: LandingPagePreviewContainer = {
        let containerView = LandingPagePreviewContainer()
        containerView.detailController = self
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    func setupScrollView(/*height: CGFloat*/) {
        
        //TODO: make there a parameter int the function and call it when detaileventcontroller is genereated
        
        self.scrollView = UIScrollView()
        self.scrollView.delegate = self
        self.scrollView.contentSize = CGSize(width: view.frame.width, height: 1850)
        scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 65, 0)
        
        scrollView.frame = view.bounds
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollContainerView)
        
        scrollContainerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: scrollView.contentSize.height)
    }

    var linkCopiedLabelBottomAnchor: NSLayoutConstraint?
    
       
    func handleShare() {
        let eventLink = "https://www.ticketrunner.com/events/seepark-6-mallorca-schlag"
        let eventShareText = "Hallo, schaue dir dieses super coole Event an: "
        
        let activityVC = UIActivityViewController(activityItems: ["\(eventShareText)\(eventLink)"], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
        
    }
    
    func handleCopy() {
        UIPasteboard.general.string = linkLabel.text
        
        timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(handleShowLinkCopied), userInfo: nil, repeats: false)
        dismissTimer = Timer.scheduledTimer(timeInterval: 1.8, target: self, selector: #selector(handleDismissLinkCopied), userInfo: nil, repeats: false)
        
    }
    
    var timer: Timer?
    var dismissTimer: Timer?
    
    func handleShowLinkCopied() {
        
        linkCopiedLabelBottomAnchor?.constant = 0
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
    }
    
    func handleDismissLinkCopied() {
        linkCopiedLabelBottomAnchor?.constant = 35
    
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
    
            self.view.layoutIfNeeded()
    
        }, completion: nil)
    }
    
    func handleShareFacebook() {
        
        let facebookVC = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        facebookVC?.add(UIImage(named: "event"))
        
        guard let urlString = linkLabel.text else {
            print("textfield nicht gefüllt")
            return
        }
        facebookVC?.add(URL(string: urlString))
        
        guard let initialText = facebookShareTextView.text else {
            return
        }
        facebookVC?.setInitialText(initialText)

        self.present(facebookVC!, animated: true, completion: nil)
    }
    
    func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if textView == facebookShareTextView {
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.scrollView.contentOffset.y = 440
                
            }, completion: nil)
            
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if textView == facebookShareTextView {
            
            facebookPreviewContainerView.facebookPostDescriptionLabel.text = facebookShareTextView.text
            
        }
        
    }
    
}
