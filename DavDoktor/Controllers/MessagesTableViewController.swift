//
//  MessagesTableViewController.swift
//  DavDoktor
//
//  Created by Thomas Thisgaard Steffensen on 09/08/2020.
//  Copyright © 2020 Thomas Thisgaard Steffensen. All rights reserved.
//

import UIKit

class MessagesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NewMessageViewControllerDelegate {
    
    var conversation: Conversation? = nil
    var currentUser: User? = nil
    let messageCellIdentifier = "messageCell"
    
    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var closeConversationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    
    // MARK: setup
    
    func setup() {
        self.title = self.conversation?.title
        
        if self.conversation?.status == ConversationStatus.closed.rawValue {
            self.navigationItem.rightBarButtonItem = nil
            self.closeConversationButton.isHidden = true
        }
        
        if self.currentUser?.type == "patient" {
            self.closeConversationButton.isHidden = true
        }
    }
    
    // MARK: Tableview datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.conversation?.messages.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: messageCellIdentifier, for: indexPath) as! MessageTableViewCell
                
        if let message = self.conversation?.messages[indexPath.row] {
            var sender = ""
            if message.senderId == self.currentUser?.id {
                sender = "Mig"
            }
            else {
                if currentUser?.type == "patient" {
                    sender = "Læge"
                }
                else {
                    sender = "Patient"
                }
            }
            
            cell.messageTextView.text = sender + " - " + message.content
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension;

    }
    
    // MARK: NewMessageViewControllerDelegate
    
    func addMessage(content: String) {
        let message = Message(id: "435", senderId: self.currentUser!.id, content: content)
        self.conversation?.messages.append(message)
        self.messageTableView.reloadData()
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationController = segue.destination as! NewMessageViewController
        destinationController.delegate = self
    }
    
    // MARK: IBActions
    
    @IBAction func closeConversationPressed(_ sender: Any) {
        self.conversation?.status = ConversationStatus.closed.rawValue
        self.navigationItem.rightBarButtonItem = nil;
        self.closeConversationButton.isHidden = true
    }
    
}
