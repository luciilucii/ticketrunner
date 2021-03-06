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
    
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func dropShadow(scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 1
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func applyGradient(colours: [CGColor]) -> Void {
        self.applyGradient(colours: colours, locations: [0.0, 1.0])
    }
    
    func applyGradient(colours: [CGColor], locations: [NSNumber]?) -> Void {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = colours
        gradient.locations = locations
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        layer.insertSublayer(gradient, at: 0)
    }
    
    func setupShadows() {
        self.clipsToBounds = false
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 3.0, height: 2.0)
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowRadius = 5.0
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround(views: [UIView]) {
        
        for eachView in views {
            eachView.addGestureRecognizer(setupGestureRecognizer())
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setupGestureRecognizer() -> UITapGestureRecognizer {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        return tap
    }
    
    func setupShadowToNavigationBar() {
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.8
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 6)
        self.navigationController?.navigationBar.layer.shadowRadius = 3
    }
    
    func setupWhiteTitle(title: String) {
        let textAttributes = [NSAttributedStringKey.foregroundColor: ColorCodes.textColorGrey /*UIColor.white*/, NSAttributedStringKey.font: UIFont.boldSourceSansPro(ofSize: 20)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        navigationItem.title = title
    }
    
    func setupModalCancelButton() {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "cancel").withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = UIColor.white
        button.addTarget(self, action: #selector(handleCancelController), for: .touchUpInside)
        
        view.addSubview(button)
        button.anchor(top: view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 44, height: 44)
        
    }
    
    @objc func handleCancelController() {
        dismiss(animated: true, completion: nil)
    }
    
    public func setupBellButton() {
        let bellButton = UIBarButtonItem(image: #imageLiteral(resourceName: "bell_icon").withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleBell))
        bellButton.tintColor = UIColor.black
        
        self.navigationItem.rightBarButtonItem = bellButton
    }
    
    @objc func handleBell() {
        print("bell")
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
    
    func getHeight(rewardContainer: EventRewardsContainer, lineUpContainer: ArtistLineUpContainer) -> CGFloat {
        let basis: CGFloat = 734
        let lineUpHeight = lineUpContainer.getHeight()
        let rewardHeight = rewardContainer.getHeight()
        let height = basis + lineUpHeight + rewardHeight + 8 + 119
        return height
    }
    
}









