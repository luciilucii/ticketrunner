//
//  RewardTableView.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 13.10.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class RewardTableCell: TableCell, ProgressBarContainerDelegate {
    
    var reward: Reward? {
        didSet {
            guard let reward = reward else { return }
            
            self.progressBarContainer.isHidden = true
            self.redeemButton.isHidden = true
            self.checkmarkImageView.isHidden = true
            
            guard let state = reward.currentRewardState else { return }
            switch state {
            case .inProgress:
                self.progressBarContainer.isHidden = false
                self.redeemButton.isHidden = true
                self.checkmarkImageView.isHidden = true
            case .redeemed:
                self.progressBarContainer.isHidden = true
                self.redeemButton.isHidden = true
                self.checkmarkImageView.isHidden = false
            case .unlocked:
                self.progressBarContainer.isHidden = true
                self.redeemButton.isHidden = false
                self.checkmarkImageView.isHidden = true
            }
            
            
            guard let rewardName = reward.name else { return }
            self.titleLabel.text = rewardName
            
            if let rewardDescription = reward.rewardDescription {
                
                let contentSize = self.detailRewardTextView.sizeThatFits(detailRewardTextView.bounds.size)
                var textViewFrame = self.detailRewardTextView.frame
                textViewFrame.size.height = contentSize.height
                self.detailRewardTextView.frame = frame
                
                let aspectRatioTextViewConstraint = NSLayoutConstraint(item: self.detailRewardTextView, attribute: .height, relatedBy: .equal, toItem: self.detailRewardTextView, attribute: .width, multiplier: (detailRewardTextView.bounds.height) / (detailRewardTextView.bounds.width), constant: 1)
                aspectRatioTextViewConstraint.isActive = true
                
                UIView.animate(withDuration: 0.1, animations: {
                    self.layoutIfNeeded()
                })
            }
            progressBarContainer.reward = reward
        }
    }
    
    var delegate: RewardTableCellDelegate?
    
    var indexPath: IndexPath?
    
    var textViewHeight: CGFloat?
    
    let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = #imageLiteral(resourceName: "Icon Merchandise")
//        iv.tintColor = ColorCodes.homeYellow
        return iv
    }()
    
    let titleLabel: H3 = {
        let label = H3()
        label.text = "Free Ticket"
        label.textAlignment = .left
        return label
    }()
    
    let subtitleLabel: SmallTextLabel = {
        let label = SmallTextLabel()
        label.text = "for first 50 tickets sold"
        return label
    }()
    
    lazy var redeemButton: TicketrunnerGreenButton = {
        let button = TicketrunnerGreenButton(title: "Redeem")
        button.addTarget(self, action: #selector(handleRedeem), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    let checkmarkImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Checkmark")
        iv.contentMode = .scaleAspectFit
        iv.isHidden = true
        return iv
    }()
    
    lazy var progressBarContainer: ProgressBarContainer = {
        let container = ProgressBarContainer()
        container.delegate = self
        container.rewardTableCell = self
        container.isHidden = true
        return container
    }()
    
    let detailRewardTextView: UITextView = {
        let tv = UITextView()
        tv.isEditable = false
        tv.text = """
        Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea with Tim and Leon are awesome!
        """
        tv.textColor = ColorCodes.lightGrayText
        let exclusion = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 104, height: 100))
        tv.textContainer.exclusionPaths = [exclusion]
        tv.isSelectable = false
        tv.isScrollEnabled = false
        tv.isUserInteractionEnabled = false
        tv.font = UIFont.sourceSansPro(ofSize: 14)
        return tv
    }()
    
    let rewardImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "event_neu")
        return iv
    }()
    
    let whereToGetLabel: SmallTextLabel = {
        let label = SmallTextLabel()
        label.text = "Where to get? - Here!"
        return label
    }()
    
    override func setupViews() {
        addSubview(view)
        view.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 1, paddingLeft: 8, paddingBottom: 1, paddingRight: 8, width: 0, height: 0)
        
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        backgroundColor = .clear
        
        view.backgroundColor = .white
        
        clipsToBounds = true
        
        view.addSubview(iconImageView)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(redeemButton)
        view.addSubview(checkmarkImageView)
        view.addSubview(progressBarContainer)
        
        view.addSubview(detailRewardTextView)
        view.addSubview(rewardImageView)
        view.addSubview(whereToGetLabel)
        
        iconImageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 7, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 50, height: 36)
        
        titleLabel.anchor(top: nil, left: iconImageView.rightAnchor, bottom: view.topAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 4, paddingBottom: -25, paddingRight: -108, width: 0, height: 18)
        
        subtitleLabel.anchor(top: titleLabel.bottomAnchor, left: titleLabel.leftAnchor, bottom: nil, right: titleLabel.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 18)
        
        redeemButton.anchor(top: view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 4, width: 100, height: 42)
        
        checkmarkImageView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 42, height: 42)
        checkmarkImageView.centerXAnchor.constraint(equalTo: redeemButton.centerXAnchor).isActive = true
        checkmarkImageView.centerYAnchor.constraint(equalTo: redeemButton.centerYAnchor).isActive = true
        
        progressBarContainer.anchor(top: view.topAnchor, left: nil, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 9, paddingLeft: 0, paddingBottom: 9, paddingRight: 8, width: 100, height: 0)
        
        rewardImageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 52, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 98, height: 98)
        
        detailRewardTextView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 52, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        whereToGetLabel.anchor(top: detailRewardTextView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 20)
        
        
    }
    
    @objc func handleTap() {
        guard let reward = reward else { return }
        guard let indexPath = indexPath else { return }
        delegate?.didTapCell(reward: reward, indexPath: indexPath)
    }
    
    @objc func handleRedeem() {
        guard let reward = reward else { return }
        delegate?.didTapRedeem(reward: reward)
    }
    
    func shouldShowTriangles() -> Bool {
        return true
    }
    
    func progressBarBackgroundWidth() -> CGFloat {
        return 100
    }
    
    func shouldProgressBarAnimate() -> Bool {
        return false
    }
    
    private func estimateFrameForText(text: String) -> CGRect {
        let size = CGSize(width: self.frame.width - 16, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)], context: nil)
    }
    
    func getCellHeight() -> CGFloat {
        let textViewHeight = detailRewardTextView.frame.height + 20
        
        let height = textViewHeight + 56 + 2
        
        return height
    }
    
}

protocol RewardTableCellDelegate {
    func didTapCell(reward: Reward, indexPath: IndexPath)
    func didTapRedeem(reward: Reward)
}













