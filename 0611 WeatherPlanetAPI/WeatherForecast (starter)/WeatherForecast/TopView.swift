//
//  TopView.swift
//  WeatherForecast
//
//  Created by Daisy on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class TopView: UIView {
    
    let locationLabel = UILabel()
    let timeNow = UILabel()
    let refreshButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("↻", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addsubView()
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addsubView() {
        addSubview(locationLabel)
        addSubview(timeNow)
        addSubview(refreshButton)
    
    }
    
    override func layoutSubviews() {
        print("layoutSubviews", frame.width)
        locationLabel.center.x = center.x
        timeNow.center.x = center.x
        
        print("frame",frame)
        print("center", center)
        
    }
    
    private func configure() {
        
        locationLabel.text = "여기에 장소 들어올꺼야"
        locationLabel.frame = CGRect(x: 0 , y: 0, width: 200, height: 50)
        locationLabel.center.y = self.frame.height + 20
        
        
        locationLabel.textAlignment = .center
        
        timeNow.text = "파리의 시간을 살아가는중"
        timeNow.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        timeNow.textAlignment = .center
        timeNow.center.y = self.frame.height + 42
        
        refreshButton.addTarget(self, action: #selector(didtapButton(_:)), for: .touchUpInside)
        refreshButton.center.x = frame.width/2
        print(refreshButton.frame)
        refreshButton.frame =  CGRect(x: 0, y: 0, width: 200, height: 50)
    
        autolayouts()
    }
    
    private func autolayouts() {
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        let guide = self.safeAreaLayoutGuide
        refreshButton.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        refreshButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        refreshButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        refreshButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    @objc func didtapButton(_ sender: UIButton) {
        print("Button tapped")
    }
    
    
}
