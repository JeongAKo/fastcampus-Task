//
//  FeedManager.swift
//  Instagram
//
//  Created by Wi on 24/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import Foundation


// 모든 FeedData를 관리할 관리자 클래스를 만듭니다. (싱글턴)

class FeedManager {
    // 싱글턴 선언
    static let shared = FeedManager()
    
    // feedData 배열선언
    var allFeedData = [FeedData]()
    
    // 다른 곳에서 생성이 되지 않도록 init 함수를 private으로 선언합니다.
    private init(){}

    //feedData 추가 함수
    func addFeedData(_ feedData: FeedData){
        allFeedData.append(feedData)
    }
    
    //feedData 반환 함수
    func returnFeedData() -> [FeedData]{
        return allFeedData
    }
    
    
}
