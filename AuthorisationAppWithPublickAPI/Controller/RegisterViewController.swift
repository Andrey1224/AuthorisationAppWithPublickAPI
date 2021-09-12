//
//  RegisterViewController.swift
//  AuthorisationAppWithPublickAPI
//
//  Created by Andrii Nepodymka on 9/11/21.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        passwordTF.layer.cornerRadius = passwordTF.frame.size.height / 2
        passwordTF.addShadow()
        passwordTF.attributedPlaceholder = NSAttributedString(string: "Password",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 34/255, green: 87/255, blue: 122/255, alpha: 1)])
        
        
        emailTF.layer.cornerRadius = emailTF.frame.size.height / 2
        emailTF.addShadow()
        emailTF.attributedPlaceholder = NSAttributedString(string: "Email",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 34/255, green: 87/255, blue: 122/255, alpha: 1)])
        

        registerButton.layer.cornerRadius = registerButton.frame.size.height / 2
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
