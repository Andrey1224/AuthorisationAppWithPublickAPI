//
//  ViewController.swift
//  AuthorisationAppWithPublickAPI
//
//  Created by Andrii Nepodymka on 9/13/21.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    @IBOutlet weak var chatTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdetifier = "MyCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        title = "Small🗣Chat"
        navigationItem.hidesBackButton = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdetifier)
    }
    
    
    
    var chatArray = ["Pizza", "Chiken", "Miami"]
    
    
    
    @IBAction func logOutPressed(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.navigationController!.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        
    }
      
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdetifier, for: indexPath)
        cell.textLabel?.text = chatArray[indexPath.row]
        return cell
    }
    
}
