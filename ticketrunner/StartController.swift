//
//  StartController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 11.06.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import MediaPlayer

class StartController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var cellId = "cellId"
    
    var homeController: HomeController?
    
    var player: AVPlayer?
    
    let shortHeadlineTitles = ["", "Sign Up", "Share your Ticketrunner Link", "Keep Promoting", "Join us now"]
    let firstHeadlineTextArray = ["Promote your favorite events", "", "", "", ""]
    let firstSubHeadlineTextArray = ["Join your favorite event as a Ticketrunner and receive Free Tickets, Merch and exclusive Experiences money can't buy.", "", "", "", ""]
    let loginGuideImages = [UIImage(named: "transparent"), UIImage(named: "sign-up1-new"), UIImage(named: "sign-up2-new"), UIImage(named: "sign-up3-new"), UIImage(named: "teamticket-double")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        setupViews()
        setupCollectionView()
        
        setupBackgroundVideo()
    }
    
    func handleStoreSessionKey() {
        
        //MARK: Nur ein test
        let sessionKeyExample = NSUUID().uuidString
        UserDefaults.standard.setValue(sessionKeyExample, forKey: "sessionKey")
        
    }
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let dancingLogoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ticketrunner_logo_short")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let signUpButton: TicketrunnerGreenButton = {
        let button = TicketrunnerGreenButton(title: "Sign Up")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showRegisterController), for: .touchUpInside)
        return button
    }()
    
    let loginButton: TicketrunnerBlueButton = {
        let button = TicketrunnerBlueButton(title: "Login")
        button.addTarget(self, action: #selector(showLoginController), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "logo-ticketrunner")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = .lightGray
        pc.currentPageIndicatorTintColor = UIColor(red:0.00, green:0.74, blue:1.00, alpha:1.0)
        pc.numberOfPages = 5
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()
    
    func showLoginController() {
        let userLoginController = UserLoginController()
        userLoginController.startController = self
        userLoginController.homeController = homeController
        present(userLoginController, animated: true) { 
            UIApplication.shared.statusBarStyle = .default
        }
    }
    
    func showRegisterController() {
        let userRegisterController = UserRegistrationController()
        userRegisterController.startController = self
        userRegisterController.homeController = homeController
        present(userRegisterController, animated: true) {
            UIApplication.shared.statusBarStyle = .default
        }
    }
    
    var logoImageWidthAnchor: NSLayoutConstraint?
    var logoImageTopAnchor: NSLayoutConstraint?
    
    var dancingLogoXAnchor: NSLayoutConstraint?
    var dancingLogoTopAnchor: NSLayoutConstraint?
    var dancingLogoWidthAnchor: NSLayoutConstraint?
    var dancingLogoHeightAnchor: NSLayoutConstraint?
    
    func setupViews() {
        view.addSubview(signUpButton)
        view.addSubview(loginButton)
        view.addSubview(logoImageView)
        view.addSubview(dancingLogoImage)
        view.addSubview(pageControl)
        
        //x,y,w,h
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        logoImageTopAnchor = logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80)
        logoImageTopAnchor?.isActive = true
        
        logoImageWidthAnchor = logoImageView.widthAnchor.constraint(equalToConstant: view.frame.width - 120)
        logoImageWidthAnchor?.isActive = true
        
        logoImageView.heightAnchor.constraint(equalToConstant: 85).isActive = true
        
        //x,y,w,h
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -16).isActive = true
        pageControl.widthAnchor.constraint(equalToConstant: 150).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //x,y,w,h
        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpButton.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -16).isActive = true
        signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //x,y,w,h
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
        loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //x,y,w,h
        // cell with indexPath 1
        
        dancingLogoXAnchor = dancingLogoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        dancingLogoXAnchor?.isActive = true
        
        dancingLogoTopAnchor = dancingLogoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: ((view.frame.height - 298) / 6.64) + 50)
        dancingLogoTopAnchor?.isActive = true
        
        dancingLogoWidthAnchor = dancingLogoImage.widthAnchor.constraint(equalToConstant: 0)
        dancingLogoWidthAnchor?.isActive = true
        
        dancingLogoHeightAnchor = dancingLogoImage.heightAnchor.constraint(equalToConstant: (view.frame.height - 148) / 7.5)
        dancingLogoHeightAnchor?.isActive = true
        
    }
    
    func setupAnimationViews() {
        //TODO: put all animation views in this function
    }
    
    func setupCollectionView() {
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
        collectionView?.register(StartCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.backgroundColor = UIColor.black
        
        collectionView?.contentInset = UIEdgeInsetsMake(0, 0, 148, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 148, 0)
        
        collectionView?.isPagingEnabled = true
        collectionView?.showsHorizontalScrollIndicator = false
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: (view.frame.height - 148))
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        logoImageWidthAnchor?.constant = ((-1.1 * scrollView.contentOffset.x) + (view.frame.width - 120))
        
        //TODO: Logimage dancing around
        setupDancingLogo(scrollView: scrollView)
        
    }
    
    func setupDancingLogo(scrollView: UIScrollView) {
        if scrollView.contentOffset.x <= view.frame.width + 20 {
            
            dancingLogoImage.alpha = (scrollView.contentOffset.x / view.frame.width) * 2 - 1
            
            dancingLogoWidthAnchor?.constant = ((scrollView.contentOffset.x / view.frame.width) * ((view.frame.height - 148) / 7.5))
            
        } else if scrollView.contentOffset.x <= (view.frame.width * 2) {
            
            dancingLogoXAnchor?.constant = ((scrollView.contentOffset.x - view.frame.width) / view.frame.width) * (-view.frame.width / 3.5)
            
            dancingLogoTopAnchor?.constant = ((view.frame.height - 298) / (((scrollView.contentOffset.x - view.frame.width) / view.frame.width) * (-4.68) + 6.64) + 50)
            
            dancingLogoWidthAnchor?.constant = (view.frame.height - 148) / (((scrollView.contentOffset.x - view.frame.width) / view.frame.width) * 3.5 + 7.5)
            dancingLogoHeightAnchor?.constant = (view.frame.height - 148) / (((scrollView.contentOffset.x - view.frame.width) / view.frame.width) * 3.5 + 7.5)
            
            
            
        } else if scrollView.contentOffset.x <= (view.frame.width * 3) {
            
            let zeroToOne = (scrollView.contentOffset.x - view.frame.width * 2) / view.frame.width
            let xAnchorStartPoint = (view.frame.width / view.frame.width) * (-view.frame.width / 3.5)
            let differenceBetweenAnchors = view.frame.width / 34.5 - xAnchorStartPoint
            let xAnchorPoint = xAnchorStartPoint + (zeroToOne * differenceBetweenAnchors)
            
            dancingLogoXAnchor?.constant = xAnchorPoint
            dancingLogoWidthAnchor?.constant = (view.frame.height - 148) / (zeroToOne * 14 + 11)
            dancingLogoHeightAnchor?.constant = (view.frame.height - 148) / (zeroToOne * 14 + 11)
            
        } else if scrollView.contentOffset.x <= (view.frame.width * 4) {
            
            let zeroToOne = (scrollView.contentOffset.x - view.frame.width * 3) / view.frame.width
            let oneToZero = 1 - zeroToOne
            
            dancingLogoXAnchor?.constant = view.frame.width / ((oneToZero * CGFloat(34.5)) + (zeroToOne * view.frame.width))
            dancingLogoTopAnchor?.constant = ((view.frame.height - 298) / (0.29 * zeroToOne + 1.96) + 50)
            
            dancingLogoWidthAnchor?.constant = (view.frame.height - 148) / (-17 * zeroToOne + 25)
            dancingLogoHeightAnchor?.constant = (view.frame.height - 148) / (-17 * zeroToOne + 25)
            
        } else {
            let zeroToOne = (scrollView.contentOffset.x - view.frame.width * 4) / view.frame.width
            dancingLogoXAnchor?.constant = -zeroToOne * view.frame.width
            
        }
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = pageNumber
        
    }
    
    
    
    func setupBackgroundVideo() {
        guard let videoUrl = Bundle.main.url(forResource: "neonsplash", withExtension: "mp4") else { return }
        
        player = AVPlayer(url: videoUrl)
        player?.isMuted = true
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        
        playerLayer.frame = view.frame
        
        let videoView = UIView()
        videoView.layer.addSublayer(playerLayer)
        videoView.layer.zPosition = -1
        
        let blackView = UIView()
        blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        blackView.layer.zPosition = 0
        blackView.frame = view.frame
        
        videoView.addSubview(blackView)
        
        collectionView?.backgroundView = videoView
        
        player?.play()
        
        NotificationCenter.default.addObserver(self, selector: #selector(repeatVideo), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
    }
    
    func repeatVideo() {
        self.player?.seek(to: kCMTimeZero)
        self.player?.play()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! StartCell
        
        cell.headlineTextView.text = shortHeadlineTitles[indexPath.item]
        cell.firstCellHeadlineTextView.text = firstHeadlineTextArray[indexPath.item]
        cell.firstCellSubHeadlineTextView.text = firstSubHeadlineTextArray[indexPath.item]
        cell.guideImageView.image = loginGuideImages[indexPath.item]
        
        if indexPath.item == 0 {
            cell.guideImageView.isHidden = true
        } else  {
            cell.guideImageView.isHidden = false
        }
        
        return cell
    }
    
}

