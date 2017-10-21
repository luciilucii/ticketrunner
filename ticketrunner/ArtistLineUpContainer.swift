//
//  ArtistLineUpContainer.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 03.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class ArtistLineUpContainer: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //height 324
    
    var controller: EventInfoController?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let lineUpHeadlineLabel: H2 = {
        let label = H2()
        label.text = "Line Up"
        return label
    }()
    
    lazy var showMoreButton: ShowMoreButton = {
        let button = ShowMoreButton(frame: .zero)
        button.addTarget(self, action: #selector(handleShowMore), for: .touchUpInside)
        return button
    }()
    
    var artists: [Artist]?
    
    let cellId = "cellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        backgroundColor = .white
        
        collectionView.register(ArtistLineUpContainerCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(lineUpHeadlineLabel)
        addSubview(collectionView)
        addSubview(showMoreButton)
        
        lineUpHeadlineLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        collectionView.anchor(top: lineUpHeadlineLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 38, paddingRight: 0, width: 0, height: 0)
        
        showMoreButton.anchor(top: collectionView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 32, paddingBottom: 8, paddingRight: 32, width: 0, height: 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let artistsCount = artists?.count else {
            return 0
        }
        if artistsCount > 6 {
            return 6
        } else {
            return artistsCount
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = frame.width / 2
        return CGSize(width: width, height: 162)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ArtistLineUpContainerCell
        
        guard let currentArtists = artists else {
            return cell
        }
        
        let artist = currentArtists[indexPath.item]
        guard let artistsName = artist.name else {
            return cell
        }
        
        cell.artistNameLabel.text = artistsName
        
        return cell
        
    }
    
    func getHeight() -> CGFloat {
        guard let artists = artists else {
            return -8
        }
        var height = 0
        
        if artists.count > 6 {
            height = 3 * 162 + 76
        } else if artists.count % 2 == 0 {
            height = (artists.count / 2 * 162) + 76
        } else {
            height = ((artists.count + 1) / 2 * 162) + 76
        }
        return CGFloat(height)
    }
    
    func handleShowMore() {
        let allArtistsController = AllArtistsForEventController()
        allArtistsController.artists = artists
        controller?.show(allArtistsController, sender: controller)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}






