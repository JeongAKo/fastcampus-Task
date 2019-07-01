//
//  UserManager.swift
//  Instagram
//
//  Created by Wi on 03/05/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import Foundation
import UIKit

// 현재 로그인한 유저의 정보를 가지고 있을 매니저 입니다.
class UserManager {
    // 어디서든 접근할 수 있게 싱글턴 객체로 만들어줍니다.
    static let shard = UserManager()
    
    // 유저디폴트 사용
    private var userDefaults = UserDefaults.standard
    // 유저의 데이터를 하나 만들어줍니다.
    // 유저의 데이터가 매니저를 거치지 않고 변하는 것을 원치 않기 때문에 private로 선언해줍니다.
    private var user = User(userName: "", profileImage: nil)
    // 매니저 클래스는 하나만 존재할 수 있게 init 함수를 private로 숨겨줍니다.
    private init() {}

    func changeUserName(userName: String, completion: (Bool, String) -> ()){
        guard let localUserData = userDefaults.array(forKey: "userName"), var userNames = localUserData as? [String]
            else {
            userDefaults.set([userName], forKey: "userName")
            self.user.userName = userName
            completion(true, userName)
            return
        }
        if userNames.contains(userName){
            completion(false, "중복된 닉네임이 있습니다.")
            return
        }
        userNames.append(userName)
        userDefaults.setValue(userNames, forKey: "userName")
        self.user.userName = userName
        completion(true,userName)
    }
    
    // 현재 매니저가 가지고있는 유저의 정보를 반환 합니다.
    func getUserInfo(completion: (User) ->()){
        completion(user)
    }
    func changeUserInfo(user: User, completion:(User) ->()){
        self.user = user
        completion(self.user)
    }
    
}
