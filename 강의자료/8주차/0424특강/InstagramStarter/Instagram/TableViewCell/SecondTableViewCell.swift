//
//  SecondTableViewCell.swift
//  Instagram
//
//  Created by Daisy on 24/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

protocol SecondDelegate: class {
    func commentCell(_ commentCell: UITextField)
}



class SecondTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userID: UILabel!
    @IBOutlet weak var userComment: UILabel!
    
    
    weak var delegate : SecondDelegate?
    
    //클로져 ?? 잉??ㅋㅋㅋㅋㅋㅋ
    var textField: UITextField = {
        let textField = UITextField()
        let button = UIButton(type: .system)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(addCommentButtonDidTap(_:)), for: .touchUpInside)
        button.setTitle("게시", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        textField.rightView = button //텍스트 필드 오른쪽에 있는거
        textField.rightViewMode = .always
        return textField //나를 다시 리턴한다
    }()  // () 실행해라 요런거

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func addCommentButtonDidTap(_ sender: UIButton) {
    delegate?.commentCell(userID.text)
    delegate?.commentCell(userComment.text)
        
    }
    
}
