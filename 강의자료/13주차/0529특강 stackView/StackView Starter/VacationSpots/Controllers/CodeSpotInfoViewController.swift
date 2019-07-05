//
//  CodeSpotInfoViewController.swift
//  VacationSpots
//
//  Created by Wi on 29/05/2019.
//  Copyright © 2019 Jawwad Ahmad. All rights reserved.
//

import UIKit

class CodeSpotInfoViewController: UIViewController {

    var vacationSpot: VacationSpot!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scrollView = UIScrollView()
        
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

        
        let whyVisit = UILabel()
        whyVisit.text = "WHY VISIT"
        let whyVisitLable = UILabel()
        whyVisitLable.text = "<whyVisitLabel>"
        let whyStackView = UIStackView(arrangedSubviews: [whyVisit, whyVisitLable])
        
        whyStackView.axis = .vertical
        whyStackView.alignment = .fill
        whyStackView.distribution = .fill
        
        
        let weather = UILabel()
        weather.text = "Weather"
        let weatherLable = UILabel()
        weatherLable.text = "<weatherInfoLabel>"
        let weatherStackView = UIStackView(arrangedSubviews: [weather, weatherLable])
        
        weatherStackView.axis = .vertical
        weatherStackView.alignment = .leading
        weatherStackView.distribution = .fill
   
        let hideAndShowButton = UIButton(type: .system)
        hideAndShowButton.setTitle("Hide", for: .normal)
        scrollView.addSubview(hideAndShowButton)
    
        let whatToSee = UILabel()
        whatToSee.text = "WHAT TO SEE"
        let whatToSeeLabel = UILabel()
        whatToSeeLabel.text = "<whatToSeeLabel>"
        let whatStackView = UIStackView(arrangedSubviews: [whatToSee, whatToSeeLabel])
        
        whatStackView.axis = .vertical
        whatStackView.alignment = .fill
        whatStackView.distribution = .fill
        
        let rating = UILabel()
        rating.text = "RATING"
        let star = UILabel()
        star.text = "⭐️⭐️⭐️⭐️⭐️"
        let ratingStarStackView = UIStackView(arrangedSubviews: [rating, star])
        
        ratingStarStackView.axis = .horizontal
        ratingStarStackView.spacing = 8
        ratingStarStackView.alignment = .fill
        ratingStarStackView.distribution = .fill
        
        let submitRatingButton = UIButton(type: .system)
        submitRatingButton.setTitle("submitRatingButton", for: .normal)
        let viewMapButton = UIButton(type: .system)
        viewMapButton.setTitle("View Map", for: .normal)
        let wikipediaButton = UIButton(type: .system)
        wikipediaButton.setTitle("Wikipedia", for: .normal)
        let buttonStackView = UIStackView(arrangedSubviews: [submitRatingButton, viewMapButton, wikipediaButton])
        
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .equalSpacing
        buttonStackView.alignment = .fill
        
        let totalStackView = UIStackView(arrangedSubviews: [whyStackView, whatStackView, weatherStackView, whatStackView, ratingStarStackView, buttonStackView])
        
        totalStackView.axis = .vertical
        totalStackView.alignment = .fill
        totalStackView.distribution = .fill
        totalStackView.spacing = 20
    
        scrollView.addSubview(totalStackView)
        
        let margin: CGFloat = 20
        totalStackView.translatesAutoresizingMaskIntoConstraints = false
        totalStackView.topAnchor.constraint(equalTo:scrollView.topAnchor, constant: margin).isActive = true
        totalStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: margin).isActive = true
        totalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -margin).isActive = true
        totalStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
       
        hideAndShowButton.translatesAutoresizingMaskIntoConstraints = false
        hideAndShowButton.firstBaselineAnchor.constraint(equalTo: weather.firstBaselineAnchor).isActive = true
        hideAndShowButton.leadingAnchor.constraint(equalTo: weather.trailingAnchor, constant: 8).isActive = true
        
    }
}
