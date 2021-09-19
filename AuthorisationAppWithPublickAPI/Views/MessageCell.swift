//
//  MessageCell.swift
//  AuthorisationAppWithPublickAPI
//
//  Created by Andrii Nepodymka on 9/14/21.
//

import UIKit

class MessageCell: UITableViewCell {
    
    
    @IBOutlet weak var messageBuble: UIView!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var leftImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        messageBuble.layer.cornerRadius = messageBuble.frame.size.height / 2
        messageBuble.addShadow()
        
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
}
