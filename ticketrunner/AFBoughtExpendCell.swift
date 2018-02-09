//
//  AFBoughtExpendCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 07.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class AFBoughtExpendCell: AFBaseCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    let plusLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.text = "+300°"
        label.textColor = UIColor.white
        label.backgroundColor = ColorCodes.ticketrunnerGreen
        label.clipsToBounds = true
        label.font = UIFont.boldSourceSansPro(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    let titleLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.numberOfLines = 0
        
        let attributedText = NSMutableAttributedString(string: "                   Lumpy Space", attributes: [NSAttributedStringKey.font : UIFont.boldSourceSansPro(ofSize: 14), NSAttributedStringKey.foregroundColor: UIColor.black])
        
        attributedText.append(NSMutableAttributedString(string: " bought a ticket of ", attributes: [NSAttributedStringKey.font : UIFont.sourceSansPro(ofSize: 14), NSAttributedStringKey.foregroundColor: ColorCodes.lightGrayText]))
        
        attributedText.append(NSMutableAttributedString(string: "Panama Open Air 2018 Event", attributes: [NSAttributedStringKey.font : UIFont.boldSourceSansPro(ofSize: 14), NSAttributedStringKey.foregroundColor: ColorCodes.darkPurple]))
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.lineSpacing = 5
        
        attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedText.length))
        
        label.attributedText = attributedText
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .white
        cv.register(AFExpendedTicketCell.self, forCellWithReuseIdentifier: cellId)
        return cv
    }()
    
    let seperatorView = UIView()
    
    override func setupViews() {
        super.setupViews()
        
        seperatorView.backgroundColor = ColorCodes.inactiveElementsGrey
        
        whiteView.addSubview(titleLabel)
        whiteView.addSubview(plusLabel)
        whiteView.addSubview(seperatorView)
        whiteView.addSubview(collectionView)
        
        
        titleLabel.anchor(top: whiteView.topAnchor, left: miniImageView.trailingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 8, left: 24, bottom: 8, right: 16), size: .init(width: 0, height: 84))
        
        plusLabel.anchor(top: nil, left: titleLabel.leadingAnchor, bottom: whiteView.topAnchor, right: nil, padding: .init(top: 0, left: 0, bottom: -48, right: 0), size: .init(width: 45, height: 18))
        plusLabel.layer.cornerRadius = 20/2
        
        seperatorView.anchor(top: whiteView.topAnchor, left: whiteView.leadingAnchor, bottom: nil, right: whiteView.trailingAnchor, padding: .init(top: 100, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0.5))
        
        collectionView.anchor(top: seperatorView.bottomAnchor, left: whiteView.leadingAnchor, bottom: whiteView.bottomAnchor, right: whiteView.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 16, right: 16), size: .zero)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AFExpendedTicketCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 50
        let width: CGFloat = collectionView.frame.width
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}








