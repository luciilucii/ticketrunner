//
//  StepsView.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 17.12.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class StepsView: CustomUIView {
    
    let firstStepView: H1 = {
        let label = H1()
        label.backgroundColor = ColorCodes.homeYellow
        label.text = "1"
        label.textColor = UIColor(white: 0, alpha: 0.25)
        label.clipsToBounds = true
        label.layer.zPosition = 1
        return label
    }()
    
    let firstSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCodes.lightGrayText
        view.layer.zPosition = 0
        return view
    }()
    
    let secondStepView: H1 = {
        let label = H1()
        label.text = "2"
        label.textColor = UIColor(white: 0, alpha: 0.25)
        label.backgroundColor = ColorCodes.lightGrayText
        label.clipsToBounds = true
        label.layer.zPosition = 1
        return label
    }()
    
    let secondSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCodes.lightGrayText
        view.layer.zPosition = 0
        return view
    }()
    
    let thirdStepView: H1 = {
        let label = H1()
        label.text = "3"
        label.textColor = UIColor(white: 0, alpha: 0.25)
        label.backgroundColor = ColorCodes.lightGrayText
        label.clipsToBounds = true
        label.layer.zPosition = 1
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        setupSeperator()
    }
    
    public func setupFirstStep() {
        addSubview(firstStepView)
        addSubview(firstSeperatorView)
        addSubview(secondStepView)
        addSubview(thirdStepView)
        
        firstStepView.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        firstStepView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        firstStepView.backgroundColor = ColorCodes.homeYellow
        firstStepView.layer.cornerRadius = 100/2
        firstStepView.textColor = UIColor.white
        
        secondStepView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 75, height: 75)
        secondStepView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        secondStepView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        secondStepView.backgroundColor = ColorCodes.lightGrayText
        secondStepView.layer.cornerRadius = 75/2
        
        thirdStepView.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 75, height: 75)
        thirdStepView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        thirdStepView.backgroundColor = ColorCodes.lightGrayText
        thirdStepView.layer.cornerRadius = 75/2
    }
    
    public func setupSecondStep() {
        addSubview(firstStepView)
        addSubview(secondStepView)
        addSubview(thirdStepView)
        
        firstStepView.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 75, height: 75)
        firstStepView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        firstStepView.backgroundColor = ColorCodes.lightGrayText
        firstStepView.layer.cornerRadius = 75/2
        
        firstStepView.backgroundColor = ColorCodes.ticketrunnerGreen
        firstSeperatorView.backgroundColor = ColorCodes.ticketrunnerGreen
        
        secondStepView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        secondStepView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        secondStepView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        secondStepView.backgroundColor = ColorCodes.homeYellow
        secondStepView.layer.cornerRadius = 100/2
        secondStepView.textColor = UIColor.white
        
        thirdStepView.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 75, height: 75)
        thirdStepView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        thirdStepView.backgroundColor = ColorCodes.lightGrayText
        thirdStepView.layer.cornerRadius = 75/2
    }
    
    public func setupThirdStep() {
        addSubview(firstStepView)
        addSubview(secondStepView)
        addSubview(thirdStepView)
        
        firstStepView.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 75, height: 75)
        firstStepView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        firstStepView.backgroundColor = ColorCodes.lightGrayText
        firstStepView.layer.cornerRadius = 75/2
        
        firstStepView.backgroundColor = ColorCodes.ticketrunnerGreen
        firstSeperatorView.backgroundColor = ColorCodes.ticketrunnerGreen
        
        secondStepView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 75, height: 75)
        secondStepView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        secondStepView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        secondStepView.backgroundColor = ColorCodes.lightGrayText
        secondStepView.layer.cornerRadius = 75/2
        
        secondStepView.backgroundColor = ColorCodes.ticketrunnerGreen
        secondSeperatorView.backgroundColor = ColorCodes.ticketrunnerGreen
        
        thirdStepView.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 100, height: 100)
        thirdStepView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        thirdStepView.backgroundColor = ColorCodes.homeYellow
        thirdStepView.layer.cornerRadius = 100/2
        thirdStepView.textColor = UIColor.white
    }
    
    private func setupSeperator() {
        addSubview(firstSeperatorView)
        addSubview(secondSeperatorView)
        
        firstSeperatorView.anchor(top: nil, left: leftAnchor, bottom: nil, right: centerXAnchor, paddingTop: 0, paddingLeft: 35, paddingBottom: 0, paddingRight: 8, width: 0, height: 15)
        firstSeperatorView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        secondSeperatorView.anchor(top: nil, left: centerXAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 35, width: 0, height: 15)
        secondSeperatorView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    
}














