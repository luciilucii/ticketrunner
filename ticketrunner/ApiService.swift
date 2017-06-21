//
//  ApiService.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 17.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    
    static let sharedInstance = ApiService()
    
    func fetchEvents(urlString: String, completion: @escaping ([Event]) -> ()) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            if error != nil {
                print("error beim fetchen von Events")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                var events = [Event]()
                
                for dictionary in json as! [[String: AnyObject]] {
                    
                    let event = Event()
                    event.name = dictionary["name"] as? String
                    event.id = dictionary["id"] as? NSNumber
                    event.date = dictionary["date"] as? String
                    
                    event.eventDescription = dictionary["description"] as? String
                    event.videoLink = dictionary["video_link"] as? String
                    event.facebookPageLink = dictionary["facebook_page_link"] as? String
                    event.ticketingLink = dictionary["ticketing_link"] as? String
                    
                    event.publishMessage = dictionary["publish_message"] as? String
                    event.commissionPercentage = dictionary["commission_percentage"] as? Int
                    event.eventCategoryId = dictionary[""] as? Int
                    event.isActive = dictionary["active"] as? Bool
                    
                    event.totalTickets = dictionary["total_tickets"] as? Int
                    event.invited = dictionary["invited"] as? Int
                    event.maybe = dictionary["maybe"] as? Int
                    event.attendence = dictionary["attendence"] as? Int
                    
                    event.longitude = dictionary["longitude"] as? Float
                    event.latidute = dictionary["latitude"] as? Float
                    
                    event.slug = dictionary["slug"] as? String
                    
                    event.pictureFileName = dictionary["picture_file_name"] as? String
                    event.pictureContentType = dictionary["picture_content_type"] as? String
                    event.pictureFileSize = dictionary["picture_file_size"] as? NSNumber
                    event.pictureUpdatedAt = dictionary["picture_updated_at"] as? String
                    
                    event.isBlocked = dictionary["blocked"] as? Bool
                    
                    event.ticketPriceFrom = dictionary["ticket_price_from"] as? NSNumber
                    event.ticketPriceTo = dictionary["ticket_price_to"] as? NSNumber
                    
                    event.userId = dictionary["user_id"] as? Int
                    
                    event.createdAt = dictionary["created_at"] as? String
                    event.updatedAt = dictionary["updated_at"] as? String
                    
                    event.underReview = dictionary["under_review"] as? Bool
                    
                    event.totalFreeTickets = dictionary["total_free_tickets"] as? Int
                    
                    event.rewardsEnabled = dictionary["rewards_enabled"] as? Bool
                    event.commissionEnabled = dictionary["commission_enabled"] as? Bool
                    
                    events.append(event)
                    
                }
                
                DispatchQueue.main.async(execute: {
                    completion(events)
                })
                
                
            } catch let jsonError {
                print(jsonError)
            }
            
        }).resume()
        
    }
    
    func fetchUsers(urlString: String, completion: @escaping ([User]) -> ()) {
        
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            if error != nil {
                print("Error beim fetchen von usern")
                return
            }
            
            do {
                
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                var users = [User]()
                
                for dictionary in json as! [[String: AnyObject]] {
                    
                    let user = User()
                    
                    user.id = dictionary["id"] as? Int
                    user.uid = dictionary["uuid"] as? String
                    user.firstname = dictionary["firstname"] as? String
                    user.middlename = dictionary["middlename"] as? String
                    user.lastname = dictionary["lastname"] as? String
                    
                    user.gender = dictionary["gender"] as? String
                    user.phoneNumber = dictionary["phone_number"] as? Int
                    user.isActive = dictionary["active"] as? Bool
                    user.isBlocked = dictionary["blocked"] as? Bool
                    
                    user.createdAt = dictionary["created_at"] as? String
                    user.updatedAt = dictionary["updated_at"] as? String
                    
                    user.email = dictionary["email"] as? String
                    
                    user.dateOfBirth = dictionary["date_of_birth"] as? String
                    user.website = dictionary["website"] as? String
                    
                    user.language = dictionary["language"] as? String
                    
                    users.append(user)
                    
                }
                
                DispatchQueue.main.async(execute: {
                    completion(users)
                })
                
                
            } catch let jsonError {
                print(jsonError)
            }
            
        }).resume()
        
        
        
    }
    
}
