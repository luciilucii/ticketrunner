//
//  MessagesController.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 29.05.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class MessagesController: UITableViewController, UISearchBarDelegate, UISearchResultsUpdating {
    
    let cellId = "cellId"
    let newChatId = "newChatId"
    
    var messages = [Message]()
    var messagesDictionary = [String: Message]()
    
    var users = [User(), User(), User(), User(), User()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
        
        setupViews()
        setupWhiteTitle(title: "Messages")
        setupMenuBar()
        setupSearch()
        
        view.backgroundColor = ColorCodes.controllerBackground
        
        tableView.separatorStyle = .none
        tableView.register(MessagesCell.self, forCellReuseIdentifier: cellId)
        tableView.register(NewChatCell.self, forCellReuseIdentifier: newChatId)
    }
    
    func setupMenuBar() {
        let menuButton = UIBarButtonItem(image: UIImage(named: "menu_icon_3")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(handleMenu))
        menuButton.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = menuButton
        
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        if indexPath.item != 0 {
            let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
                let alertController = UIAlertController(title: "Confirm Delete", message: "Do you really want to delete the chat?", preferredStyle: UIAlertControllerStyle.alert)
                let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { UIAlertAction in }
                let deleteAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.destructive) { UIAlertAction in
                    self.users.remove(at: indexPath.item)
                    self.tableView.deleteRows(at: [indexPath], with: .automatic)
                }
                alertController.addAction(deleteAction)
                alertController.addAction(cancel)
                
                self.present(alertController, animated: true, completion: nil)
                
            }
            return [deleteAction]
        } else {
            return []
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.item {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: newChatId, for: indexPath) as! NewChatCell
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MessagesCell
            
            let user = users[indexPath.item - 1]
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showChatControllerForUser()
    }
    
    func showChatControllerForUser(/*user: User*/) {
        let chatLogController = ChatLogController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(chatLogController, animated: true)
    }
    
    var menu: Menu!
    
    @objc func handleMenu() {
        menu.showMenu()
    }
    
    func setupViews() {
        
    }
    
    //MARK: Search Area
    
    var searchBar = UISearchBar()
    var searchBarButtonItem: UIBarButtonItem?
    
    let searchController = UISearchController()
    
    func setupSearch() {
        let searchButton = UIBarButtonItem(image: #imageLiteral(resourceName: "search_icon"), style: .plain, target: self, action: #selector(showSearchBar))
        
        searchBarButtonItem = searchButton
        
        self.navigationItem.rightBarButtonItem = searchBarButtonItem
        
        searchBar.delegate = self
        searchBar.searchBarStyle = UISearchBarStyle.minimal
        searchBar.showsCancelButton = true
        
        let textFieldInSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInSearchBar?.textColor = UIColor.white
    }
    
    @objc func showSearchBar() {
        searchBar.alpha = 0
        
        navigationController?.navigationBar.addSubview(searchBar)
        
        let navBar = navigationController?.navigationBar
        
        searchBar.anchor(top: navBar?.topAnchor, left: navBar?.leftAnchor, bottom: navBar?.bottomAnchor, right: navBar?.rightAnchor, paddingTop: 0, paddingLeft: 65, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        navigationItem.setRightBarButtonItems(nil, animated: true)
        
        UIView.animate(withDuration: 0.5, animations: {
            self.searchBar.alpha = 1
            self.setupWhiteTitle(title: " ")
        }, completion: { finished in
            self.searchBar.becomeFirstResponder()
        })
    }
    
    func hideSearchBar() {
        navigationItem.setRightBarButton(searchBarButtonItem, animated: true)
        
        self.setupWhiteTitle(title: "Messages")
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.searchBar.alpha = 0
            
            self.searchBar.resignFirstResponder()
            
        }, completion: { finished in
            
        })
        searchBar.text = ""
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        hideSearchBar()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        updateSearchResults(for: searchController)
    }
    
    func filterContentFor(searchText: String) {
        
//        filteredInterviews = interviews.filter({ (interview) -> Bool in
//            let searchString = interview.name+interview.quote+interview.mind+interview.body+interview.soul
//
//            return searchString.lowercased().contains(searchText.lowercased())
//        })
        
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.hideSearchBar()
    }
    
    func setupSearchBar() {
        let textFieldInSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInSearchBar?.textColor = UIColor.white
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentFor(searchText: searchBar.text!)
    }
    
}
















