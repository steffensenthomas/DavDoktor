//
//  NewMessageViewController.swift
//  DavDoktor
//
//  Created by Thomas Thisgaard Steffensen on 09/08/2020.
//  Copyright © 2020 Thomas Thisgaard Steffensen. All rights reserved.
//

import UIKit

protocol NewMessageViewControllerDelegate {
    func addMessage(content:String)
}

class NewMessageViewController: UIViewController {
    var delegate: NewMessageViewControllerDelegate?
    @IBOutlet weak var newMessageTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func createMessagePressed(_ sender: Any) {
        if self.delegate != nil {
            self.delegate!.addMessage(content: self.newMessageTextView.text)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
}
