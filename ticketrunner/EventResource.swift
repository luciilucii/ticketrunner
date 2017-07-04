//
//  EventResource.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 31.05.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import Foundation

class EventResource: NSObject {
    
    func getEvent() -> Event {
        
        let event1 = Event()
        event1.name = "Hello Kitty Event"
        event1.rewards = [Reward]()
        
        let reward1 = Reward()
        reward1.name = "Free VIP Ticket"
        reward1.ticketsToSell = 5
        
        let reward15 = Reward()
        reward15.name = "Meet & Greet"
        reward15.ticketsToSell = 7
        
        let reward3 = Reward()
        reward3.name = "5 Free Tickets"
        reward3.ticketsToSell = 25
        
        let reward2 = Reward()
        reward2.name = "Free TShirt"
        reward2.ticketsToSell = 15
        
        let reward5 = Reward()
        reward5.name = "5 VIP Tickets"
        reward5.ticketsToSell = 35
        
        event1.rewards?.append(reward1)
        event1.rewards?.append(reward2)
        event1.rewards?.append(reward15)
        event1.rewards?.append(reward3)
        event1.rewards?.append(reward5)
        
        let artist1 = Artist()
        artist1.name = "Cro"
        
        let artist2 = Artist()
        artist2.name = "Danju"
        
        let artist3 = Artist()
        artist3.name = "DJ Irgendwas mit langem Namen"
        
        let artist4 = Artist()
        artist4.name = "Florian Eckelmann"
        
        let artist5 = Artist()
        artist5.name = "Ticketspider"
        
        event1.artists = [artist1, artist2, artist3, artist4, artist5]
        
        event1.rewards?.sort(by: { (reward1, reward2) -> Bool in
            
            return reward1.ticketsToSell! < reward2.ticketsToSell!
            
        })
        
        event1.facebookPageLink = "https://www.ticketrunner.com/events/seepark-6-mallorca-schlag"
        
        return event1
    }
    
    func getEvents() -> [Event] {
        
        var events = [Event]()
        
        let event1 = Event()
        event1.name = "Hello Kitty Event mit einem längeren Titel und sogar mit Ort, Köln"
        event1.rewards = [Reward]()
        
        let reward1 = Reward()
        reward1.name = "Free VIP Ticket"
        reward1.ticketsToSell = 5
        
        let reward15 = Reward()
        reward15.name = "Meet & Greet"
        reward15.ticketsToSell = 7
        
        let reward3 = Reward()
        reward3.name = "5 Free Tickets"
        reward3.ticketsToSell = 25
        
        let reward2 = Reward()
        reward2.name = "Free TShirt"
        reward2.ticketsToSell = 15
        
        let reward5 = Reward()
        reward5.name = "5 VIP Tickets"
        reward5.ticketsToSell = 35
        
        event1.rewards?.append(reward1)
        event1.rewards?.append(reward2)
        event1.rewards?.append(reward15)
        event1.rewards?.append(reward3)
        event1.rewards?.append(reward5)
        
        let artist1 = Artist()
        artist1.name = "Cro"
        
        let artist2 = Artist()
        artist2.name = "Danju"
        
        let artist3 = Artist()
        artist3.name = "DJ Irgendwas mit langem Namen"
        
        let artist4 = Artist()
        artist4.name = "Florian Eckelmann"
        
        let artist5 = Artist()
        artist5.name = "Ticketspider"
        
        event1.artists = [artist1, artist2, artist3, artist4, artist5]
        
        event1.rewards?.sort(by: { (reward1, reward2) -> Bool in
            
            return reward1.ticketsToSell! < reward2.ticketsToSell!
            
        })
        
        event1.latidute = 50.941357
        event1.longitude = 6.958307
        
        event1.facebookPageLink = "https://www.ticketrunner.com/events/seepark-6-mallorca-schlag"
        
        
        
        let event2 = Event()
        event2.name = "Ticketrunner After Party"
        
        let reward10 = Reward()
        reward10.name = "Free Ticket"
        reward10.ticketsToSell = 5
        
        let reward150 = Reward()
        reward150.name = "Meet & Greet mit Cro"
        reward150.ticketsToSell = 20
        
        let reward30 = Reward()
        reward30.name = "1 Free VIP Tickets"
        reward30.ticketsToSell = 25
        
        let reward20 = Reward()
        reward20.name = "Free TShirt von Cro"
        reward20.ticketsToSell = 10
        
        let reward50 = Reward()
        reward50.name = "5 VIP Tickets"
        reward50.ticketsToSell = 45
        
        event2.rewards = [reward10, reward20, reward150, reward30, reward50, reward1, reward2]
        
        let artist10 = Artist()
        artist10.name = "Kollegah"
        
        let artist20 = Artist()
        artist20.name = "Farid Bang"
        
        let artist30 = Artist()
        artist30.name = "Spongebozz"
        
        let artist40 = Artist()
        artist40.name = "DJ Matrix"
        
        let artist50 = Artist()
        artist50.name = "DJ ticketrunner"
        
        event2.artists = [artist10, artist20, artist1, artist2, artist3, artist40, artist50, artist30]
        event2.facebookPageLink = "https://www.ticketrunner.com/events/seepark-6-mallorca-schlag"
        
        
        let event3 = Event()
        event3.name = "Seepark Mallorca Party"
        event3.rewards = [reward1, reward50, reward3, reward20, reward15]
        
        event3.artists = [artist1, artist2, artist10, artist20, artist30, artist4, artist5, artist3]
     
        event3.facebookPageLink = "https://www.ticketrunner.com/ticketrunner"
        
        events = [event1, event2, event3]
        
        return events
    }
    
    //MARK: No Rewards yet
    
    func getFetchedEvents() -> [Event] {
        
        var fetchedEvents = [Event]()
        
        ApiService.sharedInstance.fetchEvents(urlString: "https://api.myjson.com/bins/1bly77") { (events) in
            
            for event in events {
                fetchedEvents.append(event)
            }
        }
        
        return fetchedEvents
    }
    
    var controller: DetailEventController?
    
    func getFirstFourArtists(forEvent: Event) -> [Artist] {
        
        let event = forEvent
        var artists = [Artist]()
        
        var i = 0
        
        guard let eventArtists = event.artists else {
            return [Artist]()
        }
        
        for artist in eventArtists {
            
            if i < 4 {
                artists.append(artist)
                i += 1
            }
            
        }
        
        return artists
        
    }
    
}
