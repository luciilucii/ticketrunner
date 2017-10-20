//
//  ChangePasswordController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 16.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class ChangePasswordController: UIViewController, UIScrollViewDelegate, UITextFieldDelegate {
    
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        
        setupKeyboardObservers()
        setupViews()
        setupWhiteTitle(title: "Password")
        setupScrollView(height: view.frame.height)
        hideKeyboardWhenTappedAround(views: [view])
        
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
    
    let currentPasswordTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Current Password"
        label.font = UIFont.boldSourceSansPro(ofSize: 16)
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return label
    }()
    
    lazy var currentPasswordTextField: UITextField = {
        let tv = UITextField()
        tv.backgroundColor = .white
        tv.setLeftPaddingPoints(5)
        tv.setRightPaddingPoints(5)
        tv.delegate = self
        tv.isSecureTextEntry = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.placeholder = "Current Password"
        tv.font = UIFont.sourceSansPro(ofSize: 16)
        tv.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return tv
    }()
    
    let newPasswordTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "New Password"
        label.font = UIFont.boldSourceSansPro(ofSize: 16)
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return label
    }()
    
    lazy var newPasswordTextField: UITextField = {
        let tv = UITextField()
        tv.backgroundColor = .white
        tv.setLeftPaddingPoints(5)
        tv.setRightPaddingPoints(5)
        tv.delegate = self
        tv.isSecureTextEntry = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.placeholder = "New Password"
        tv.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        tv.font = UIFont.sourceSansPro(ofSize: 16)
        return tv
    }()
    
    let confirmPasswordTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password Confirmation"
        label.font = UIFont.boldSourceSansPro(ofSize: 16)
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return label
    }()
    
    lazy var confirmPasswordTextField: UITextField = {
        let tv = UITextField()
        tv.backgroundColor = .white
        tv.delegate = self
        tv.setLeftPaddingPoints(5)
        tv.setRightPaddingPoints(5)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.isSecureTextEntry = true
        tv.placeholder = "Confirm New Password"
        tv.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        tv.font = UIFont.sourceSansPro(ofSize: 16)
        return tv
    }()
    
    let updateButton: TicketrunnerBlueButton = {
        let button = TicketrunnerBlueButton(title: "Update")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleUpdate), for: .touchUpInside)
        return button
    }()
    
    func setupViews() {
        
        scrollContainerView.addSubview(currentPasswordTitleLabel)
        scrollContainerView.addSubview(currentPasswordTextField)
        
        scrollContainerView.addSubview(newPasswordTitleLabel)
        scrollContainerView.addSubview(newPasswordTextField)
        
        scrollContainerView.addSubview(confirmPasswordTitleLabel)
        scrollContainerView.addSubview(confirmPasswordTextField)
        
        scrollContainerView.addSubview(updateButton)
        
        currentPasswordTitleLabel.topAnchor.constraint(equalTo: scrollContainerView.topAnchor, constant: 25).isActive = true
        currentPasswordTitleLabel.centerXAnchor.constraint(equalTo: scrollContainerView.centerXAnchor).isActive = true
        currentPasswordTitleLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 32).isActive = true
        currentPasswordTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        currentPasswordTextField.topAnchor.constraint(equalTo: currentPasswordTitleLabel.bottomAnchor, constant: 0).isActive = true
        currentPasswordTextField.leftAnchor.constraint(equalTo: currentPasswordTitleLabel.leftAnchor).isActive = true
        currentPasswordTextField.rightAnchor.constraint(equalTo: currentPasswordTitleLabel.rightAnchor).isActive = true
        currentPasswordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        newPasswordTitleLabel.topAnchor.constraint(equalTo: currentPasswordTextField.bottomAnchor, constant: 16).isActive = true
        newPasswordTitleLabel.leftAnchor.constraint(equalTo: currentPasswordTextField.leftAnchor).isActive = true
        newPasswordTitleLabel.rightAnchor.constraint(equalTo: currentPasswordTextField.rightAnchor).isActive = true
        newPasswordTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        newPasswordTextField.topAnchor.constraint(equalTo: newPasswordTitleLabel.bottomAnchor).isActive = true
        newPasswordTextField.leftAnchor.constraint(equalTo: newPasswordTitleLabel.leftAnchor).isActive = true
        newPasswordTextField.rightAnchor.constraint(equalTo: newPasswordTitleLabel.rightAnchor).isActive = true
        newPasswordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        confirmPasswordTitleLabel.topAnchor.constraint(equalTo: newPasswordTextField.bottomAnchor, constant: 16).isActive = true
        confirmPasswordTitleLabel.leftAnchor.constraint(equalTo: newPasswordTextField.leftAnchor).isActive = true
        confirmPasswordTitleLabel.rightAnchor.constraint(equalTo: newPasswordTextField.rightAnchor).isActive = true
        confirmPasswordTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        confirmPasswordTextField.topAnchor.constraint(equalTo: confirmPasswordTitleLabel.bottomAnchor).isActive = true
        confirmPasswordTextField.leftAnchor.constraint(equalTo: confirmPasswordTitleLabel.leftAnchor).isActive = true
        confirmPasswordTextField.rightAnchor.constraint(equalTo: confirmPasswordTitleLabel.rightAnchor).isActive = true
        confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        updateButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 16).isActive = true
        updateButton.leftAnchor.constraint(equalTo: confirmPasswordTextField.leftAnchor).isActive = true
        updateButton.rightAnchor.constraint(equalTo: confirmPasswordTextField.rightAnchor).isActive = true
        updateButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func handleKeyboardWillShow(notification: NSNotification) {
        let keyboardFrame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue
        let keyboardDuration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue
        
        guard let keyboardHeight = keyboardFrame?.height else {
            print("Fehler in der Keyboard Höhe")
            return
        }
        let aboveKeyboardView = view.frame.height - keyboardHeight
        
        if confirmPasswordTextField.isEditing == true {
            if confirmPasswordTextField.frame.maxY >= aboveKeyboardView {
                guard let duration = keyboardDuration else {
                    return
                }
                UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.scrollView.contentOffset.y = 100
                }, completion: nil)
            }
        }
    }
    
    func handleKeyboardWillHide(notification: NSNotification) {
        let keyboardDuration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue
        
        guard let duration = keyboardDuration else {
            return
        }
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            self.scrollView.contentOffset.y = 0
            
        }, completion: nil)
    }
    
    func handleUpdate() {
        print("Grandma Update")
    }
    
}
