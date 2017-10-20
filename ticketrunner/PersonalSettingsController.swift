//
//  PersonalSettingsController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 15.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit
import Intercom

class PersonalSettingsController: UIViewController, UIScrollViewDelegate, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var scrollView: UIScrollView!
    
    var firstnameTextField: UITextField?
    var lastnameTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        
        setupViews()
        setupWhiteTitle(title: "Personal")
        setupKeyboardObservers()
        setupScrollView(height: 930)
        self.hideKeyboardWhenTappedAround(views: [view, personalContainer])
        
        
        view.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0)
        Intercom.setLauncherVisible(true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        Intercom.setLauncherVisible(false)
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
    
    lazy var avatarImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "profile_avatar")
        iv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfileImage)))
        iv.isUserInteractionEnabled = true
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 60
        return iv
    }()
    
    let personalContainer: PersonalContainer = {
        let personalContainer = PersonalContainer()
        personalContainer.translatesAutoresizingMaskIntoConstraints = false
        return personalContainer
    }()
    
    let addressContainer: AddressContainer = {
        let container = AddressContainer()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let contactContainer: ContactContainer = {
        let container = ContactContainer()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let updateButton: TicketrunnerBlueButton = {
        let button = TicketrunnerBlueButton(title: "Update")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleUpdate), for: .touchUpInside)
        return button
    }()
    
    func setupViews() {
        
        scrollContainerView.addSubview(avatarImageView)
        scrollContainerView.addSubview(personalContainer)
        scrollContainerView.addSubview(addressContainer)
        scrollContainerView.addSubview(contactContainer)
        scrollContainerView.addSubview(updateButton)
        
        avatarImageView.topAnchor.constraint(equalTo: scrollContainerView.topAnchor, constant: 25).isActive = true
        avatarImageView.centerXAnchor.constraint(equalTo: scrollContainerView.centerXAnchor).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        personalContainer.centerXAnchor.constraint(equalTo: scrollContainerView.centerXAnchor).isActive = true
        personalContainer.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16).isActive = true
        personalContainer.widthAnchor.constraint(equalToConstant: view.frame.width - 32).isActive = true
        personalContainer.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        addressContainer.centerXAnchor.constraint(equalTo: scrollContainerView.centerXAnchor).isActive = true
        addressContainer.topAnchor.constraint(equalTo: personalContainer.bottomAnchor, constant: 16).isActive = true
        addressContainer.widthAnchor.constraint(equalTo: personalContainer.widthAnchor).isActive = true
        addressContainer.heightAnchor.constraint(equalToConstant: 286).isActive = true
        
        contactContainer.centerXAnchor.constraint(equalTo: scrollContainerView.centerXAnchor).isActive = true
        contactContainer.topAnchor.constraint(equalTo: addressContainer.bottomAnchor, constant: 16).isActive = true
        contactContainer.widthAnchor.constraint(equalTo: personalContainer.widthAnchor).isActive = true
        contactContainer.heightAnchor.constraint(equalToConstant: 154).isActive = true
        
        updateButton.centerXAnchor.constraint(equalTo: scrollContainerView.centerXAnchor).isActive = true
        updateButton.topAnchor.constraint(equalTo: contactContainer.bottomAnchor, constant: 16).isActive = true
        updateButton.widthAnchor.constraint(equalTo: contactContainer.widthAnchor).isActive = true
        updateButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    func handleUpdate() {
        //TODO: Update!
        print("hello, I'm a controller & i would like to update my information")
    }
    
    func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    var isContactTextFieldEditing = false
    
    func handleKeyboardWillShow(notification: NSNotification) {
        let keyboardDuration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue
        
        if contactContainer.emailTextField.isEditing == true || contactContainer.phoneTextField.isEditing == true {
            
            isContactTextFieldEditing = true
            
            guard let duration = keyboardDuration else {
                return
            }
            UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    
                self.scrollView.contentOffset.y = self.contactContainer.frame.minY
                    
            }, completion: nil)
        }
        
    }
    
    func handleKeyboardWillHide(notification: NSNotification) {
        
        if isContactTextFieldEditing == true {
            let keyboardDuration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue
            
            guard let duration = keyboardDuration else {
                return
            }
            UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.scrollView.contentOffset.y = self.scrollView.contentSize.height - self.view.frame.height - 65
                
            }, completion: nil)
        }
        
        isContactTextFieldEditing = false
        
    }
    
    func handleSelectProfileImage() {
        
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.navigationBar.barTintColor = UIColor.white
        
        picker.navigationBar.tintColor = UIColor.black
        
        picker.allowsEditing = true
        
        present(picker, animated: true) {
            UIApplication.shared.statusBarStyle = .default
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImageFromPicker = editedImage
        }
        if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            
            avatarImageView.image = selectedImage
        }
        
        
        dismiss(animated: true) {
            UIApplication.shared.statusBarStyle = .lightContent
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("picker canceled")
        
        dismiss(animated: true) {
            UIApplication.shared.statusBarStyle = .lightContent
        }
        
        
    }

    
}















