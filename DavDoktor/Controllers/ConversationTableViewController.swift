//
//  ConversationTableViewController.swift
//  DavDoktor
//
//  Created by Thomas Thisgaard Steffensen on 09/08/2020.
//  Copyright © 2020 Thomas Thisgaard Steffensen. All rights reserved.
//

import UIKit

class ConversationTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NewConversationViewControllerDelegate {
    
    var conversations: Array<Conversation> = Array<Conversation>()
    var currentUser: User? = nil
    let conversationCellIdentifier = "conversationCell"
    let messagesSegueIdentifier = "messagesSegue"
    let networkService = NetworkServiceMock()
    var selectedConversation: Conversation? = nil

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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedConversation = self.conversations[indexPath.row]
        
        self.performSegue(withIdentifier: messagesSegueIdentifier, sender: self)
    }
    
    // MARK: navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == self.messagesSegueIdentifier {
            let destinationController = segue.destination as! MessagesTableViewController
            destinationController.conversation = self.selectedConversation
            destinationController.currentUser = self.currentUser
        }
        else {
            let destinationController = segue.destination as! NewConversationViewController
            destinationController.delegate = self
            
        }
    }
    
    // MARK: NewConversationViewControllerDelegate
    
    func addConversation(conversation: Conversation) {
        self.conversations.append(conversation)
        self.conversationTableView.reloadData()
    }
}
