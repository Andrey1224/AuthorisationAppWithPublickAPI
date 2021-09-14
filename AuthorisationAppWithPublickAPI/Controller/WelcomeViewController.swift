//
//  ViewController.swift
//  AuthorisationAppWithPublickAPI
//
//  Created by Andrii Nepodymka on 9/11/21.
//

import UIKit
import Firebase



class WelcomeViewController: UIViewController {
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        
        
    }
    
    let titleText = "Small🗣Chat"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = ""
        var indexLetter = 0.0
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * indexLetter , repeats: false) { timer in
                self.titleLabel.text?.append(letter)
            }
            indexLetter += 1
            
        }
        
        loginButton.addShadow()
        loginButton.layer.cornerRadius = loginButton.frame.size.height / 2
        registerButton.addShadow()
        registerButton.layer.cornerRadius = registerButton.frame.size.height / 2
        
    }
    
  
    
    
}


