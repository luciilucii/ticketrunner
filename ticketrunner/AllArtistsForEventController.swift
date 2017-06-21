//
//  AllArtistsForEventController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 03.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class AllArtistsForEventController: UIViewController {
    
    var event: Event?
    
    var artists: [Artist]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        setupViews()
        
    }
    
    
    var lineUpContainerHeight: CGFloat?
    
    func checkLineUpContainerHeight() -> CGFloat {
        
        if let artistsCount = artists?.count {
            if artistsCount % 2 == 0 {
                
                let height = CGFloat(artistsCount / 2) * 162 + 40
                return height
                
            } else {
                
                let count = (artistsCount + 1) / 2
                let height = CGFloat(count) * 162 + 40
                return height
            }
        }
        
        return 0
    }
    
    func setupViews() {
        
        let lineUpContainer: ArtistLineUpContainer = {
            let container = ArtistLineUpContainer()
            container.artists = artists
            return container
        }()

        
        view.addSubview(lineUpContainer)
        
        view.addContraintsWithFormat(format: "H:|[v0]|", views: lineUpContainer)
        view.addContraintsWithFormat(format: "V:|[v0]|", views: lineUpContainer)
        
    }
    
}
