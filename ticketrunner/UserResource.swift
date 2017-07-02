//
//  UserResource.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 31.05.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import Foundation

class UserResource: NSObject {
    
    func getUser() -> User {
        
        let user = User()
        user.firstname = "Florian"
        
        return user
    }
    
    func getTicketsSoldFor(user: User) -> Int {
        
        return 0
    }
    
}
