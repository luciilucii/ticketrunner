//
//  StatisticsCell.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 11.08.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

enum ButtonState {
    case up
    case down
}

protocol StatisticsCellDelegate {
    func handleUpDown(buttonState: ButtonState)
}

class StatisticsCell: TableCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //Cell height with 2 cells: 187 = 87+cellheight
    
    var delegate: StatisticsCellDelegate?
    
    let cellId = "cellId"
    let statisticsId = "statisticsId"
    
    var downButtonState: ButtonState = .up
    
    let ticketsSoldLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "1728"
        label.textColor = ColorCodes.textColorGrey
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    let plusTicketsLabel: UILabel = {
        let label = UILabel()
        label.text = "+5"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 7
        label.backgroundColor = ColorCodes.ticketrunnerGreen
        return label
    }()
    
    lazy var downButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "down_button").withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = ColorCodes.inactiveElementsGrey
        button.addTarget(self, action: #selector(handleDownUp), for: .touchUpInside)
        return button
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
    
    override func setupViews() {
        super.setupViews()
        
        view.backgroundColor = .white
        
        let ticketsSoldLabelText = "1725"
        ticketsSoldLabel.text = ticketsSoldLabelText
        ticketsSoldLabelWidthAnchor?.constant = estimateFrameForText(text: ticketsSoldLabelText).width
        ticketsSoldLabelWidthAnchor?.isActive = true
        
        setupAnchors()
        
        setupCollectionView()
        
        let selectedIndexPath = IndexPath(item: 2, section: 0)
        menuBarCollectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .top)
        
        _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(handleStartStatisticsCV), userInfo: nil, repeats: false)
        
        
    }
    
    func handleStartStatisticsCV() {
        let selectedIndexPath = IndexPath(item: 2, section: 0)
        statisticCollectionView.scrollToItem(at: selectedIndexPath, at: [], animated: true)
    }
    
    private func estimateFrameForText(text: String) -> CGRect {
        let size = CGSize(width: 200, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 16)], context: nil)
    }
    
    func handleDownUp() {
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
    
    var ticketsSoldLabelWidthAnchor: NSLayoutConstraint?
    
    func setupAnchors() {
        view.addSubview(ticketsSoldLabel)
        view.addSubview(plusTicketsLabel)
        
        view.addSubview(downButton)
        
        view.addSubview(menuBarCollectionView)
        view.addSubview(statisticCollectionView)
        
        ticketsSoldLabel.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 40)
        ticketsSoldLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        plusTicketsLabel.anchor(top: nil, left: ticketsSoldLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 4, paddingBottom: 0, paddingRight: 0, width: 35, height: 14)
        plusTicketsLabel.centerYAnchor.constraint(equalTo: ticketsSoldLabel.centerYAnchor).isActive = true
        
        downButton.anchor(top: nil, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 12, width: 25, height: 25)
        downButton.centerYAnchor.constraint(equalTo: plusTicketsLabel.centerYAnchor).isActive = true
        
        menuBarCollectionView.anchor(top: ticketsSoldLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 25)
        
        //TODO: collectionviewheight should be calculated through number of events
        statisticCollectionView.anchor(top: menuBarCollectionView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 100)
        
    }
    
    func setupCollectionView() {
        menuBarCollectionView.register(StatisticsTitleCell.self, forCellWithReuseIdentifier: cellId)
        menuBarCollectionView.backgroundColor = .white
        
        statisticCollectionView.register(StatisticsScrollCell.self, forCellWithReuseIdentifier: statisticsId)
        statisticCollectionView.backgroundColor = .white
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case menuBarCollectionView:
            return 5
        case statisticCollectionView:
            //TODO: return number of current events in homecontroller
            return 5
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
            let width = menuBarCollectionView.frame.width / 5
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
            case 4:
                cell.titleLabel.text = "Total"
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
            
        default:
            return
        }
        
    }
    
}
