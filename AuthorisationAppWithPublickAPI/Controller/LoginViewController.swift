//
//  LoginViewController.swift
//  AuthorisationAppWithPublickAPI
//
//  Created by Andrii Nepodymka on 9/11/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var logButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        password.layer.cornerRadius = password.frame.size.height / 2
        password.addShadow()
        password.attributedPlaceholder = NSAttributedString(string: "Password",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 34/255, green: 87/255, blue: 122/255, alpha: 1)])
        
        
        email.layer.cornerRadius = email.frame.size.height / 2
        email.addShadow()
        email.attributedPlaceholder = NSAttributedString(string: "Email",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 34/255, green: 87/255, blue: 122/255, alpha: 1)])
        
        
        logButton.layer.cornerRadius = logButton.frame.size.height / 2
        logButton.addShadow()
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

extension UIView {
    func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
                   shadowOffset: CGSize = CGSize(width: 1.0, height: 2.0),
                   shadowOpacity: Float = 0.4,
                   shadowRadius: CGFloat = 3.0) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.masksToBounds = false
    }
}
