//
//  ChatMessageTableViewCell.swift
//  ChatInterface
//
//  Created by David Ilenwabor on 30/04/2019.
//  Copyright © 2019 Davidemi. All rights reserved.
//

import UIKit

class ChatMessageTableViewCell: UITableViewCell {

 
    @IBOutlet weak var backGToViewLeading: NSLayoutConstraint!
    @IBOutlet weak var chatMessageLabel: UILabel!
    @IBOutlet weak var chatBackgroundView: UIView!
    @IBOutlet weak var chatTimeLabel: UILabel!
    @IBOutlet weak var timeLeadtoBackGtrail: NSLayoutConstraint!
    var labelLeadingConstraint: NSLayoutConstraint!
    var labelTrailingConstraint: NSLayoutConstraint!
    var timeOutgoingTrailing : NSLayoutConstraint!
    var chatBackGroundOutgoingTrailing : NSLayoutConstraint!
    
    class var nib : UINib{
        return UINib(nibName: "ChatMessageTableViewCell", bundle: Bundle.main)
    }
    
    var isIncoming : Bool!{
        didSet{
            
            chatBackgroundView.backgroundColor = isIncoming ? .white : .darkGray
            chatMessageLabel.textColor = isIncoming ? .black : .white
            
            if isIncoming{
//
                timeLeadtoBackGtrail.priority = .defaultHigh
                backGToViewLeading.priority = .defaultHigh
                timeOutgoingTrailing.isActive = false
                chatBackGroundOutgoingTrailing.isActive = false
            } else{
//
                chatBackGroundOutgoingTrailing.isActive = true
                timeOutgoingTrailing.isActive = true
                timeLeadtoBackGtrail.priority = .defaultLow
                backGToViewLeading.priority = .defaultLow
              
                
            }

        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        chatBackGroundOutgoingTrailing = chatBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        timeOutgoingTrailing = chatTimeLabel.trailingAnchor.constraint(equalTo: chatBackgroundView.leadingAnchor, constant: -8)
        
        chatBackgroundView.layer.cornerRadius = 12
        
        
        
        chatMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        chatTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        chatBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    override func needsUpdateConstraints() -> Bool {
        return true
    }
}


struct ChatMessage {
    let textMessage : String
    let isIncoming : Bool
}
