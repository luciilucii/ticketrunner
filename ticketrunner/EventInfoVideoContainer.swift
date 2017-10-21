//
//  EventInfoVideoContainer.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 21.10.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class EventInfoVideoContainer: CustomUIView {
    
    //height is (view.frame.width - 32 / 16 * 9) + 46
    
    var controller: EventInfoController? {
        didSet {
            setupViewsInController()
        }
    }
    
    let videoTitleLabel: H2 = {
        let label = H2()
        label.text = "Video"
        return label
    }()
    
    let videoWebView: UIWebView = {
        let wv = UIWebView()
        wv.scrollView.isScrollEnabled = false
        wv.scrollView.bounces = false
        return wv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        self.layer.cornerRadius = 5
        self.backgroundColor = UIColor.white
        self.clipsToBounds = true
        
        
    }
    
    fileprivate func setupViewsInController() {
        addSubview(videoTitleLabel)
        addSubview(videoWebView)
        
        videoTitleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 30)
        
        guard let controller = controller else { return }
        let height = ((controller.view.frame.width - 32) / 16) * 9
        
        videoWebView.anchor(top: videoTitleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: height)
        
        loadYoutube(videoID: "wpDwgDuoOPU")
    }
    
    func loadYoutube(videoID: String) {
        guard let youtubeUrl = URL(string: "https://www.youtube.com/embed/\(videoID)") else {
            return
        }
        videoWebView.loadRequest(URLRequest(url: youtubeUrl))
    }
    
}










