//
//  ViewController.swift
//  DavDoktor
//
//  Created by Thomas Thisgaard Steffensen on 09/08/2020.
//  Copyright © 2020 Thomas Thisgaard Steffensen. All rights reserved.
//

import UIKit

class MainMenuTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var currentUser: User? = nil
    var users: Array<User> = Array<User>()
    var conversations: Array<Conversation> = Array<Conversation>()
    var menuItems: Array<String> = []
    let networkService = NetworkServiceMock()
    
    let menuCellIdentifier = "menuCell"

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainMenuTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setup()
    }
    
    //MARK: Setup
    func setup() {
        setupUser()
        setupName()
        setupMenu()
    }
    
    func setupUser() {
        networkService.fetchData { result in
            switch result {
                case .success(let data):
                    do {
                        self.users = try JSONDecoder().decode(Array<User>.self, from: data)
                                                
                        self.currentUser = self.users[0]
                    }
                    catch {
                        print("JSON conversion error: ", error)
                    }
                case .failure(let error):
                    print("fetchData error: ", error)
            }
        }
    }
    
    func setupName() {
        self.nameLabel.text = self.currentUser?.name
    }
    
    func setupMenu() {
        if self.currentUser?.type == "patient" {
            self.menuItems = ["Mine læger", "Samtaler", "Min journal"]
        }
        else {
            self.menuItems = ["Mine patienter", "Samtaler", "Journaler", "Medicin"]
        }
        
        self.mainMenuTableView.reloadData()
    }
    
    // MARK: Tableview datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: menuCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = self.menuItems[indexPath.row]
        
        return cell
    }
    
    // MARK: UI actions
    
    @IBAction func toggleUserPressed(_ sender: Any) {
        for user in self.users {
            if self.currentUser?.id != user.id {
                self.currentUser = user
                break
            }
        }
        
        self.setupName()
        self.setupMenu()
    }
}

