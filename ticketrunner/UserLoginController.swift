//
//  UserLoginController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 11.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class UserLoginController: UIViewController {
    
    var startController: StartController?
    
    var homeController: HomeController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        setupViews()
        setupInputContainer()
        setupKeyboardObservers()
        self.hideKeyboardWhenTappedAround(views: [tapBackgroundView, inputsContainerView])
    }
    
    let trBlue = UIColor(red:0.00, green:0.74, blue:1.00, alpha:1.0)
    
    let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "cancel")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.imageView?.tintColor = UIColor.darkGray
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        return button
    }()
    
    let falseLoginView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.84, green:0.29, blue:0.29, alpha:1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    let falseLoginImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "bell")?.withRenderingMode(.alwaysTemplate)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.tintColor = .white
        return iv
    }()
    
    let falseLoginLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Login fehlgeschlagen. Email oder Passwort sind nicht korrekt. Bitte überprüfe auch deine Internet-Verbindung."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let tapBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let appImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ticketrunner_logo_short")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = UIColor.darkGray
        label.textAlignment = .center
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = UIColor.darkGray
        textField.placeholder = "Email Adresse"
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = UIColor.darkGray
        textField.placeholder = "Password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let emailSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.00, green:0.74, blue:1.00, alpha:1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.00, green:0.74, blue:1.00, alpha:1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red:0.00, green:0.74, blue:1.00, alpha:1.0)
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()
    
    var appImageViewTopAnchor: NSLayoutConstraint?
    
    var loginButtonBottomAnchor: NSLayoutConstraint?
    var loginButtonWidthAnchor: NSLayoutConstraint?
    
    func setupViews() {
        
        view.addSubview(tapBackgroundView)
        view.addSubview(appImageView)
        view.addSubview(falseLoginView)
        view.addSubview(inputsContainerView)
        view.addSubview(loginButton)
        view.addSubview(backButton)
        
        //x,y,w,h
        backButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 26).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        tapBackgroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tapBackgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tapBackgroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tapBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -66).isActive = true
        
        //x,y,w,h
        appImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        appImageViewTopAnchor = appImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80)
        appImageViewTopAnchor?.isActive = true
        
        appImageView.widthAnchor.constraint(equalToConstant: 75).isActive = true
        appImageView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        //x,y,w,h
        inputsContainerView.topAnchor.constraint(equalTo: appImageView.bottomAnchor, constant: 8).isActive = true
        inputsContainerView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        
        //x,y,w,h
        loginButtonBottomAnchor = loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
        loginButtonBottomAnchor?.isActive = true
        
        loginButtonWidthAnchor = loginButton.widthAnchor.constraint(equalToConstant: CGFloat(view.frame.width - 32))
        loginButtonWidthAnchor?.isActive = true
        
        loginButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addContraintsWithFormat(format: "H:|-16-[v0]-16-|", views: inputsContainerView)
        
        //x,y,w,h
        falseLoginView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        falseLoginView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        falseLoginView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        falseLoginView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        falseLoginView.addSubview(falseLoginLabel)
        falseLoginView.addSubview(falseLoginImageView)
        
        //x,y,w,h
        falseLoginLabel.leftAnchor.constraint(equalTo: falseLoginImageView.rightAnchor, constant: 8).isActive = true
        falseLoginLabel.centerYAnchor.constraint(equalTo: falseLoginView.centerYAnchor).isActive = true
        falseLoginLabel.rightAnchor.constraint(equalTo: falseLoginView.rightAnchor, constant: -25).isActive = true
        falseLoginLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        //x,y,w,h
        falseLoginImageView.leftAnchor.constraint(equalTo: falseLoginView.leftAnchor, constant: 16).isActive = true
        falseLoginImageView.centerYAnchor.constraint(equalTo: falseLoginView.centerYAnchor).isActive = true
        falseLoginImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        falseLoginImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    private func setupInputContainer() {
        
        inputsContainerView.addSubview(titleLabel)
        inputsContainerView.addSubview(emailTextField)
        inputsContainerView.addSubview(passwordTextField)
        inputsContainerView.addSubview(emailSeperatorView)
        inputsContainerView.addSubview(passwordSeperatorView)
        
        
        //x,y,w,h
        inputsContainerView.addContraintsWithFormat(format: "H:|[v0]|", views: titleLabel)
        titleLabel.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //x,y,w,h
        inputsContainerView.addContraintsWithFormat(format: "H:|[v0]|", views: emailTextField)
        emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        //x,y,w,h
        inputsContainerView.addContraintsWithFormat(format: "H:|[v0]|", views: passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        //x,y,w,h
        inputsContainerView.addContraintsWithFormat(format: "H:|[v0]|", views: emailSeperatorView)
        emailSeperatorView.bottomAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //x,y,w,h
        inputsContainerView.addContraintsWithFormat(format: "H:|[v0]|", views: passwordSeperatorView)
        passwordSeperatorView.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor).isActive = true
        passwordSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
    func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func handleKeyboardWillShow(notification: NSNotification) {
        let keyboardFrame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue
        let keyboardDuration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue
        
        loginButtonBottomAnchor?.constant = -keyboardFrame!.height
        loginButtonWidthAnchor?.constant = view.frame.width
        loginButton.layer.cornerRadius = 0
        appImageViewTopAnchor?.constant = 30
        
        UIView.animate(withDuration: keyboardDuration!) {
            self.view.layoutIfNeeded()
        }
    }
    
    func handleKeyboardWillHide(notification: NSNotification) {
        let keyboardDuration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue
        
        loginButtonBottomAnchor?.constant = -16
        loginButtonWidthAnchor?.constant = CGFloat(view.frame.width - 32)
        loginButton.layer.cornerRadius = 5
        appImageViewTopAnchor?.constant = 80
        falseLoginView.isHidden = true
        
        UIView.animate(withDuration: keyboardDuration!) {
            self.view.layoutIfNeeded()
        }
    }
    
    func handleLogin() {
        //TODO: Login einrichten
        print("this is workin'")
        
        handleDismiss()
        guard let controller = startController else {
            return
        }
        
        
        
        controller.dismiss(animated: true, completion: nil)
        
        homeController?.menu?.currentUser = UserResource().getUser()
        
        UIApplication.shared.statusBarStyle = .lightContent
        
    }
    
    func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
}
