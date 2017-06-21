//
//  PersonalSettingsContainer.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 15.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class CustomUIView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class PersonalContainer: CustomUIView {
    
    let personalContainerTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Personal"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return label
    }()
    
    let firstnameTextField: UITextField = {
        let tv = UITextField()
        tv.backgroundColor = .white
        tv.setLeftPaddingPoints(5)
        tv.setRightPaddingPoints(5)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.placeholder = "Firstname"
        tv.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return tv
    }()
    
    let lastnameTextField: UITextField = {
        let tv = UITextField()
        tv.backgroundColor = .white
        tv.setLeftPaddingPoints(5)
        tv.setRightPaddingPoints(5)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.placeholder = "Lastname"
        tv.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return tv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(personalContainerTitleLabel)
        addSubview(firstnameTextField)
        addSubview(lastnameTextField)
        
        personalContainerTitleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        personalContainerTitleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        personalContainerTitleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        personalContainerTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //x,y,w,h
        firstnameTextField.topAnchor.constraint(equalTo: personalContainerTitleLabel.bottomAnchor, constant: 8).isActive = true
        firstnameTextField.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        firstnameTextField.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        firstnameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //x,y,w,h
        lastnameTextField.leftAnchor.constraint(equalTo: firstnameTextField.leftAnchor).isActive = true
        lastnameTextField.rightAnchor.constraint(equalTo: firstnameTextField.rightAnchor).isActive = true
        lastnameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        lastnameTextField.topAnchor.constraint(equalTo: firstnameTextField.bottomAnchor, constant: 16).isActive = true
        
    }
    
}

class AddressContainer: CustomUIView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let addressContainerTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Address"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return label
    }()
    
    let streetTextField: UITextField = {
        let tv = UITextField()
        tv.backgroundColor = .white
        tv.setLeftPaddingPoints(5)
        tv.setRightPaddingPoints(5)
        tv.tag = 0
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.placeholder = "Steet"
        tv.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return tv
    }()
    
    let postalCodeTextField: UITextField = {
        let tv = UITextField()
        tv.backgroundColor = .white
        tv.setLeftPaddingPoints(5)
        tv.setRightPaddingPoints(5)
        tv.tag = 1
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.placeholder = "Postal Code"
        tv.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return tv
    }()
    
    let cityTextField: UITextField = {
        let tv = UITextField()
        tv.backgroundColor = .white
        tv.setLeftPaddingPoints(5)
        tv.setRightPaddingPoints(5)
        tv.tag = 2
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.placeholder = "City"
        tv.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return tv
    }()
    
    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.backgroundColor = .white
        picker.dataSource = self
        picker.delegate = self
        return picker
    }()
    
    let lands = ["Germany", "Ghana", "Nederlands", "United Kingdom"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return lands[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lands.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(lands[row])
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(addressContainerTitleLabel)
        addSubview(streetTextField)
        addSubview(postalCodeTextField)
        addSubview(cityTextField)
        addSubview(pickerView)
        
        addressContainerTitleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        addressContainerTitleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        addressContainerTitleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        addressContainerTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        streetTextField.topAnchor.constraint(equalTo: addressContainerTitleLabel.bottomAnchor, constant: 8).isActive = true
        streetTextField.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        streetTextField.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        streetTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        postalCodeTextField.topAnchor.constraint(equalTo: streetTextField.bottomAnchor, constant: 16).isActive = true
        postalCodeTextField.leftAnchor.constraint(equalTo: streetTextField.leftAnchor).isActive = true
        postalCodeTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        postalCodeTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        cityTextField.topAnchor.constraint(equalTo: postalCodeTextField.bottomAnchor, constant: 16).isActive = true
        cityTextField.leftAnchor.constraint(equalTo: streetTextField.leftAnchor).isActive = true
        cityTextField.rightAnchor.constraint(equalTo: streetTextField.rightAnchor).isActive = true
        cityTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        pickerView.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 16).isActive = true
        pickerView.leftAnchor.constraint(equalTo: streetTextField.leftAnchor).isActive = true
        pickerView.rightAnchor.constraint(equalTo: streetTextField.rightAnchor).isActive = true
        pickerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
}

class ContactContainer: CustomUIView {
    
    let contactTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Contact"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return label
    }()
    
    let emailTextField: UITextField = {
        let tv = UITextField()
        tv.backgroundColor = .white
        tv.setLeftPaddingPoints(5)
        tv.setRightPaddingPoints(5)
        tv.keyboardType = .emailAddress
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.placeholder = "Email"
        tv.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return tv
    }()
    
    let phoneTextField: UITextField = {
        let tv = UITextField()
        tv.backgroundColor = .white
        tv.setLeftPaddingPoints(5)
        tv.setRightPaddingPoints(5)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.placeholder = "Phone"
        tv.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return tv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(contactTitleLabel)
        addSubview(emailTextField)
        addSubview(phoneTextField)
        
        contactTitleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contactTitleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        contactTitleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        contactTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        emailTextField.topAnchor.constraint(equalTo: contactTitleLabel.bottomAnchor, constant: 8).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        phoneTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16).isActive = true
        phoneTextField.leftAnchor.constraint(equalTo: emailTextField.leftAnchor).isActive = true
        phoneTextField.rightAnchor.constraint(equalTo: emailTextField.rightAnchor).isActive = true
        phoneTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
}











