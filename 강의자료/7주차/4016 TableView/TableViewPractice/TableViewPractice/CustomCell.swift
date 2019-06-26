//
//  CustomCell.swift
//  TableViewPractice
//
//  Created by Daisy on 15/04/2019.
//  Copyright © 2019 고정아. All rights reserved.
//

import UIKit


final class CustomCellTableViewCell: UITableViewCell {
    
    let button = UIButton(type: .system)
    let data = Array(1...50)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.frame = CGRect(x: frame.width - 120, y: 10, width: 80, height: frame.height - 20)
        button.setTitle("MyButton", for: .normal)
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector(myButtonAction), for: .touchUpInside)
        contentView.addSubview(button)
        
    }
    //오토레이아웃
//    override func updateConstraints() {
//        super.updateConstraints()
//    }
    
    @objc func myButtonAction() {
        let add = Int(self.textLabel?.text ?? "0")!
        self.textLabel?.text = "\(add + 1)"
        
        
}

}
