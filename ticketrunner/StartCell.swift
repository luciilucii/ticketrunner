//
//  StartCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 11.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class StartCell: BaseCell {
    
    override func setupViews() {
        
        addSubview(headlineTextView)
        addSubview(firstCellHeadlineTextView)
        addSubview(firstCellSubHeadlineTextView)
        addSubview(guideImageView)
        
        //x,y,w,h
        headlineTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        headlineTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        headlineTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        headlineTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        //x,y,w,h
        
        //x,y,w,h
        firstCellHeadlineTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        firstCellHeadlineTextView.topAnchor.constraint(equalTo: topAnchor, constant: 170).isActive = true
        firstCellHeadlineTextView.widthAnchor.constraint(equalToConstant: CGFloat(frame.width - 100)).isActive = true
        firstCellHeadlineTextView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        //x,y,w,h
        firstCellSubHeadlineTextView.leftAnchor.constraint(equalTo: firstCellHeadlineTextView.leftAnchor).isActive = true
        firstCellSubHeadlineTextView.topAnchor.constraint(equalTo: firstCellHeadlineTextView.bottomAnchor, constant: 16).isActive = true
        firstCellSubHeadlineTextView.rightAnchor.constraint(equalTo: firstCellHeadlineTextView.rightAnchor).isActive = true
        firstCellSubHeadlineTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        //x,y,w,h
        guideImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        guideImageView.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        guideImageView.widthAnchor.constraint(equalToConstant: frame.width - 50).isActive = true
        guideImageView.heightAnchor.constraint(equalToConstant: frame.height - 150).isActive = true
        
    }
    
    let headlineTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = .black
        textView.font = UIFont.boldSourceSansPro(ofSize: 24)
        textView.textAlignment = .center
        textView.isScrollEnabled = false
        textView.textColor = UIColor.white
        textView.backgroundColor = .clear
        textView.text = "Short Headline here"
        return textView
    }()
    
    let firstCellHeadlineTextView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.textAlignment = .center
        tv.isEditable = false
        tv.isScrollEnabled = false
        tv.textColor = UIColor.white
        tv.backgroundColor = .clear
        tv.font = UIFont.boldSourceSansPro(ofSize: 24)
        return tv
    }()
    
    let firstCellSubHeadlineTextView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.textAlignment = .center
        tv.isEditable = false
        tv.isScrollEnabled = false
        tv.textColor = UIColor.white
        tv.backgroundColor = .clear
        tv.font = UIFont.sourceSansPro(ofSize: 14)
        return tv
    }()
    
    let guideImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
}

