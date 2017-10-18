//
//  EventDescriptionController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 31.05.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class EventDescriptionController: UIViewController {
    
    var currentEvent: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.shouldRotate = true
        
        setupViews()
        
        
        view.backgroundColor = UIColor.white
        
        //Load the right Video
        loadYoutube(videoID: "wpDwgDuoOPU")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.shouldRotate = false
        
    }
    
    let descriptionTextView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.isEditable = false
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.text = "Ein Herrensitz in Cornwall: Nicolas Conman, Selfmademillionär und Oberhaupt eines neureichen Familienclans, feiert seinen 60. Geburtstag. Da er dem Tod geweiht ist, kommen noch mehr Erbschleicher als üblich. Seine Angehörigen zermürbt das alljährliche Possenspiel. Die Rangelei um Nicolas' Gunst und Habe schürt Heimlichkeiten, Intrigen, Lügen und Verrat. Doch dieses Jahr hat die Familie noch ganz andere Sorgen. Denn wie es aussieht, geht einer von ihnen über Leichen und versetzt die Teegesellschaft in Angst und Schrecken…"
        return tv
    }()
    
    let youtubeVideoWebView: UIWebView = {
        let wv = UIWebView()
        wv.translatesAutoresizingMaskIntoConstraints = false
        wv.scrollView.isScrollEnabled = false
        wv.scrollView.bounces = false
        return wv
    }()
    
    func loadYoutube(videoID: String) {
        guard let youtubeUrl = URL(string: "https://www.youtube.com/embed/\(videoID)") else {
            return
        }
        youtubeVideoWebView.loadRequest(URLRequest(url: youtubeUrl))
        
    }
    
    func setupViews() {
        view.addSubview(descriptionTextView)
        view.addSubview(youtubeVideoWebView)
        
        let height = view.frame.width / 16 * 9
        
        //x,y,w,h
        youtubeVideoWebView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        youtubeVideoWebView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        youtubeVideoWebView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        youtubeVideoWebView.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        
        //x,y,w,h
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 4).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -4).isActive = true
        descriptionTextView.topAnchor.constraint(equalTo: youtubeVideoWebView.bottomAnchor, constant: 4).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
}
