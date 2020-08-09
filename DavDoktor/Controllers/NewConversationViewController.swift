//
//  NewConversationViewController.swift
//  DavDoktor
//
//  Created by Thomas Thisgaard Steffensen on 09/08/2020.
//  Copyright © 2020 Thomas Thisgaard Steffensen. All rights reserved.
//

import UIKit

protocol NewConversationViewControllerDelegate {
    func addConversation(conversation:Conversation)
}

class NewConversationViewController: UIViewController {
    @IBOutlet weak var newConversationTextField: UITextField!
    var delegate: NewConversationViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createPressed(_ sender: Any) {
        let conversation = Conversation(id: "44", title: self.newConversationTextField.text ?? "Ny samtale")
        
        if delegate != nil {
            delegate!.addConversation(conversation: conversation)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
}
