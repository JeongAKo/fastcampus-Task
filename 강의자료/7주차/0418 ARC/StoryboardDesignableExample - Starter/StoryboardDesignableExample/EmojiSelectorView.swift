//
//  EmojiSelector.swift
//  StoryboardDesignableExample
//
//  Created by 이봉원 on 14/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit
@IBDesignable
final class EmojiSelectorView: UIView {
    
    let emojiDisplayLabel = UILabel()
    let upButton = UIButton(type: .system)
    let downButton = UIButton(type: .system)
    
    let emojis = [
        "😀", "😃", "😄", "😆", "😅",
        "🤲", "👐", "🙌", "👏", "🤝",
        "🐶", "🐱", "🐭", "🐹", "🐰"
    ]
    
    var count = 0
    @IBInspectable var currentIndex: Int = 3 {
        didSet {
            let index = currentIndex % emojis.count
            let adjustmentIndex = index < 0 ? index + emojis.count : index
            emojiDisplayLabel.text = emojis[adjustmentIndex]
        }
    }
    
    @IBInspectable var upButtonColor : UIColor? {
        didSet {upButton.backgroundColor = upButtonBgColor}
    }
    
    var emojiAreaRatio: CGFloat = 0.7
    var emojiLabelBgColor: UIColor?
    var emojiFontSize: CGFloat = 70
    var emojiBackgroundColor: UIColor = .black
    
    var upButtonBgColor: UIColor?
    var downButtonBgColor: UIColor?
    var buttonFontSize: CGFloat = 30
    
    // MARK: - Initialize
    //코드로 초기화 //둘다setupUI() 넣어주깅
    override init(frame: CGRect){
        super.init(frame: frame)
        setupUI()
    }
    // MARK: - View Layout
    //스토리보드로 초기화 //둘다setupUI() 넣어주깅
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func setupUI() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        addSubview(emojiDisplayLabel)
        addSubview(upButton)
        addSubview(downButton)
        
        emojiDisplayLabel.text = emojis[currentIndex]
        emojiDisplayLabel.textAlignment = .center
        emojiDisplayLabel.font = UIFont.systemFont(ofSize: emojiFontSize)
        emojiDisplayLabel.backgroundColor = emojiBackgroundColor
        
        upButton.setTitle("⬆︎", for: .normal)
        upButton.setTitleColor(.black, for: .normal)
        upButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        upButton.titleLabel?.textAlignment = .center
        upButton.layer.borderWidth = 1
//        upButton.backgroundRect(forBounds: downButton.frame)
//        upButton.backgroundColor = .blue
        upButton.layer.borderColor = UIColor.black.cgColor
        upButton.addTarget(self, action: #selector(didTapUpDownButton(_:)), for: .touchUpInside)
        
        downButton.setTitle("⬇︎", for: .normal)
        downButton.setTitleColor(.black, for: .normal)
        downButton.backgroundRect(forBounds: upButton.frame)
        downButton.backgroundColor = .red
        downButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        downButton.titleLabel?.textAlignment = .center
        downButton.layer.borderWidth = 1
        downButton.layer.borderColor = UIColor.black.cgColor
        downButton.addTarget(self, action: #selector(didTapUpDownButton(_:)), for: .touchUpInside)
    }
    
    // MARK: - View Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let emojiWidth = frame.width * emojiAreaRatio
        emojiDisplayLabel.frame = CGRect(x: 0, y: 0, width: emojiWidth, height: frame.height)
        upButton.frame = CGRect(x: emojiWidth, y: 0, width: frame.width - emojiWidth, height: frame.height/2)
        downButton.frame = CGRect(x: emojiWidth, y: frame.height/2, width: frame.width - emojiWidth, height: frame.height/2)
        
    }
    
    
    
    @objc func didTapUpDownButton(_ sender: UIButton) {
        
        currentIndex += (sender == upButton) ? 1 : -1
        
    }
}
