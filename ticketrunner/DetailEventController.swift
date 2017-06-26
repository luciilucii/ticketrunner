//
//  DetailEventController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 28.05.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit
import MapKit

class DetailEventController: UIViewController, UIScrollViewDelegate, CLLocationManagerDelegate {
    
    var titleLabel: UILabel!
    var scrollView: UIScrollView!
    
    let cellId = "cellId"
    let rewardsCellId = "rewardsCellId"
    
    var mapViewHeightAnchor: NSLayoutConstraint?
    
    var currentEvent: Event? {
        didSet {
            guard let eventName = currentEvent?.name else {
                return
            }
        
            eventNameLabel.text = eventName
            
            
        }
    }
    
    var rewardsHeight: CGFloat = 0
    var lineUpHeight: CGFloat = 0
    
    var rewards: [Reward]?
    var artists: [Artist]?
    
    var lineUpContainer: ArtistLineUpContainer? {
        didSet {
            
            guard let container = lineUpContainer else {
                return
            }
            guard let event = currentEvent else {
                return
            }
            container.artists = eventResource.getFirstFourArtists(forEvent: event)
            
            lineUpHeight = container.getHeight() - 44
            
            artistLineUpContainer.addSubview(seeAllArtistsButton)
            artistLineUpContainer.addSubview(container)
            
            artistLineUpContainer.addContraintsWithFormat(format: "H:|[v0]|", views: container)
            artistLineUpContainer.addContraintsWithFormat(format: "V:|[v0(\(lineUpHeight))][v1(44)]", views: container, seeAllArtistsButton)
            artistLineUpContainer.addContraintsWithFormat(format: "H:[v0(100)]|", views: seeAllArtistsButton)
            
        }
    }
    
    var eventRewardsContainer: EventRewardsContainer? {
        didSet {
            
            guard let container = eventRewardsContainer else {
                return
            }
            container.rewards = rewards
            
            //TODO: nächste Zeile auch im EventController?!
            rewardsHeight = container.getHeight() - 133
            
            promoteContainerView.addSubview(promoteTitleLabel)
            promoteContainerView.addSubview(promoteBarContainerView)
            promoteContainerView.addSubview(container)
            
            promoteContainerView.addContraintsWithFormat(format: "H:|-16-[v0]-16-|", views: promoteTitleLabel)
            promoteContainerView.addContraintsWithFormat(format: "V:|[v0(40)]-8-[v1(85)][v2(\(rewardsHeight))]", views: promoteTitleLabel, promoteBarContainerView, container)
            
            promoteContainerView.addContraintsWithFormat(format: "H:|-8-[v0]-8-|", views: promoteBarContainerView)
            
            promoteContainerView.addContraintsWithFormat(format: "H:|[v0]|", views: container)
            
        }
    }
    
    let eventResource = EventResource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let lat = currentEvent?.latidute, let long = currentEvent?.longitude {
            setupEventInMapView(lat: Double(lat), long: Double(long))
        }
        
