//
//  MessagesTableViewController.swift
//  DavDoktor
//
//  Created by Thomas Thisgaard Steffensen on 09/08/2020.
//  Copyright © 2020 Thomas Thisgaard Steffensen. All rights reserved.
//

import UIKit

class MessagesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var conversation: Conversation? = nil
    var currentUser: User? = nil
    let messageCellIdentifier = "messageCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
}
