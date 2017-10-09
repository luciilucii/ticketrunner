//
//  PromoteShareLinkView.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 09.10.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class PromoteShareLinkView: CustomUIView {
    
    var event: Event? {
        didSet {
            
        }
    }
    
    var promoteController: EventPromoteController?
    
    let shareLinkHeadlineLabel: HeadlineLabel = {
        let label = HeadlineLabel(title: "Share Link")
        return label
    }()
    
    let linkTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Every ticket that is sold through this Link will be accredited to you."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = ColorCodes.textColorGrey
        label.numberOfLines = 5
        return label
    }()
    
    let linkTextField: UITextField = {
        let tf = UITextField()
        tf.setLeftPaddingPoints(8)
        tf.setRightPaddingPoints(8)
        tf.isUserInteractionEnabled = false
        tf.text = "https://www.ticketrunner.com/events/seepark-6-mallorca-schlag"
        tf.textColor = ColorCodes.lightGrayText
        tf.layer.borderColor = ColorCodes.lightGrayText.cgColor
        tf.font = UIFont.boldSystemFont(ofSize: 14)
        tf.layer.cornerRadius = 5
        tf.layer.borderWidth = 1
        return tf
    }()
    
    lazy var copyLinkButton: TicketrunnerBlueButton = {
        let button = TicketrunnerBlueButton(title: "Copy Link")
        button.addTarget(self, action: #selector(handleCopy), for: .touchUpInside)
        return button
    }()
    
    lazy var shareButton: TicketrunnerGreenButton = {
        let button = TicketrunnerGreenButton(title: "Share")
        button.addTarget(self, action: #selector(handleShare), for: .touchUpInside)
        return button
    }()
    
    var linkCopiedLabelBottomAnchor: NSLayoutConstraint?
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = UIColor.white
        layer.cornerRadius = 5
        clipsToBounds = true
        
        addSubview(shareLinkHeadlineLabel)
        addSubview(linkTextLabel)
        addSubview(linkTextField)
        addSubview(copyLinkButton)
        addSubview(shareButton)
        
        shareLinkHeadlineLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        linkTextLabel.anchor(top: shareLinkHeadlineLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 40)
        
        linkTextField.anchor(top: linkTextLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 40)
        
        copyLinkButton.anchor(top: linkTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
        shareButton.anchor(top: copyLinkButton.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
        
    }
    
    func handleCopy() {
        UIPasteboard.general.string = linkTextField.text
        
        promoteController?.handleCopy()
        
    }
    
    func handleShare() {
        let eventLink = "https://www.ticketrunner.com/events/seepark-6-mallorca-schlag"
        let eventShareText = "Hello Bastard, buy this ticket!"
        
        let activityVC = UIActivityViewController(activityItems: ["\(eventShareText)\(eventLink)"], applicationActivities: nil)
        activityVC.navigationController?.navigationBar.tintColor = UIColor.white
        
        activityVC.popoverPresentationController?.sourceView = promoteController?.view
        
        promoteController?.present(activityVC, animated: true, completion: nil)
    }
    
}











