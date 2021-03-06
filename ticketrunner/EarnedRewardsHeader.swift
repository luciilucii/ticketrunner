//
//  EarnedRewardsHeader.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 03.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

protocol EarnedRewardsHeaderDelegate {
    func didSelectIndexPath(int: Int)
}

class EarnedRewardsHeader: BaseCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var delegate: EarnedRewardsHeaderDelegate?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "EarnedRewardsIcon")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let titleLabel: H1 = {
        let label = H1()
        let attributedText = NSMutableAttributedString(string: "Earned ", attributes: [NSAttributedStringKey.font: UIFont.boldSourceSansPro(ofSize: 28), NSAttributedStringKey.foregroundColor: UIColor.black])
        attributedText.append(NSMutableAttributedString(string: "Rewards", attributes: [NSAttributedStringKey.font: UIFont.boldSourceSansPro(ofSize: 28), NSAttributedStringKey.foregroundColor: ColorCodes.darkPurple]))
        label.attributedText = attributedText
        return label
    }()
    
    let pointLabel: H1 = {
        let label = H1()
        label.text = "1247°"
        label.textColor = ColorCodes.ticketrunnerGreen
        label.font = UIFont.boldSourceSansPro(ofSize: 30)
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(EarnedRewardsHeaderCell.self, forCellWithReuseIdentifier: cellId)
        cv.backgroundColor = .clear
        return cv
    }()
    
    let barView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCodes.darkPurple
        return view
    }()
    
    var barViewCenterXAnchor: NSLayoutConstraint?
        
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .clear
        
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(pointLabel)
        addSubview(collectionView)
        
        iconImageView.anchor(top: topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 150)
        iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        titleLabel.anchor(top: iconImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 35)
        
        pointLabel.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 35)
        
        collectionView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 50)
        
        _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(setupBarView), userInfo: nil, repeats: false)
    }
    
    @objc func setupBarView() {
        
        
        let indexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        
        addSubview(barView)
        
        barView.anchor(top: nil, left: nil, bottom: collectionView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 8, paddingRight: 0, width: 65, height: 4)
        barView.layer.cornerRadius = 2
        
        guard let cell = collectionView.cellForItem(at: IndexPath(item: 0, section: 0)) else { return }
        
        barViewCenterXAnchor = barView.centerXAnchor.constraint(equalTo: cell.centerXAnchor)
        barViewCenterXAnchor?.isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! EarnedRewardsHeaderCell
        
        switch indexPath.item {
        case 0:
            cell.titleLabel.text = "Unlocked"
        case 1:
            cell.titleLabel.text = "In progress"
        case 2:
            cell.titleLabel.text = "Redeemed"
        default:
            break
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 50
        let width: CGFloat = (frame.width - 32) / 3
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        scrollBarViewTo(index: indexPath.item)
        delegate?.didSelectIndexPath(int: indexPath.item)
    }
    
    func scrollBarViewTo(index: Int) {
        let offset = (frame.width - 32) / 3
        let float = CGFloat(index)
        barViewCenterXAnchor?.constant = offset * float
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
    }
    
}







