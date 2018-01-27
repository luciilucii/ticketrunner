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
    
    let titleLabel: H1 = {
        let label = H1()
        label.text = "Redeem Reward"
        label.font = UIFont.boldSourceSansPro(ofSize: 26)
        label.textColor = ColorCodes.darkPurple
        return label
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
        label.font = UIFont.boldSourceSansPro(ofSize: 26)
        label.textColor = ColorCodes.ticketrunnerRed
        return label
    }()
    
    let rewardTitleLabel: H2 = {
        let label = H2()
        label.textColor = UIColor.black
        label.text = "Meet & Greet"
        return label
    }()
    
    let textLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.text = "Do you want to redeem this Reward?"
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
    
    let actualBalanceLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.text = "Actual balance 1575°"
        label.textColor = ColorCodes.textColorGrey
        label.textAlignment = .center
        label.font = UIFont.boldSourceSansPro(ofSize: 16)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupModalCancelButton()
        
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        view.isOpaque = false
        
//        view.isUserInteractionEnabled = true
//        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
        
        view.addSubview(whiteView)
        
        whiteView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 400)
        whiteView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        whiteView.addSubview(redeemButton)
        whiteView.addSubview(cancelButton)
        whiteView.addSubview(rewardsImageView)
        whiteView.addSubview(titleLabel)
        whiteView.addSubview(rewardTitleLabel)
        whiteView.addSubview(textLabel)
        whiteView.addSubview(pointsLabel)
        whiteView.addSubview(actualBalanceLabel)
        
        redeemButton.anchor(top: nil, left: whiteView.centerXAnchor, bottom: whiteView.bottomAnchor, right: whiteView.rightAnchor, paddingTop: 0, paddingLeft: 4, paddingBottom: 8, paddingRight: 8, width: 0, height: 45)
        
        cancelButton.anchor(top: nil, left: whiteView.leftAnchor, bottom: whiteView.bottomAnchor, right: whiteView.centerXAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 8, paddingRight: 4, width: 0, height: 45)
        
        
        
        rewardsImageView.anchor(top: whiteView.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 85, height: 85)
        rewardsImageView.layer.cornerRadius = 85/2
        rewardsImageView.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        
        titleLabel.anchor(top: rewardsImageView.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        rewardTitleLabel.anchor(top: titleLabel.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 25)
        
        textLabel.anchor(top: rewardTitleLabel.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        pointsLabel.anchor(top: textLabel.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 40)
        
        actualBalanceLabel.anchor(top: pointsLabel.bottomAnchor, left: whiteView.leftAnchor, bottom: nil, right: whiteView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        
        view.addSubview(redeemWhiteView)
        
        redeemWhiteView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 400)
        redeemWhiteView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        setupRedeemWhiteView()
        
    }
    
    let congratsLabel: H1 = {
        let label = H1()
        label.text = "Congrats!"
        label.textColor = ColorCodes.darkPurple
        label.font = UIFont.boldSourceSansPro(ofSize: 26)
        return label
    }()
    
    let redeemedRewardImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "event_neu")
        return iv
    }()
    
    let redeemedRewardLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.textAlignment = .center
        label.text = "VIP Ticket Reward is yours."
        label.font = UIFont.boldSourceSansPro(ofSize: 16)
        label.textColor = UIColor.black
//        let attributedString = NSMutableAttributedString(string: "You just unlocked \"", attributes: [NSAttributedStringKey.font: UIFont.sourceSansPro(ofSize: 16), NSAttributedStringKey.foregroundColor: ColorCodes.textColorGrey])
//
//        attributedString.append(NSMutableAttributedString(string: "Free VIP Ticket", attributes: [NSAttributedStringKey.font: UIFont.boldSourceSansPro(ofSize: 16), NSAttributedStringKey.foregroundColor: UIColor.black]))
//
//        attributedString.append(NSMutableAttributedString(string: "\" Reward", attributes: [NSAttributedStringKey.font: UIFont.sourceSansPro(ofSize: 16), NSAttributedStringKey.foregroundColor: ColorCodes.textColorGrey]))
//
//        label.attributedText = attributedString
        
        return label
    }()
    
    let howToGetLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.textAlignment = .center
        let attributedString = NSMutableAttributedString(string: "This is how you'll get it:\n", attributes: [NSAttributedStringKey.font: UIFont.sourceSansPro(ofSize: 16), NSAttributedStringKey.foregroundColor: ColorCodes.textColorGrey])
        
        attributedString.append(NSMutableAttributedString(string: "%redeem_type%", attributes: [NSAttributedStringKey.font: UIFont.boldSourceSansPro(ofSize: 16), NSAttributedStringKey.foregroundColor: ColorCodes.darkPurple]))
        
        label.attributedText = attributedString
        label.numberOfLines = 0
        return label
    }()
    
    let whereLabel: NormalToSmallTextLabel = {
        let label = NormalToSmallTextLabel()
        label.text = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    fileprivate func setupRedeemWhiteView() {
        redeemWhiteView.addSubview(redeemedRewardImageView)
        redeemWhiteView.addSubview(congratsLabel)
        redeemWhiteView.addSubview(redeemedRewardLabel)
        redeemWhiteView.addSubview(howToGetLabel)
        redeemWhiteView.addSubview(whereLabel)
        
        
        redeemedRewardImageView.anchor(top: redeemWhiteView.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 85, height: 85)
        redeemedRewardImageView.centerXAnchor.constraint(equalTo: redeemWhiteView.centerXAnchor).isActive = true
        redeemedRewardImageView.layer.cornerRadius = 85/2
        
        congratsLabel.anchor(top: redeemedRewardImageView.bottomAnchor, left: redeemWhiteView.leftAnchor, bottom: nil, right: redeemWhiteView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        redeemedRewardLabel.anchor(top: congratsLabel.bottomAnchor, left: redeemWhiteView.leftAnchor, bottom: nil, right: redeemWhiteView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        howToGetLabel.anchor(top: redeemedRewardLabel.bottomAnchor, left: redeemWhiteView.leftAnchor, bottom: nil, right: redeemWhiteView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 60)
        
        whereLabel.anchor(top: howToGetLabel.bottomAnchor, left: redeemWhiteView.leftAnchor, bottom: nil, right: redeemWhiteView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 100)
        
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
                
//                _ = Timer.scheduledTimer(timeInterval: 3.5, target: self, selector: #selector(self.handleDone), userInfo: nil, repeats: false)
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


















