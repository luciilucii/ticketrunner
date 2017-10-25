//
//  ForgotPasswordController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 06.07.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class ForgotPasswordController: UIViewController {
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = UIColor.darkGray
        textField.placeholder = "Email Adresse"
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.layer.cornerRadius = 10
        textField.font = UIFont.sourceSansPro(ofSize: 16)
        textField.textColor = ColorCodes.textColorGrey
        return textField
    }()
    
    let emailSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.00, green:0.74, blue:1.00, alpha:1.0)
        return view
    }()
    
    let resetButton: TicketrunnerGreenButton = {
        let button = TicketrunnerGreenButton(title: "Reset Password")
        button.addTarget(self, action: #selector(handleReset), for: .touchUpInside)
        return button
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cancel")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.imageView?.tintColor = UIColor.darkGray
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        hideKeyboardWhenTappedAround(views: [view])
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(emailTextField)
        view.addSubview(emailSeperatorView)
        view.addSubview(resetButton)
        view.addSubview(backButton)
        
        backButton.anchor(top: view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 26, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 44, height: 44)
        
        emailTextField.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 150, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        emailSeperatorView.anchor(top: nil, left: emailTextField.leftAnchor, bottom: emailTextField.bottomAnchor, right: emailTextField.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        resetButton.anchor(top: emailTextField.bottomAnchor, left: emailTextField.leftAnchor, bottom: nil, right: emailTextField.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
    }
    
    @objc func handleReset() {
        //TODO: Make that Reset Call
        print(123)
        emailTextField.text = ""
    }
    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
}
