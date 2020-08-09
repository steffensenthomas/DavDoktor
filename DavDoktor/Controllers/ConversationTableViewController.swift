//
//  ConversationTableViewController.swift
//  DavDoktor
//
//  Created by Thomas Thisgaard Steffensen on 09/08/2020.
//  Copyright © 2020 Thomas Thisgaard Steffensen. All rights reserved.
//

import UIKit

class ConversationTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var conversations: Array<Conversation> = Array<Conversation>()
    var currentUser: User? = nil
    let conversationCellIdentifier = "conversationCell"
    let networkService = NetworkServiceMock()

    @IBOutlet weak var conversationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupConversations()
    }
    
    // MARK: Setup
    
    func setupConversations() {
        if self.conversations.count == 0 {
            networkService.fetchConversationData { result in
                switch result {
                    case .success(let data):
                        do {
                            self.conversations = try JSONDecoder().decode(Array<Conversation>.self, from: data)
                        }
                        catch {
                            print("JSON conversion error: ", error)
                        }
                    case .failure(let error):
                        print("fetchData error: ", error)
                }
            }
        }
    }

    // MARK: Tableview datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        conversations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: conversationCellIdentifier, for: indexPath)
        
        let conversation = self.conversations[indexPath.row]
        cell.textLabel?.text = conversation.title
        
        return cell
    }
}
