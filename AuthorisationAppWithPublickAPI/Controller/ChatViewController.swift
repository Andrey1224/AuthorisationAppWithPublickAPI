//
//  ViewController.swift
//  AuthorisationAppWithPublickAPI
//
//  Created by Andrii Nepodymka on 9/13/21.
//

import UIKit

import Firebase

import FirebaseFirestore

class ChatViewController: UIViewController {
    
    @IBOutlet weak var sendButton: UIButton!
    
    @IBOutlet weak var chatTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var bottomViewConstraint: NSLayoutConstraint!
    
   
    
    let cellIdetifier = "ReusableCell"
    
    var db = Firestore.firestore()
    
    var messages: [Message] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatTextField.delegate = self
        loadMesseges()
        tableView.dataSource = self
        
        
        title = "Small🗣Chat"
        navigationItem.hidesBackButton = true
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdetifier)
        tableView.backgroundColor = UIColor.init(red: 34/255, green: 87/255, blue: 122/255, alpha: 1)
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil);

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil);
        

    }
    
    

    

    @IBAction func sendButtonPressed(_ sender: Any) {
        if let messageBody = chatTextField.text, let senderr = Auth.auth().currentUser?.email {
            db.collection(FStore.collectionName).addDocument(data: [ FStore.senderField: senderr,
                                                                     FStore.bodyField: messageBody,
                                                                     FStore.dateField: Date()
            ]) { err in
                if let e = err {
                    print("Error adding document: \(e)")
                } else {
                    DispatchQueue.main.async {
                        self.chatTextField.text = ""
                    }
                    self.loadMesseges()
                    
                    print("ALL GOOD")
                }
            }
        }
    }
    
    
    func loadMesseges() {
        
        
        db.collection(FStore.collectionName).order(by: FStore.dateField).addSnapshotListener { QuerySnapshot, error in
            self.messages = []
            if let e = error {
                print(e.localizedDescription)
            } else {
                if let snapshotDoc = QuerySnapshot?.documents {
                    for doc in snapshotDoc {
                        
                        let data = doc.data()
                        if let sender1 = data[FStore.senderField] as? String, let messageBody = data[FStore.bodyField] as? String {
                            let newMessage = Message(sender: sender1, body: messageBody)
                            self.messages.append(newMessage)
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                        }
                        
                    }
                    
                    
                }
                
            }
        }
    }
    
    
    @IBAction func logOutPressed(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.navigationController!.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

//MARK: - UITextFieldDelegate

extension ChatViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        
    }
}


//MARK: - UITableViewDataSource

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdetifier, for: indexPath) as! MessageCell
        cell.label?.text = message.body
        
        if message.sender == Auth.auth().currentUser?.email {
            
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            
        }
        else {
            
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            
        }
        
        return cell
    }
     
}

//MARK: - KeyboardSettings

extension ChatViewController {
    
    @objc func keyboardWillShow(notification: Notification) {

        let keyboardSize = (notification.userInfo?  [UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue

         let keyboardHeight = keyboardSize?.height

        self.bottomViewConstraint.constant = keyboardHeight! - self.view.safeAreaInsets.bottom
        
           UIView.animate(withDuration: 0.5){
               

              self.view.layoutIfNeeded()

           }

       }
    

      @objc func keyboardWillHide(notification: Notification){

          self.bottomViewConstraint.constant =  0
          

           UIView.animate(withDuration: 0.5){

              self.view.layoutIfNeeded()

           }
      }
    
    
}


 

