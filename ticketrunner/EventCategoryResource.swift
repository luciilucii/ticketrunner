//
//  EventCategoryResource.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 05.07.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class EventCategoryResource: NSObject {
    
    func getCategories() -> [EventCategory] {
        
        var categories = [EventCategory]()
        
        let category1 = EventCategory()
        category1.categoryName = "Theatre"
        category1.categoryID = 1
        categories.append(category1)
        
        let category2 = EventCategory()
        category2.categoryName = "Hip Hop"
        category2.categoryID = 2
        categories.append(category2)
        
        let category3 = EventCategory()
        category3.categoryName = "Metal"
        category3.categoryID = 3
        categories.append(category3)
        
        return categories
    }
    
}
