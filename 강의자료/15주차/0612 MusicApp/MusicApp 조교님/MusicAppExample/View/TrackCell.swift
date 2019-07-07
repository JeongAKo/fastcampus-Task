//
//  TrackCell.swift
//  URLSessionPractice
//
//  Created by Wi on 10/06/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class TrackCell: UITableViewCell {
    
    // MARK: - Properties
    
    var track: Track? {
        didSet {
            guard let track = self.track else {return}
            self.albumImageView.loadImage(with: track.artworkUrl100)
            self.trackNameLabel.text = track.trackName
            self.artistNameLabel.text = track.artistName
        }
    }
    
    let albumImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "defualtMusicImage")
        return imageView
        }()
    
    let trackNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading.."
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    let artistNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cell")
        
        addSubview(albumImageView)
        albumImageView.anchor(top: topAnchor, left: leadingAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 80, height: 80)
        
        addSubview(trackNameLabel)
        trackNameLabel.anchor(top: nil, left: albumImageView.trailingAnchor, bottom: nil, right: trailingAnchor, paddingTop: 0, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        trackNameLabel.centerYAnchor.constraint(equalTo: albumImageView.centerYAnchor,constant: -5).isActive = true
        
        addSubview(artistNameLabel)
        artistNameLabel.anchor(top: trackNameLabel.bottomAnchor, left: albumImageView.trailingAnchor, bottom: nil, right: trailingAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
