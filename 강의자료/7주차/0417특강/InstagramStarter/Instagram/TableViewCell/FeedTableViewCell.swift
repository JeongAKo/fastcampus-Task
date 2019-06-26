//
//  FeedTableViewCell.swift
//  Instagram
//
//  Created by Daisy on 17/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var feedImage: UIImageView!
    
    
    var model: FeedData!{
        didSet{
            profileImageView.image = UIImage(named: self.model.profileImage!)
            nickName.text = self.model.nickName
            feedImage.image = UIImage(named: self.model.feedImage!)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        feedImage.image = UIImage(named: AppImageData.profile + "\(1)")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func likeDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    
}
