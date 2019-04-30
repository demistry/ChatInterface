//
//  ChatMessageTableViewCell.swift
//  ChatInterface
//
//  Created by David Ilenwabor on 30/04/2019.
//  Copyright © 2019 Davidemi. All rights reserved.
//

import UIKit

class ChatMessageTableViewCell: UITableViewCell {

    @IBOutlet weak var chatMessageLabel: UILabel!
    @IBOutlet weak var chatBackgroundView: UIView!
    var labelLeadingConstraint: NSLayoutConstraint!
    var labelTrailingConstraint: NSLayoutConstraint!
    
    class var nib : UINib{
        return UINib(nibName: "ChatMessageTableViewCell", bundle: Bundle.main)
    }
    
    var isIncoming : Bool!{
        didSet{
            
            chatBackgroundView.backgroundColor = isIncoming ? .white : .darkGray
            chatMessageLabel.textColor = isIncoming ? .black : .white
            
            if isIncoming{
                labelLeadingConstraint.isActive = true
                labelTrailingConstraint.isActive = false
            } else{
                labelLeadingConstraint.isActive = false
                labelTrailingConstraint.isActive = true
            }

        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        labelLeadingConstraint.constant = 16
//        labelTrailingConstraint.constant = 16
        labelLeadingConstraint = chatMessageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        labelTrailingConstraint = chatMessageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        chatBackgroundView.layer.cornerRadius = 12
        
        
        
        chatMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        //chatBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    override func needsUpdateConstraints() -> Bool {
        return true
    }
}


struct ChatMessage {
    let textMessage : String
    let isIncoming : Bool
}
