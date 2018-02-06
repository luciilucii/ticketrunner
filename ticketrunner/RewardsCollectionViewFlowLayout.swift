//
//  RewardsCollectionViewFlowLayout.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 04.02.18.
//  Copyright © 2018 LucaKiedrowski. All rights reserved.
//

import UIKit

class RewardsCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        
        self.scrollDirection = .horizontal
        self.headerReferenceSize = CGSize(width: accessibilityFrame.width, height: 300)
        
        self.minimumLineSpacing = 0
        self.minimumInteritemSpacing = 0
        self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
    }
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var answer = super.layoutAttributesForElements(in: rect)
        
        let cv = self.collectionView
        let contentOffset = cv?.contentInset
        
        let missingSections = NSMutableIndexSet()
        answer?.forEach({ (attribute) in
            if attribute.representedElementCategory == UICollectionElementCategory.cell {
                missingSections.add(attribute.indexPath.section)
            }
        })
        answer?.forEach({ (attribute) in
            if attribute.representedElementKind == UICollectionElementKindSectionHeader {
                missingSections.remove(attribute.indexPath.section)
            }
        })
        
        missingSections.enumerate { (index, stop) in
            let indexPath = IndexPath(item: 0, section: index)
            
            guard let layoutAttributes = self.layoutAttributesForSupplementaryView(ofKind: UICollectionElementKindSectionHeader, at: indexPath) else { return }
            
            answer?.append(layoutAttributes)
            
        }
        
        answer?.forEach({ (attribute) in
            
            if attribute.representedElementKind == UICollectionElementKindSectionHeader {
                let section = attribute.indexPath.section
                guard let numberOfItemsInSection = cv?.numberOfItems(inSection: section) else { return }
                
                let firstCellIndexPath = IndexPath(item: 0, section: section)
                let lastCellIndexPath = IndexPath(item: numberOfItemsInSection - 1, section: section)
                
                guard let firstCellAttr = layoutAttributesForItem(at: firstCellIndexPath), let lastCellAttr = layoutAttributesForItem(at: lastCellIndexPath) else { return }
                
                if self.scrollDirection == .vertical {
                    
                    let headerHeight = attribute.frame.height
                    var origin = attribute.frame.origin
                    
                    origin.y = CGFloat(min(max(contentOffset?.top ?? 0, (firstCellAttr.frame.minY - headerHeight)), (lastCellAttr.frame.maxY - headerHeight)))
                    
                    attribute.zIndex = 1024
                    attribute.frame = CGRect(origin: origin, size: attribute.frame.size)
                    
                } else {
                    let headerHeight = attribute.frame.height
                    var origin = attribute.frame.origin
                    
                    origin.x = CGFloat(min(max(contentOffset?.left ?? 0, (firstCellAttr.frame.minX - headerHeight)), (lastCellAttr.frame.maxX - headerHeight)))
                    
                    attribute.zIndex = 1024
                    attribute.frame = CGRect(origin: origin, size: attribute.frame.size)
                    
                    
                }
            }
        })
        
        return answer
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
}