        //TODO: change that!
        artists = currentEvent?.artists
        
    }
    
    override func viewDidLayoutSubviews() {
        if progressBarContainer.frame.width > 0 {
            progressBarContainer.progressBackgroundBarWidthAnchor = progressBarContainer.frame.width
        }
    }
    
    let scrollContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    let eventImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .red
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "event")
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let eventInfoContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let eventNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 2
        label.textColor = UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0)
        label.text = "Seepark 6 | Süddeutschlands größte Mallorca-Party"
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "01/09/2017"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        return label
    }()
    
    let genreLabel: UILabel = {
        let label = UILabel()
        label.text = "Theatre"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Cologne, Germany"
        label.textColor = UIColor(red:0.33, green:0.33, blue:0.33, alpha:1.0)
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let eventDesriptionHeadlineLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0)
        label.text = "Event Description"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 5
        label.font = UIFont.systemFont(ofSize: 14)
        label.lineBreakMode = .byTruncatingTail
        label.text = "Ein Herrensitz in Cornwall: Nicolas Conman, Selfmademillionär und Oberhaupt eines neureichen Familienclans, feiert seinen 60. Geburtstag. Da er dem Tod geweiht ist, kommen noch mehr Erbschleicher als üblich. Seine Angehörigen zermürbt das alljährliche Possenspiel. Die Rangelei um Nicolas' Gunst und Habe schürt Heimlichkeiten, Intrigen, Lügen und Verrat. Doch dieses Jahr hat die Familie noch ganz andere Sorgen. Denn wie es aussieht, geht einer von ihnen über Leichen und versetzt die Teegesellschaft in Angst und Schrecken…"
        return label
    }()
    
    let moreDescriptionButton: UIButton = {
        let button = UIButton()
        button.setTitle("show more", for: .normal)
        button.addTarget(self, action: #selector(handleShowEventDescription), for: .touchUpInside)
        button.setTitleColor(UIColor(red:0.72, green:0.55, blue:0.99, alpha:1.0), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //PromoteContainer
    
    let promoteContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let promoteTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0)
        label.text = "Rewards"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let promoteBarContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var progressBarContainer: ProgressBarContainer = {
        let container = ProgressBarContainer()
        guard let event = self.currentEvent else {
            return container
        }
        container.event = event
        container.shouldTrianglesShowUp = true
        return container
    }()
    
    let soldTicketsLabel: UILabel = {
        let label = UILabel()
        label.text = "12"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(red:0.25, green:0.89, blue:0.56, alpha:1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //Artist Line Up Container
    
    let artistLineUpContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    //TODO: Change Line Up Headline Label Color + Size
    let seeAllArtistsButton: UIButton = {
        let button = UIButton()
        button.setTitle("show all", for: .normal)
        button.addTarget(self, action: #selector(handleShowArtists), for: .touchUpInside)
        button.setTitleColor(UIColor(red:0.72, green:0.55, blue:0.99, alpha:1.0), for: .normal)
        return button
    }()
    
    //Map View
    
    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.delegate = self
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    //Facebook Container
    lazy var facebookContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleShowFacebookPage)))
        view.backgroundColor = .white
        return view
    }()
    
    let facebookImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .blue
        iv.image = UIImage(named: "facebook_blue")
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let facebookLabel: UILabel = {
        let label = UILabel()
        label.text = "See this Event on Facebook"
        label.textColor = UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0)
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    //Bottom Container
    
    let promoteFixedContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red:0.21, green:0.25, blue:0.28, alpha:1.0)
        return view
    }()
    
    let promoteEventNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 2
        label.textColor = .white
        label.text = "Seepark 6 | Süddeutschlands größte Mallorca-Party"
        return label
    }()
    
    let promoteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red:0.00, green:0.75, blue:0.95, alpha:1.0)
        button.setTitle("Promote", for: .normal)
        button.addTarget(self, action: #selector(handleShowPromoteController), for: .touchUpInside)
        button.tintColor = UIColor.white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func handleShowEventDescription() {
        let eventDescriptionController = EventDescriptionController()
        
        guard let event = currentEvent else {
            return
        }
        eventDescriptionController.currentEvent = event
        
        show(eventDescriptionController, sender: self)
    }
    
    func handleShowArtists() {
        
        let allArtistsForEventController = AllArtistsForEventController()
        guard let artists = currentEvent?.artists else {
            return
        }
        allArtistsForEventController.artists = artists
        
        show(allArtistsForEventController, sender: self)
        
    }
    
    func handleShowPromoteController() {
        
        let promoteViewController = UINavigationController(rootViewController: DetailPromoteEventController())
        
        present(promoteViewController, animated: true, completion: nil)
        
    }
    
    func handleShowFacebookPage() {
        
        guard let eventFacebookUrl = currentEvent?.facebookPageLink else {
            print("keine facebook url vorhanden")
            return
        }
        
        guard let url = URL(string: eventFacebookUrl) else {
            return
        }
        
        UIApplication.shared.openURL(url)
    }
    
}







