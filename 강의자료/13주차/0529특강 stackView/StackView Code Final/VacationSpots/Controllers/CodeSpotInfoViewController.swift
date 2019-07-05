//
//  CodeSpotInfoViewController.swift
//  VacationSpots
//
//  Created by Wi on 27/05/2019.
//  Copyright © 2019 Jawwad Ahmad. All rights reserved.
//

import UIKit

class CodeSpotInfoViewController: UIViewController {
    // data
    var vacationSpot: VacationSpot!
    
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print("CodeSpotInfoVC")
        configureViews()
    }
    
    func configureViews(){
        
        let gudie = view.safeAreaLayoutGuide
        // scroll view
        view.addSubview(scrollView)
        
        scrollView.anchor(top: gudie.topAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        // low level stack view
        
        let whyVisitStackView = createStackView(views: createLabels(labelsText: ["WHY VISIT", vacationSpot.whyVisit]), spacing: 0)
        
        let whatToSeeStackView = createStackView(views: createLabels(labelsText: ["WHAT TO SEE", vacationSpot.whatToSee]), spacing: 0)
        
        let weatherStackView = createStackView(views: createLabels(labelsText: ["WHEATHER"]), spacing: 0, axis: .vertical, alignment: .leading)
        let weatherInfoStackView = createStackView(views: [ weatherStackView, createLabels(labelsText: [vacationSpot.weatherInfo])[0]], spacing: 0)
        
        // for hide button
        weatherInfo = weatherInfoStackView.arrangedSubviews[1] as! UILabel
        
        // for rating
        let stars: String = {
            var str = ""
            for _ in 1...self.vacationSpot.userRating{
                str += "★"
            }
           return str
        }()
        
        let ratingStackView = createStackView(views: createLabels(labelsText: ["RATING", stars]), spacing: 8, axis: .horizontal, distribution: .fillEqually)
        
        let starsLabel = ratingStackView.arrangedSubviews[1] as! UILabel
        starsLabel.textAlignment = .left
        
        let buttonStackView = createStackView(views: createButtons(buttonText: ["Submit Rating", "View Map", "Wikipidia"]), spacing: 0, axis: .horizontal, distribution: .equalSpacing)
        
        
        // top level stack view
        let topLevelStackView = UIStackView(arrangedSubviews: [whyVisitStackView, whatToSeeStackView, weatherInfoStackView, ratingStackView, buttonStackView])
        topLevelStackView.axis = .vertical // 방향 지정
        topLevelStackView.alignment = .fill
        topLevelStackView.distribution = .fill
        topLevelStackView.spacing = 20
        
        
        scrollView.addSubview(topLevelStackView)
        topLevelStackView.anchor(top: scrollView.topAnchor, left: gudie.leadingAnchor, bottom: nil, right: gudie.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        let weatherLabel = weatherStackView.arrangedSubviews[0] as! UILabel
        weatherLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // hideButton
        let hideButton = UIButton(type: .system)
        hideButton.translatesAutoresizingMaskIntoConstraints = false
        hideButton.setTitle("Hide", for: .normal)
        hideButton.setTitle("Show", for: .selected)
        hideButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        hideButton.addTarget(self, action: #selector(handleHide), for: .touchUpInside)
        
        scrollView.addSubview(hideButton)
        hideButton.leadingAnchor.constraint(equalTo: weatherLabel.trailingAnchor, constant: 10).isActive = true
        hideButton.firstBaselineAnchor.constraint(equalTo: weatherLabel.firstBaselineAnchor).isActive = true

    }
    var weatherInfo: UILabel?
    
    // MARK: - Action
    @objc func handleHide(_ sender: UIButton){
        
        guard let weatherInfo = weatherInfo else {return}
        sender.isSelected.toggle()
        
        if sender.isSelected{
            UIView.animate(withDuration: 0.3) {
                weatherInfo.isHidden = true
            }
        } else{
            UIView.animate(withDuration: 0.3) {
                weatherInfo.isHidden = false
            }
        }
    }
    
    
    // MARK: - others
    
    // create UIViews func
    
    func createStackView(views: [UIView], spacing: CGFloat, axis: NSLayoutConstraint.Axis = NSLayoutConstraint.Axis.vertical, alignment: UIStackView.Alignment = UIStackView.Alignment.fill, distribution: UIStackView.Distribution = UIStackView.Distribution.fill) -> UIStackView{
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = axis
        stackView.alignment = alignment
        stackView.distribution = distribution
        stackView.spacing = spacing
        return stackView
    }
    func createButtons(buttonText: [String]) -> [UIButton]{
        var buttons = [UIButton]()
        for title in buttonText{
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            buttons.append(button)
        }
        return buttons
    }
    
    func createLabels(labelsText: [String]) -> [UILabel]{
        var labels = [UILabel]()
        for text in labelsText{
            let label = UILabel()
            label.text = text
            label.numberOfLines = 0
            labels.append(label)
        }
        return labels
    }
    
    
}




extension UIView{
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft:
        CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top{
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left{
            self.leadingAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom{
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right{
            self.trailingAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
