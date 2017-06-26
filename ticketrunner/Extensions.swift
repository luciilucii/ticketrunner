//
//  Extensions.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 28.05.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
}



extension UIView {
    
    func addContraintsWithFormat(format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        for(index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround(views: [UIView]) {
        
        for eachView in views {
            eachView.addGestureRecognizer(setupGestureRecognizer())
        }
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setupGestureRecognizer() -> UITapGestureRecognizer {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        return tap
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func loadEventImageUsingCacheWith(urlString: String) {
        
        self.image = nil
        
        //check cache for image fist
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = cachedImage
            return
        }
        
        
        let url = NSURL(string: urlString)
        URLSession.shared.dataTask(with: url! as URL, completionHandler: { (data, response, error) in
            
            //download hit an error
            if let error = error {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                
                if let downloadedImage = UIImage(data: data!) {
                    imageCache.setObject(downloadedImage, forKey: urlString as AnyObject)
                    
                    self.image = downloadedImage
                }
                
            }
            
        }).resume()
    }
}


extension UICollectionViewController {
    
    func setupDetailController(event: Event) -> DetailEventController {
        
        let detailEventController = DetailEventController()
        detailEventController.currentEvent = event
        
        detailEventController.lineUpContainer = ArtistLineUpContainer()
        
        guard let lineUpHeight = detailEventController.lineUpContainer?.getHeight() else {
            return DetailEventController()
        }
        
        detailEventController.lineUpHeight = lineUpHeight
        
        //set ticketsSoldLabel über der ProgressBar
        detailEventController.soldTicketsLabel.text = "\(detailEventController.progressBarContainer.getTicketsSoldCount())"
        
        guard let event = detailEventController.currentEvent else {
            return DetailEventController()
        }
        guard let rewards = event.rewards else {
            return DetailEventController()
        }
        
        detailEventController.rewards = rewards
        detailEventController.eventRewardsContainer = EventRewardsContainer()
        
        guard let height = detailEventController.eventRewardsContainer?.getHeight() else {
            return DetailEventController()
        }
        
        detailEventController.rewardsHeight = height
        setupScrollViewHeight(detailController: detailEventController, event: event)
        
        return detailEventController
    }
    
    func setupScrollViewHeight(detailController: DetailEventController, event: Event) {
        
        navigationController?.navigationBar.tintColor = UIColor.white
        
        detailController.view.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0)
        
        guard let eventRewardsContainer = detailController.eventRewardsContainer else {
            return
        }
        guard let lineUpContainer = detailController.lineUpContainer else {
            return
        }
        var height: CGFloat = 0
        
        if event.latidute != nil && event.longitude != nil {
            height = getHeight(rewardContainer: eventRewardsContainer, lineUpContainer: lineUpContainer)
        } else {
            height = getHeight(rewardContainer: eventRewardsContainer, lineUpContainer: lineUpContainer) - 258
            detailController.mapViewHeightAnchor?.constant = 0
            detailController.facebookContainerTopAnchorConstant = 0
        }
        
        detailController.setupScrollView(height: height)
        detailController.setupViews()
        
    }
    
    func getHeight(rewardContainer: EventRewardsContainer, lineUpContainer: ArtistLineUpContainer) -> CGFloat {
        
        let basis: CGFloat = 779
        let lineUpHeight = lineUpContainer.getHeight()
        let rewardHeight = rewardContainer.getHeight()
        
        let height = basis + lineUpHeight + rewardHeight + 8 + 119
        
        return height
        
    }
    
    func handlePromoteFor(event: Event) {
        let controller = setupDetailController(event: event)
        
        show(controller, sender: self)
        
        let detailPromoteController = DetailPromoteEventController()
        detailPromoteController.currentEvent = event
        let navigationPromoteController = UINavigationController(rootViewController: detailPromoteController)
        
        controller.present(navigationPromoteController, animated: true, completion: nil)
    }

    func handleRewardsFor(event: Event) {
        let controller = setupDetailController(event: event)
        
        show(controller, sender: self)
        
        controller.scrollView.contentOffset.y = 455
    }
    
    func handleShowEventInfoFor(event: Event) {
        let controller = setupDetailController(event: event)
        
        show(controller, sender: self)
        controller.handleShowEventDescription()
    }
    
}










