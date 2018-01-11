//
//  RedeemRewardModelViewController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 13.10.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

protocol RedeemRewardModelViewControllerDelegate {
    func didTapRedeem(redeemRewardModelViewController: RedeemRewardModelViewController, reward: Reward)
    func didTapCancel(redeemRewardModelViewController: RedeemRewardModelViewController)
}

class RedeemRewardModelViewController: UIViewController {
    
    var delegate: RedeemRewardModelViewControllerDelegate?
    
    var reward: Reward?
    
    let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    lazy var redeemButton: TicketrunnerGreenButton = {
        let button = TicketrunnerGreenButton(title: "Redeem")
        button.addTarget(self, action: #selector(redeemReward), for: .touchUpInside)
        return button
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSourceSansPro(ofSize: 16)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
        button.backgroundColor = ColorCodes.ticketrunnerRed
        return button
    }()
    
    let titleLabel: H2 = {
        let label = H2()
        label.text = "Redeem Reward"
        return label
    }()
    
    let rewardContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let rewardsImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "event_neu")
        return iv
    }()
    
    let pointsLabel: TicketrunnerPointsLabel = {
        let label = TicketrunnerPointsLabel()
        label.text = "-200°"
        label.textColor = ColorCodes.ticketrunnerRed
        return label
    }()
    
    let rewardTitleLabel: H2 = {
        let label = H2()
        label.text = "Meet & Greet"
        return label
    }()
    
    let textLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.text = "Do you want to redeem this reward?"
        label.textColor = ColorCodes.textColorGrey
        label.textAlignment = .center
        return label
    }()
    
    let redeemWhiteView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 5
        view.isHidden = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        view.isOpaque = false
        
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
        
        view.addSubview(whiteView)
        
        if #available(iOS 11.0, *) {
            whiteView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 16, paddingBottom: 32, paddingRight: 16, width: 0, height: 0)
        } else {
            // Fallback on earlier versions
            whiteView.anchor(top: topLayoutGuide.bottomAnchor, left: view.leftAnchor, bottom: bottomLayoutGuide.topAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 16, paddingBottom: 32, paddingRight: 16, width: 0, height: 0)
        }
        
        whiteView.addSubview(redeemButton)
        whiteView.addSubview(cancelButton)
        whiteView.addSubview(titleLabel)
        
        whiteView.addSubview(rewardContainerView)
        
        rewardContainerView.addSubview(rewardsImageView)
        rewardContainerView.addSubview(rewardTitleLabel)
        
        whiteView.addSubview(textLabel)
        whiteView.addSubview(pointsLabel)
        
        redeemButton.anchor(top: nil, left: whiteView.centerXAnchor, bottom: whiteView.bottomAnchor, right: whiteView.rightAnchor, paddingTop: 0, paddingLeft: 4, paddingBottom: 8, paddingRight: 8, width: 0, height: 45)
        
        cancelButton.anchor(top: nil, left: whiteView.leftAnchor, bottom: whiteView.bottomAnchor, right: whiteView.centerXAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 8, paddingRight: 4, width: 0, height: 45)
        
        titleLabel.anchor(top: whiteView.topAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 12, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        rewardsImageView.anchor(top: nil, left: rewardContainerView.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 45, height: 45)
        rewardsImageView.centerYAnchor.constraint(equalTo: whiteView.centerYAnchor).isActive = true
        rewardsImageView.layer.cornerRadius = 45 / 2
        
        rewardTitleLabel.anchor(top: rewardsImageView.topAnchor, left: rewardsImageView.rightAnchor, bottom: rewardsImageView.bottomAnchor, right: rewardContainerView.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        rewardContainerView.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        rewardContainerView.centerYAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 29).isActive = true
        
        textLabel.anchor(top: rewardsImageView.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        pointsLabel.anchor(top: textLabel.bottomAnchor, left: whiteView.leftAnchor, bottom: cancelButton.topAnchor, right: whiteView.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
        
        view.addSubview(redeemWhiteView)
        
        if #available(iOS 11.0, *) {
            redeemWhiteView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 16, paddingBottom: 32, paddingRight: 16, width: 0, height: 0)
        } else {
            // Fallback on earlier versions
            redeemWhiteView.anchor(top: topLayoutGuide.bottomAnchor, left: view.leftAnchor, bottom: bottomLayoutGuide.topAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 16, paddingBottom: 32, paddingRight: 16, width: 0, height: 0)
        }
        setupRedeemWhiteView()
        
    }
    
    let congratsLabel: H1 = {
        let label = H1()
        label.text = "Congrats!"
        label.textColor = ColorCodes.homeYellow
        return label
    }()
    
    let redeemedRewardImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "event_neu")
        return iv
    }()
    
    let redeemedRewardTitleLabel: H2 = {
        let label = H2()
        label.text = "Meet & Greet"
        label.textColor = ColorCodes.textColorGrey
        return label
    }()
    
    fileprivate func setupRedeemWhiteView() {
        redeemWhiteView.addSubview(congratsLabel)
        
        redeemWhiteView.addSubview(redeemedRewardImageView)
        redeemWhiteView.addSubview(redeemedRewardTitleLabel)
        
        congratsLabel.anchor(top: redeemWhiteView.topAnchor, left: redeemWhiteView.leftAnchor, bottom: nil, right: redeemWhiteView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        redeemedRewardImageView.anchor(top: congratsLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 125, height: 125)
        redeemedRewardImageView.centerXAnchor.constraint(equalTo: redeemWhiteView.centerXAnchor).isActive = true
        redeemedRewardImageView.layer.cornerRadius = 125 / 2
        
        redeemedRewardTitleLabel.anchor(top: redeemedRewardImageView.bottomAnchor, left: redeemWhiteView.leftAnchor, bottom: nil, right: redeemWhiteView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
    }
    
    @objc func handleDone() {
        //TODO: Animation for ticketrunner in EventRewardsController
        handleDismiss()
    }
    
    @objc func handleDismiss() {
        self.dismiss(animated: true) {
            //completion here
        }
    }
    
    @objc func redeemReward() {
        guard let reward = self.reward else { return }
        
        UIView.transition(with: whiteView, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            //completion here
        }) { (completed) in
            if completed {
                self.whiteView.isHidden = true
                self.redeemWhiteView.isHidden = false
                self.handleAnimateConfetti()
                
                _ = Timer.scheduledTimer(timeInterval: 3.5, target: self, selector: #selector(self.handleDone), userInfo: nil, repeats: false)
            }
        }
        
        delegate?.didTapRedeem(redeemRewardModelViewController: self, reward: reward)
    }
    
    @objc func handleCancel() {
        delegate?.didTapCancel(redeemRewardModelViewController: self)
    }
    
    fileprivate func handleAnimateConfetti() {
        for _ in 0...100 {
            let randomDelay = Double(randomNumber(lowerInt: 1, upperInt: 7) / 10)
            let randomImageInt = randomNumber(lowerInt: 0, upperInt: 2)
            
            var image: UIImage
            
            switch Int(randomImageInt) {
            case 0:
                image = #imageLiteral(resourceName: "ticket-red")
            case 1:
                image = #imageLiteral(resourceName: "ticketrunner_logo_short")
            default:
                image = #imageLiteral(resourceName: "ticketrunner_logo_grau")
            }
            animateSingleConfetti(withDelay: randomDelay, image: image)
        }
    }
    
    func animateSingleConfetti(withDelay: TimeInterval, image: UIImage) {
        let imageView = UIImageView()
        imageView.image = image.withRenderingMode(.alwaysOriginal)
        
        view.addSubview(imageView)
        
        var imageViewTopAnchor: NSLayoutConstraint
        
        let leftAnchorFloat = randomNumber(lowerInt: 0, upperInt: Double(view.frame.width))
        let topAnchorConstant = randomNumber(lowerInt: 0, upperInt: 30) - 30
        
        imageView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: leftAnchorFloat, paddingBottom: 0, paddingRight: 0, width: 25, height: 25)
        imageViewTopAnchor = imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: -150)
        imageViewTopAnchor.isActive = true
        
        UIView.animate(withDuration: withDelay, animations: {
            imageViewTopAnchor.constant = topAnchorConstant - 30
            self.view.layoutIfNeeded()
        }) { _ in
            imageViewTopAnchor.constant = self.view.frame.height + topAnchorConstant + 50
            
            UIView.animate(withDuration: 2.5, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    func randomNumber(lowerInt: Double, upperInt: Double) -> CGFloat {
        let lower : UInt32 = UInt32(lowerInt)
        let upper : UInt32 = UInt32(upperInt)
        let randomNumber = arc4random_uniform(upper - lower) + lower
        
        return CGFloat(randomNumber)
    }
    
}


















