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
            guard let rewardName = reward?.name else { return }
            self.titleLabel.text = rewardName
            
            if let rewardDescription = reward?.rewardDescription {
                
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
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Free Ticket"
        label.textColor = ColorCodes.textColorGrey
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "for first 50 tickets sold"
        label.textColor = ColorCodes.lightGrayText
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCodes.lightGrayText
        return view
    }()
    
    let bottomSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCodes.lightGrayText
        return view
    }()
    
    lazy var redeemButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Redeem", for: .normal)
        button.backgroundColor = ColorCodes.ticketrunnerGreen
        button.layer.cornerRadius = 5
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleRedeem), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    lazy var progressBarContainer: ProgressBarContainer = {
        let container = ProgressBarContainer()
        container.delegate = self
        container.rewardTableCell = self
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
        tv.font = UIFont.systemFont(ofSize: 14)
        return tv
    }()
    
    let rewardImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "event_neu")
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        backgroundColor = .white
        
        clipsToBounds = true
        
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(seperatorView)
        addSubview(bottomSeperatorView)
        addSubview(redeemButton)
        addSubview(progressBarContainer)
        
        addSubview(detailRewardTextView)
        addSubview(rewardImageView)
        
        iconImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 7, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 50, height: 36)
        
        titleLabel.anchor(top: nil, left: iconImageView.rightAnchor, bottom: topAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 4, paddingBottom: -25, paddingRight: -108, width: 0, height: 18)
        
        subtitleLabel.anchor(top: titleLabel.bottomAnchor, left: titleLabel.leftAnchor, bottom: nil, right: titleLabel.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 18)
        
        seperatorView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5)
        
        bottomSeperatorView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5)
        
        redeemButton.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 4, width: 100, height: 42)
        
        progressBarContainer.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 9, paddingLeft: 0, paddingBottom: 9, paddingRight: 8, width: 100, height: 0)
        
        rewardImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 52, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 98, height: 98)
        
        detailRewardTextView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 52, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        
    }
    
    func handleTap() {
        guard let reward = reward else { return }
        guard let indexPath = indexPath else { return }
        delegate?.didTapCell(reward: reward, indexPath: indexPath)
    }
    
    func handleRedeem() {
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
        
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14)], context: nil)
    }
    
    func getCellHeight() -> CGFloat {
        let textViewHeight = detailRewardTextView.frame.height
        
        return textViewHeight + 56
    }
    
}

protocol RewardTableCellDelegate {
    func didTapCell(reward: Reward, indexPath: IndexPath)
    func didTapRedeem(reward: Reward)
}













