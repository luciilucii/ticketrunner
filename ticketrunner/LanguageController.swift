//
//  LanguageController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 29.05.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

import UIKit

class LanguageController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var languages = [Language]()
    
    var selectedLanguage = "en"
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        
        setupViews()
        setupWhiteTitle(title: "Language")
        setupMenuBar()
        setupCollectionView()
        setupLanugages()
        
        view.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0)
    }
    
    func setupMenuBar() {
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu_icon_3")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleMenu))
        menuButton.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = menuButton
        
    }
    
    func setupLanugages() {
        let english = Language()
        let deutsch = Language()
        let nederlands = Language()
        
        english.name = "English"
        deutsch.name = "Deutsch"
        nederlands.name = "Nederlands"
        
        english.imageName = "british-flag"
        deutsch.imageName = "german-flag"
        nederlands.imageName = "nederland-flag"
        
        english.short = "en"
        deutsch.short = "de"
        nederlands.short = "ne"
        
        languages = [english, nederlands, deutsch]
    }
    
    var menu: Menu!
    
    func handleMenu() {
        menu.showMenu()
        
    }
    
    func setupCollectionView() {
        collectionView?.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0)
        collectionView?.register(LanguageCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        collectionView?.contentInset = UIEdgeInsetsMake(16, 0, 0, 0)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return languages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! LanguageCell
        
        //TODO: change this to the actual language
        
        if indexPath.item == 0 {
            cell.backgroundColor = UIColor(red:0.25, green:0.89, blue:0.56, alpha:1.0)
            cell.languageTitleLabel.textColor = UIColor.white
        } else {
            cell.backgroundColor = .white
            cell.languageTitleLabel.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        }
        
        cell.layer.cornerRadius = 5
        
        let language = languages[indexPath.item]
        cell.languageTitleLabel.text = language.name
        
        guard let languageImageName = language.imageName else {
            return cell
        }
        cell.languageImageView.image = UIImage(named: "\(languageImageName)")
        
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width - 16
        return CGSize(width: width, height: 75)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let language = languages[indexPath.item]
        guard let shortLanguage = language.short else {
            return
        }
        
        selectedLanguage = shortLanguage
        
    }
    
    func setupViews() {
        
    }
    
}


