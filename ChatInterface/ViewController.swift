//
//  ViewController.swift
//  ChatInterface
//
//  Created by David Ilenwabor on 30/04/2019.
//  Copyright © 2019 Davidemi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newMessageTextField: UITextField!
    
    var chatMessages = [ChatMessage(textMessage: "Heyo dawg", isIncoming: true),
                        ChatMessage(textMessage: "This is a very long message that goes to show how to create chat messages on a chat screen,This is a very long message that goes to show how to create chat messages on a chat screen", isIncoming: true),
                        ChatMessage(textMessage: "Heyo dawg", isIncoming: false),
                        ChatMessage(textMessage: "This is a very long message that goes to show how to create chat messages on a chat screen,This is a very long message that goes to show how to create chat messages on a chat screen", isIncoming: false),
                        ChatMessage(textMessage: "Heyo dawg", isIncoming: true),
                        ChatMessage(textMessage: "This is a very long message that goes to show how to create chat messages on a chat screen,This is a very long message that goes to show how to create chat messages on a chat screen", isIncoming: true),
                        ChatMessage(textMessage: "This is a very long message that goes to show how to create chat messages on a chat screen,This is a very long message that goes to show how to create chat messages on a chat screen", isIncoming: true),
                        ChatMessage(textMessage: "This is a very long message that goes to show how to create chat messages on a chat screen,This is a very long message that goes to show how to create chat messages on a chat screen", isIncoming: false),
                        ChatMessage(textMessage: "Heyo dawg", isIncoming: true),
                        ChatMessage(textMessage: "This is a very long message that goes to show how to create chat messages on a chat screen,This is a very long message that goes to show how to create chat messages on a chat screen", isIncoming: true),
                        ChatMessage(textMessage: "This is a very long message that goes to show how to create chat messages on a chat screen,This is a very long message that goes to show how to create chat messages on a chat screen", isIncoming: true),
                        ChatMessage(textMessage: "This is a very long message that goes to show how to create chat messages on a chat screen,This is a very long message that goes to show how to create chat messages on a chat screen", isIncoming: false)]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        newMessageTextField.delegate = self
        
        hideKeyboardWhenTappedAround()
        print(ChatMessageTableViewCell.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(ChatMessageTableViewCell.nib, forCellReuseIdentifier: "ChatMessageTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatMessageTableViewCell", for: indexPath) as! ChatMessageTableViewCell
//        guard let cell = cellOpt else{
//            return UITableViewCell()
//        }

        let message = chatMessages[indexPath.row]
        cell.chatMessageLabel.text = message.textMessage
        cell.isIncoming = message.isIncoming
        return cell
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Text sent")
        chatMessages.append(ChatMessage(textMessage: textField.text!, isIncoming: false))
        tableView.reloadData()
        
    }
    
    @IBAction func sendText(_ sender: UITextField) {
        
    }
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150
//    }
}

extension UIViewController{
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

