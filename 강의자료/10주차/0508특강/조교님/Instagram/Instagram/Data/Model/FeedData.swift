//
//  FeedData.swift
//  Instagram
//
//  Created by Wi on 14/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import Foundation
import UIKit
// FeedData 라는 데이터모델을 필요에 따라 모델링합니다.

class FeedData {
    let profileImage: UIImage?
    let nickName: String?
    let feedImage: UIImage?
    var comment: [String]? = ["ㅋㅋㅋㅋ", "lol"] // 기본값
    let explanation: String?
    
    init(profileImage: UIImage?, nickName: String?, feedImage: UIImage?, explanation: String?) {
        self.profileImage = profileImage ?? UIImage(named: AppImageData.profile + "\(3)")
        self.nickName = nickName ?? "NickName"
        self.feedImage = feedImage
        self.explanation = explanation
    }
    
}
