//
//  FilterSearchController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 30.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class FilterSearchController: UIViewController, UIScrollViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var eventController: EventController?
    
    var pickerView = UIPickerView()
    
    var titleLabel: UILabel!
    let titleString = "Search & Filter"
    
    var scrollView: UIScrollView!
    
    var categories: [EventCategory]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        
        setupViews()
        setupTitleLabel()
        setupScrollView(height: 2500)
        setupPickerView()
        setupNavBarButtons()
        
        hideKeyboardWhenTappedAround(views: [scrollContainerView])
        
        view.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0)
    }
    
    func setupPickerView() {
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        categories = [EventCategory]()
        
        let noCategory = EventCategory()
        noCategory.categoryName = "Choose Category"
        categories?.append(noCategory)
        
        let testCategories = EventCategoryResource().getCategories()
        for category in testCategories {
            categories?.append(category)
        }
        
        categoryTextField.inputView = pickerView
    }
    
    func setupScrollView(height: CGFloat) {
        
        self.scrollView = UIScrollView()
        self.scrollView.delegate = self
        self.scrollView.contentSize = CGSize(width: view.frame.width, height: height)
        scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 65, 0)
        scrollView.alwaysBounceVertical = true
        scrollView.frame = view.bounds
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollContainerView)
        
        scrollContainerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: scrollView.contentSize.height)
    }
    
    let scrollContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    let eventNameTextField: UITextField = {
        let tv = UITextField()
        tv.backgroundColor = .white
        tv.setLeftPaddingPoints(5)
        tv.setRightPaddingPoints(5)
        tv.placeholder = "Event Name"
        tv.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return tv
    }()
    
    let categoryTextField: UITextField = {
        let tv = UITextField()
        tv.backgroundColor = .white
        tv.setLeftPaddingPoints(5)
        tv.setRightPaddingPoints(5)
        tv.placeholder = "Choose Category"
        tv.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return tv
    }()
    
    let cityTextField: UITextField = {
        let tv = UITextField()
        tv.backgroundColor = .white
        tv.setLeftPaddingPoints(5)
        tv.setRightPaddingPoints(5)
        tv.placeholder = "City"
        tv.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return tv
    }()
    
    let radiusTextField: UITextField = {
        let tv = UITextField()
        tv.backgroundColor = .white
        tv.setLeftPaddingPoints(5)
        tv.setRightPaddingPoints(5)
        tv.text = "25km"
        tv.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return tv
    }()
    
    let kilometerSlider: UISlider = {
        let slider = UISlider()
        slider.maximumValue = 100.0
        slider.value = 25.0
        slider.minimumValue = 1.0
        slider.thumbTintColor = .white
        return slider
    }()
    
    func setupViews() {
        scrollContainerView.addSubview(eventNameTextField)
        scrollContainerView.addSubview(categoryTextField)
        scrollContainerView.addSubview(cityTextField)
        scrollContainerView.addSubview(radiusTextField)
        scrollContainerView.addSubview(kilometerSlider)
        
        eventNameTextField.anchor(top: scrollContainerView.topAnchor, left: scrollContainerView.leftAnchor, bottom: nil, right: scrollContainerView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 50)
        categoryTextField.anchor(top: eventNameTextField.bottomAnchor, left: eventNameTextField.leftAnchor, bottom: nil, right: eventNameTextField.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        cityTextField.anchor(top: categoryTextField.bottomAnchor, left: categoryTextField.leftAnchor, bottom: nil, right: categoryTextField.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        radiusTextField.anchor(top: cityTextField.bottomAnchor, left: cityTextField.leftAnchor, bottom: nil, right: cityTextField.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        kilometerSlider.anchor(top: radiusTextField.bottomAnchor, left: radiusTextField.leftAnchor, bottom: nil, right: radiusTextField.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 32)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let category = categories?[row]
        return category?.categoryName
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let categories = categories else { return 0 }
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if row == 0 {
            categoryTextField.text = ""
        } else {
            let category = categories?[row]
            categoryTextField.text = category?.categoryName
        }
    }

    
    fileprivate func setupNavBarButtons() {
        let closeButton = UIBarButtonItem(image: #imageLiteral(resourceName: "cancel").withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleClose))
        closeButton.tintColor = UIColor.white
        let filterButton = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(handleSearch))
        
        navigationItem.leftBarButtonItem = closeButton
        navigationItem.rightBarButtonItem = filterButton
    }
    
    func handleClose() {
        dismiss(animated: true, completion: nil)
    }
    
    func handleSearch() {
        
        dismiss(animated: true) {
            
            //TODO: Put the Search mechanism here
            self.eventController?.collectionView?.reloadData()
        }
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
}
