//
//  TwitterShareView.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 11.11.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class TwitterShareView: CustomUIView, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var event: Event? {
        didSet {
            
        }
    }
    
    lazy var pickerView: UIPickerView = {
        let pv = UIPickerView()
        pv.dataSource = self
        pv.delegate = self
        return pv
    }()
    
    let titleLabel: H2 = {
        let label = H2()
        label.text = "On which account would you like to share it?"
        return label
    }()
    
    lazy var pageTextField: TicketrunnerTextField = {
        let tf = TicketrunnerTextField()
        tf.inputView = pickerView
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
        let button = TicketrunnerGreenButton(title: "Tweet Link")
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
        addSubview(pageTextField)
        addSubview(postLabel)
        addSubview(postTextView)
        addSubview(shareButton)
        
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        pageTextField.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        postLabel.anchor(top: pageTextField.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        postTextView.anchor(top: postLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 80)
        
        shareButton.anchor(top: postTextView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        
        
    }
    
    @objc func handleShare() {
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        let type = facebookShareTypes[row]
        return "Hello"
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
}
