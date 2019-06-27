//
//  FeedTableViewCell.swift
//  Instagram
//
//  Created by Wi on 12/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var feedImageView: UIImageView!
    
    var feedData: FeedData! {
        didSet {
            profileImageView.image = UIImage(named: self.feedData.profileImage!)
            nickNameLabel.text = self.feedData.nickName
            feedImageView.image = UIImage(named: self.feedData.feedImage!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        nickNameLabel.text = "nickName"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func likeButtonDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
        print("like")
    }
    @IBAction func commentButtonDidTap(_ sender: Any) {
        print("comment")
        
        NotificationCenter.default.post(name: NSNotification.Name("CommentTap"), object: nil , userInfo: [ "cell" : self])
        
    }
    
    
}
