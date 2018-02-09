//
//  AFStepsView.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 07.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class AFStepsView: CustomUIView {
    
    let firstStepView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCodes.inactiveElementsGrey
        view.layer.zPosition = 1
        return view
    }()
    
    let firstStepLabel: H3 = {
        let label = H3()
        label.text = "Link\nShared"
        label.numberOfLines = 2
        label.textColor = UIColor(white: 0, alpha: 0.25)
        label.clipsToBounds = true
        label.layer.zPosition = 1
        return label
    }()
    
    let firstSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCodes.inactiveElementsGrey
        view.layer.zPosition = 0
        return view
    }()
    
    let secondStepView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCodes.inactiveElementsGrey
        view.layer.zPosition = 1
        return view
    }()
    
    let secondStepLabel: H3 = {
        let label = H3()
        label.text = "Clicked on\nthe Link"
        label.textColor = ColorCodes.inactiveElementsGrey
        label.clipsToBounds = true
        label.layer.zPosition = 1
        label.numberOfLines = 2
        return label
    }()
    
    let secondSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCodes.inactiveElementsGrey
        view.layer.zPosition = 0
        return view
    }()
    
    let thirdStepLabel: H3 = {
        let label = H3()
        label.text = "Bought\na Ticket"
        label.textColor = ColorCodes.inactiveElementsGrey
        label.clipsToBounds = true
        label.layer.zPosition = 1
        label.numberOfLines = 2
        return label
    }()
    
    let thirdStepView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCodes.inactiveElementsGrey
        view.layer.zPosition = 1
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        setupSeperator()
    }
    
    public func setupFirstStep() {
        addSubview(firstStepView)
        addSubview(secondStepView)
        addSubview(thirdStepView)
        
        
        addSubview(secondStepLabel)
        addSubview(firstStepLabel)
        addSubview(thirdStepLabel)
        
        firstStepView.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 25, height: 25)
        firstStepView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        firstStepView.backgroundColor = ColorCodes.homeYellow
        firstStepView.layer.cornerRadius = 25/2
        
        firstStepLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 50)
        firstStepLabel.centerXAnchor.constraint(equalTo: firstStepView.centerXAnchor).isActive = true
        firstStepLabel.centerYAnchor.constraint(equalTo: secondStepLabel.centerYAnchor).isActive = true
        firstStepLabel.textColor = ColorCodes.homeYellow
        
        
        secondStepView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 15, height: 15)
        secondStepView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        secondStepView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        secondStepView.backgroundColor = ColorCodes.inactiveElementsGrey
        secondStepView.layer.cornerRadius = 15/2
        
        
        secondStepLabel.anchor(top: secondStepView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 50)
        secondStepLabel.centerXAnchor.constraint(equalTo: secondStepView.centerXAnchor).isActive = true
        
        
        
        thirdStepView.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 15, height: 15)
        thirdStepView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        thirdStepView.backgroundColor = ColorCodes.inactiveElementsGrey
        thirdStepView.layer.cornerRadius = 15/2
        
        thirdStepLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 50)
        thirdStepLabel.centerXAnchor.constraint(equalTo: thirdStepView.centerXAnchor).isActive = true
        thirdStepLabel.centerYAnchor.constraint(equalTo: firstStepLabel.centerYAnchor).isActive = true
        
        firstStepView.setupShadows()
        
        
        
        
    }
    
    public func setupSecondStep() {
        addSubview(firstStepView)
        addSubview(secondStepView)
        addSubview(thirdStepView)
        
        addSubview(firstStepLabel)
        addSubview(secondStepLabel)
        addSubview(thirdStepLabel)
        
        firstStepView.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 15, height: 15)
        firstStepView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        firstStepView.backgroundColor = ColorCodes.ticketrunnerGreen
        firstStepView.layer.cornerRadius = 15/2
        
        firstStepLabel.anchor(top: firstStepView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 50)
        firstStepLabel.centerXAnchor.constraint(equalTo: firstStepView.centerXAnchor).isActive = true
        firstStepLabel.textColor = ColorCodes.ticketrunnerGreen
        
        
        secondStepView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 25, height: 25)
        secondStepView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        secondStepView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        secondStepView.backgroundColor = ColorCodes.homeYellow
        secondStepView.layer.cornerRadius = 25/2
        
        
        secondStepLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 50)
        secondStepLabel.centerXAnchor.constraint(equalTo: secondStepView.centerXAnchor).isActive = true
        secondStepLabel.centerYAnchor.constraint(equalTo: firstStepLabel.centerYAnchor).isActive = true
        secondStepLabel.textColor = ColorCodes.homeYellow
        
        
        thirdStepView.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 15, height: 15)
        thirdStepView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        thirdStepView.backgroundColor = ColorCodes.inactiveElementsGrey
        thirdStepView.layer.cornerRadius = 15/2
        
        thirdStepLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 50)
        thirdStepLabel.centerXAnchor.constraint(equalTo: thirdStepView.centerXAnchor).isActive = true
        thirdStepLabel.centerYAnchor.constraint(equalTo: firstStepLabel.centerYAnchor).isActive = true
        
        firstSeperatorView.backgroundColor = ColorCodes.ticketrunnerGreen
        
        thirdStepView.setupShadows()
    }
    
    public func setupThirdStep() {
        addSubview(firstStepView)
        addSubview(secondStepView)
        addSubview(thirdStepView)
        
        addSubview(firstStepLabel)
        addSubview(secondStepLabel)
        addSubview(thirdStepLabel)
        
        firstStepView.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 15, height: 15)
        firstStepView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        firstStepView.backgroundColor = ColorCodes.ticketrunnerGreen
        firstStepView.layer.cornerRadius = 15/2
        
        firstStepLabel.anchor(top: firstStepView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 50)
        firstStepLabel.centerXAnchor.constraint(equalTo: firstStepView.centerXAnchor).isActive = true
        firstStepLabel.textColor = ColorCodes.ticketrunnerGreen
        
        
        secondStepView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 15, height: 15)
        secondStepView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        secondStepView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        secondStepView.backgroundColor = ColorCodes.ticketrunnerGreen
        secondStepView.layer.cornerRadius = 15/2
        
        
        secondStepLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 50)
        secondStepLabel.centerXAnchor.constraint(equalTo: secondStepView.centerXAnchor).isActive = true
        secondStepLabel.centerYAnchor.constraint(equalTo: firstStepLabel.centerYAnchor).isActive = true
        secondStepLabel.textColor = ColorCodes.ticketrunnerGreen
        
        
        thirdStepView.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 25, height: 25)
        thirdStepView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        thirdStepView.backgroundColor = ColorCodes.homeYellow
        thirdStepView.layer.cornerRadius = 25/2
        
        thirdStepLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 50)
        thirdStepLabel.centerXAnchor.constraint(equalTo: thirdStepView.centerXAnchor).isActive = true
        thirdStepLabel.centerYAnchor.constraint(equalTo: firstStepLabel.centerYAnchor).isActive = true
        thirdStepLabel.textColor = ColorCodes.homeYellow
        
        firstSeperatorView.backgroundColor = ColorCodes.ticketrunnerGreen
        secondSeperatorView.backgroundColor = ColorCodes.ticketrunnerGreen
        
        secondStepView.setupShadows()
    }
    
    private func setupSeperator() {
        addSubview(firstSeperatorView)
        addSubview(secondSeperatorView)
        
        firstSeperatorView.anchor(top: nil, left: leftAnchor, bottom: nil, right: centerXAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: 8, width: 0, height: 5)
        firstSeperatorView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        secondSeperatorView.anchor(top: nil, left: centerXAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 15, width: 0, height: 5)
        secondSeperatorView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
}
