//
//  FacebookShareView.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 10.11.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

enum FacebookShareType: String {
    case page = "Page"
    case personal = "Personal"
}

class FacebookShareView: CustomUIView, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var event: Event? {
        didSet {
            
        }
    }
    
    var facebookShareTypes = [FacebookShareType.page, FacebookShareType.personal]
    
    var choosenType: FacebookShareType?
    
    lazy var pickerView: UIPickerView = {
        let pv = UIPickerView()
        pv.dataSource = self
        pv.delegate = self
        return pv
    }()
    
    let titleLabel: H2 = {
        let label = H2()
        label.text = "Where do you want to share it?"
        return label
    }()
    
    lazy var typeTextField: TicketrunnerTextField = {
        let tf = TicketrunnerTextField()
        tf.inputView = self.pickerView
        return tf
    }()
    
    lazy var pageTextField: TicketrunnerTextField = {
        let tf = TicketrunnerTextField()
        return tf
    }()
    
    let postLabel: H2 = {
        let label = H2()
        label.text = "Post"
        label.textAlignment = .left
        return label
    }()
    
    let postTextView: TicketrunnerTextView = {
        let tv = TicketrunnerTextView()
        return tv
    }()
    
    lazy var shareButton: TicketrunnerGreenButton = {
        let button = TicketrunnerGreenButton(title: "Share on Facebook")
        button.addTarget(self, action: #selector(handleShare), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = UIColor.white
        layer.cornerRadius = 5
        clipsToBounds = true
        
        setupSubviews()
    }
    
    fileprivate func setupSubviews() {
        addSubview(titleLabel)
        addSubview(typeTextField)
        addSubview(pageTextField)
        addSubview(postLabel)
        addSubview(postTextView)
        addSubview(shareButton)
        
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        typeTextField.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        pageTextField.anchor(top: typeTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        postLabel.anchor(top: pageTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        postTextView.anchor(top: postLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 80)
        
        shareButton.anchor(top: postTextView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
        
    }
    
    @objc func handleShare() {
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let type = facebookShareTypes[row]
        return type.rawValue
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return facebookShareTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let type = facebookShareTypes[row]
        self.typeTextField.text = type.rawValue
        self.choosenType = type
    }
    
}










