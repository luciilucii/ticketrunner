//
//  WelcomeStatisticsCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 20.12.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class WelcomeStatisticsCell: TableCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    static let welcomeCellLoadedString = "welcomeCellLoaded"
    
    var delegate: StatisticsCellDelegate?
    
    let cellId = "cellId"
    let statisticsId = "statisticsId"
    
    var homeView: UIView? {
        didSet {
            if UserDefaults.standard.bool(forKey: WelcomeStatisticsCell.welcomeCellLoadedString) == true {
                return
            }
            
            setupAllViews()
            UserDefaults.standard.set(true, forKey: WelcomeStatisticsCell.welcomeCellLoadedString)
        }
    }
    
    let backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .brown
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "Crowd")
        return iv
    }()
    
    let profileImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .white
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "profile_avatar")
        iv.layer.zPosition = 1
        return iv
    }()
    
    let profileImageBackgroundOne: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.1
        return view
    }()
    
    let profileImageBackgroundTwo: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.1
        return view
    }()
    
    let nameLabel: H1 = {
        let label = H1()
        label.text = """
        Hello Jake!
        Awesome you're back
        """
        label.numberOfLines = 2
        label.textColor = .white
        return label
    }()
    
    let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorCodes.lightGrayText
        return view
    }()
    
    override func setupViews() {
        
    }
    
    fileprivate func setupAllViews() {
        addSubview(backgroundImageView)
        if #available(iOS 11.0, *) {
            backgroundImageView.anchor(top: homeView?.safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: topAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: -275, paddingRight: 0, width: 0, height: 0)
        } else {
            // Fallback on earlier versions
        }
        
        
        if #available(iOS 10.0, *) {
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            //            blurEffectView.alpha = 0.75
            blurEffectView.frame = backgroundImageView.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            backgroundImageView.addSubview(blurEffectView)
        } else {
            // Fallback on earlier versions
        }
        
        
        backgroundImageView.addSubview(profileImageView)
        profileImageView.anchor(top: backgroundImageView.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 32, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        profileImageView.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor).isActive = true
        profileImageView.layer.cornerRadius = 50
        
        
        backgroundImageView.addSubview(profileImageBackgroundOne)
        profileImageBackgroundOne.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 120, height: 120)
        profileImageBackgroundOne.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor).isActive = true
        profileImageBackgroundOne.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        profileImageBackgroundOne.layer.cornerRadius = 60
        
        backgroundImageView.addSubview(profileImageBackgroundTwo)
        profileImageBackgroundTwo.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 140, height: 140)
        profileImageBackgroundTwo.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor).isActive = true
        profileImageBackgroundTwo.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        profileImageBackgroundTwo.layer.cornerRadius = 70
        
        
        backgroundImageView.addSubview(nameLabel)
        nameLabel.anchor(top: profileImageView.bottomAnchor, left: backgroundImageView.leftAnchor, bottom: nil, right: backgroundImageView.rightAnchor, paddingTop: 32, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 60)
        
        
        addSubview(shadowView)
        addSubview(view)
        shadowView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 243, paddingLeft: 8, paddingBottom: 4, paddingRight: 8, width: 0, height: 0)
        view.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 243, paddingLeft: 8, paddingBottom: 4, paddingRight: 8, width: 0, height: 0)
        
        shadowView.layer.shadowOpacity = 0.4
        shadowView.layer.shadowOffset = CGSize(width: 3.0, height: 2.0)
        shadowView.layer.shadowColor = UIColor.darkGray.cgColor
        shadowView.layer.shadowRadius = 5.0
        
        setupCollectionView()
        setupCurrentPointLabel()
        
        setupStatisticViews()
        
        _ = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(handleStartStatisticsCV), userInfo: nil, repeats: false)
        
        self.ticketLabelState = .plus
    }
    
    lazy var downButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "down_button").withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = ColorCodes.inactiveElementsGrey
        button.addTarget(self, action: #selector(handleDownUp), for: .touchUpInside)
        return button
    }()
    
    var downButtonState: ButtonState = .up
    
    @objc func handleDownUp() {
        if downButtonState == .up {
            self.downButtonState = .down
            delegate?.handleUpDown(buttonState: .down)
            
            UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.downButton.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                self.layoutIfNeeded()
            }, completion: { (completed) in
                //completion
            })
        } else {
            self.downButtonState = .up
            delegate?.handleUpDown(buttonState: .up)
            
            UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.downButton.transform = CGAffineTransform(rotationAngle: CGFloat(0))
                self.layoutIfNeeded()
            }, completion: { (completed) in
                //completion
            })
        }
    }
    
    let ticketsTitleLabel: NormalTextLabel = {
        let label = NormalTextLabel()
        label.text = "You have earned"
        label.textAlignment = .right
        label.font = UIFont.sourceSansPro(ofSize: 19)
        return label
    }()
    
    lazy var ticketsSoldLabel: CountingLabel = {
        let label = CountingLabel()
        label.textAlignment = .center
        label.text = "1.728°"
        label.textColor = ColorCodes.textColorGrey
        label.font = UIFont.boldSourceSansPro(ofSize: 21)
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapPointsLabel)))
        return label
    }()
    
    let plusTicketsLabel: CountingLabel = {
        let label = CountingLabel()
        label.text = "+5"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSourceSansPro(ofSize: 16)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 9
        label.backgroundColor = ColorCodes.ticketrunnerGreen
        return label
    }()
    
    lazy var menuBarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.alwaysBounceHorizontal = false
        return cv
    }()
    
    lazy var statisticCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.isScrollEnabled = false
        return cv
    }()
    
    let horizontalBarView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        
        let barView = UIView()
        barView.backgroundColor = ColorCodes.darkPurple
        
        view.addSubview(barView)
        
        barView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0)
        barView.layer.cornerRadius = 2
        
        return view
    }()
    
    var horizontalBarViewLeftAnchor: NSLayoutConstraint?
    
    fileprivate func setupStatisticViews() {
        
        view.addSubview(downButton)
        view.addSubview(plusTicketsLabel)
        view.addSubview(ticketsSoldLabel)
        view.addSubview(ticketsTitleLabel)
        
        downButton.anchor(top: nil, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 12, width: 25, height: 25)
        downButton.centerYAnchor.constraint(equalTo: ticketsSoldLabel.centerYAnchor).isActive = true
        
        plusTicketsLabel.anchor(top: view.topAnchor, left: nil, bottom: nil, right: downButton.leftAnchor, paddingTop: 28, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 18)
        
        ticketsSoldLabel.anchor(top: view.topAnchor, left: nil, bottom: nil, right: plusTicketsLabel.leftAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 4, width: 0, height: 58)
        
        ticketsTitleLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: ticketsSoldLabel.leftAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 58)
        
        view.addSubview(seperatorView)
        seperatorView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 74, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5)
        
        view.addSubview(menuBarCollectionView)
        view.addSubview(statisticCollectionView)
        
        menuBarCollectionView.anchor(top: seperatorView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 25)
        
        //TODO: collectionviewheight should be calculated through number of events
        statisticCollectionView.anchor(top: menuBarCollectionView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 264)
        
        
        
        _ = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(setupHorizontalBar), userInfo: nil, repeats: false)
        
    }
    
    @objc private func setupHorizontalBar() {
        view.addSubview(horizontalBarView)
        
        horizontalBarView.anchor(top: nil, left: nil, bottom: menuBarCollectionView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: -4, paddingRight: 0, width: (view.frame.width / 4), height: 4)
        
        horizontalBarView.widthAnchor.constraint(equalTo: menuBarCollectionView.widthAnchor, multiplier: 1/4)
        
        horizontalBarViewLeftAnchor = horizontalBarView.leftAnchor.constraint(equalTo: menuBarCollectionView.leftAnchor, constant: (menuBarCollectionView.frame.width / 4) * 2)
        horizontalBarViewLeftAnchor?.isActive = true
    }
    
    fileprivate func setupCurrentPointLabel() {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = NSLocale.current
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.groupingSeparator = "."
        guard let formattedNumber = numberFormatter.string(from: NSNumber(value: currentTicketPoints)) else { return }
        
        let ticketsSoldLabelText = "\(formattedNumber)°"
        ticketsSoldLabel.text = ticketsSoldLabelText
        
        let width = estimateFrameForText(text: ticketsSoldLabelText, font: ticketsSoldLabel.font).width
        ticketsSoldLabelWidthAnchor = ticketsSoldLabel.widthAnchor.constraint(equalToConstant: width + 25)
        ticketsSoldLabelWidthAnchor?.isActive = true
        
        let plusText = "+\(plusInt)"
        plusTicketsLabel.text = plusText
        let plusWidth = estimateFrameForText(text: plusText, font: plusTicketsLabel.font).width + 18
        plusTicketLabelWidthAnchor = plusTicketsLabel.widthAnchor.constraint(equalToConstant: plusWidth)
        plusTicketLabelWidthAnchor?.isActive = true
    }
    
    private func estimateFrameForText(text: String, font: UIFont) -> CGRect {
        let size = CGSize(width: 200, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedStringKey.font: font], context: nil)
    }
    
    var plusInt = 150
    var currentTicketPoints = 1725
    
    var ticketLabelState: TicketLabelState? {
        didSet {
            _ = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(handleAnimatePointsLabel), userInfo: nil, repeats: false)
        }
    }
    
    @objc func handleAnimatePointsLabel() {
        ticketsSoldLabel.count(fromValue: Float(currentTicketPoints), to: Float(plusInt + currentTicketPoints), withDuration: 3, animationType: .EaseOut, counterType: .TicketPoints)
        
        plusTicketsLabel.count(fromValue: Float(plusInt), to: 0, withDuration: 3, animationType: .EaseOut, counterType: .Int)
        
        _ = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(deletePlusLabel), userInfo: nil, repeats: false)
    }
    
    @objc func handleStartStatisticsCV() {
        let selectedIndexPath = IndexPath(item: 2, section: 0)
        menuBarCollectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .top)
        statisticCollectionView.scrollToItem(at: selectedIndexPath, at: [], animated: true)
    }
    
    @objc func deletePlusLabel() {
        plusTicketsLabel.isHidden = true
        ticketsSoldLabel.textColor = ColorCodes.ticketrunnerGreen
    }
    
    var ticketsSoldLabelWidthAnchor: NSLayoutConstraint?
    var plusTicketLabelWidthAnchor: NSLayoutConstraint?
    
    func setupCollectionView() {
        menuBarCollectionView.register(StatisticsTitleCell.self, forCellWithReuseIdentifier: cellId)
        menuBarCollectionView.backgroundColor = .white
        
        statisticCollectionView.register(StatisticsScrollCell.self, forCellWithReuseIdentifier: statisticsId)
        statisticCollectionView.backgroundColor = .white
    }
    
    @objc func handleTapPointsLabel() {
        let controller = UIViewController()
        controller.view.backgroundColor = ColorCodes.controllerBackground
        controller.setupWhiteTitle(title: "Points")
        
//        self.homeController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case menuBarCollectionView:
            return 4
        case statisticCollectionView:
            //TODO: return number of current events in homecontroller
            return 4
        default:
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case menuBarCollectionView:
            let width = menuBarCollectionView.frame.width / 4
            let height = menuBarCollectionView.frame.height
            
            return CGSize(width: width, height: height)
        case statisticCollectionView:
            let width = statisticCollectionView.frame.width
            let height = statisticCollectionView.frame.height
            
            return CGSize(width: width, height: height)
        default:
            return CGSize(width: 30, height: 30)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case menuBarCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! StatisticsTitleCell
            
            switch (indexPath.item) {
            case 0:
                cell.titleLabel.text = "Today"
            case 1:
                cell.titleLabel.text = "Last Week"
            case 2:
                cell.titleLabel.text = "Last Month"
            case 3:
                cell.titleLabel.text = "Last Year"
            default:
                break
            }
            return cell
        case statisticCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: statisticsId, for: indexPath) as! StatisticsScrollCell
            
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
            
            cell.backgroundColor = .blue
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case menuBarCollectionView:
            statisticCollectionView.scrollToItem(at: indexPath, at: [], animated: true)
            
            changeHorizontalBarView(selectedIndexPath: indexPath)
        default:
            return
        }
    }
    
    fileprivate func changeHorizontalBarView(selectedIndexPath: IndexPath) {
        let selectedInt = selectedIndexPath.item
        horizontalBarViewLeftAnchor?.constant = CGFloat(selectedInt) * (menuBarCollectionView.frame.width / 4)
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
        
    }
    
}












