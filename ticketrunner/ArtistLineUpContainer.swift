//
//  ArtistLineUpContainer.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 03.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class ArtistLineUpContainer: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let lineUpHeadlineLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorCodes.textColorGrey
        label.text = "Line Up"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    var artists: [Artist]?
    
    let cellId = "cellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(ArtistLineUpContainerCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(lineUpHeadlineLabel)
        addSubview(collectionView)
        
        addContraintsWithFormat(format: "H:|[v0]|", views: lineUpHeadlineLabel)
        addContraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        
        addContraintsWithFormat(format: "V:|[v0(40)][v1]|", views: lineUpHeadlineLabel, collectionView)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let artistsCount = artists?.count else {
            return 0
        }
        
        return artistsCount
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
            return 0
        }
        var height = 0
        
        if artists.count % 2 == 0 {
            height = artists.count / 2 * 162 + 84
        } else {
            height = (artists.count + 1) / 2 * 162 + 84
        }
        
        return CGFloat(height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}






