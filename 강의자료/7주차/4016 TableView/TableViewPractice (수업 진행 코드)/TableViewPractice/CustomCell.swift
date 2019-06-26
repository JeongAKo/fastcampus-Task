//
//  CustomCell.swift
//  TableViewPractice
//
//  Created by 이봉원 on 15/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

protocol CustomCellDelegate: class {
  func customCell(_ customCell: CustomCell, didTapButton button: UIButton)
}

final class CustomCell: UITableViewCell {
  
  weak var delegate: CustomCellDelegate?
  let button = UIButton(type: .system)
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(button)
    button.setTitle("MyButton", for: .normal)
    button.backgroundColor = .yellow
    button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    button.frame = CGRect(
      x: frame.width - 120, y: 10,
      width: 80, height: frame.height - 20
    )
  }
  
  // 오토레이아웃
  override func updateConstraints() {
    super.updateConstraints()
  }
  
  @objc func didTapButton(_ sender: UIButton) {
    delegate?.customCell(self, didTapButton: sender)
  }
}
