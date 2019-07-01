//
//  ViewController.swift
//  URLScheme
//
//  Created by giftbot on 2019. 5. 4..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBAction private func openSetting(_ sender: Any) {
        print("\n---------- [ openSettingApp ] ----------\n")
        
        guard let url = URL(string: UIApplication.openSettingsURLString),
        UIApplication.shared.canOpenURL(url)
            else {return}
        
//        ver < 5 ⇢ UIApplicationOpenSettingsURLString
//        ver > 5 ⇢ UIApplication.openSettingsURLString
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction private func openMail(_ sender: Any) {
        print("\n---------- [ openMail ] ----------\n")
        
//        let scheme = "mailto:"
//        let scheme = "mailto:someone@mail.com"  //받는사람 지정
//        let scheme = "mailto:?cc=foo@bar.com&subject=titile&body=MyText" //추가파라미터
        
        let scheme = "mailto:someone@mail.com?cc=foo@bar.com&subject=titile&body=MyText"
        
        guard let url = URL(string: scheme),
        UIApplication.shared.canOpenURL(url)
            else {return}
        UIApplication.shared.open(url)
        
    }
    
    @IBAction private func openMessage(_ sender: Any) {
        print("\n---------- [ openMessage ] ----------\n")
        
//        let url = URL(string: "sms:")!
//        let url = URL(string: "sms:010-9999-9999")! // 받는사람 지정
        
        let url = URL(string: "sms:010-9999-9999&body=Hello")!
        
        guard UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction private func openWebsite(_ sender: Any) {
        print("\n---------- [ openWebsite ] ----------\n")
        
        let url = URL(string: "https://github.com/JeongAKo")!
        
        guard UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url)
        
    }
    
    
//    ⇧ 시스템앱
//    ↓ 3rn Party 앱  권장사항 canOpenURL 하고 화이트리스트 등록을 해주어야 한다.
    @IBAction private func openFacebook(_ sender: Any) {
        print("\n---------- [ openFacebook ] ----------\n")
        
        //iOS 9.0 이상 부터 화이트 리스트 등록 pList
        let facebookscheme = URL(string: "fb://")!
        print(UIApplication.shared.canOpenURL(facebookscheme))
        guard UIApplication.shared.canOpenURL(facebookscheme) else {return} 
        UIApplication.shared.open(facebookscheme)
    }
    
    @IBAction private func openMyApp(_ sender: Any) {
        print("\n---------- [ openMyApp ] ----------\n")
        
//        let url = URL(string: "myApp:")!
//        let url = URL(string: "myApp://?name=Daisy&age=29")!
        let url = URL(string: "myApp://host?name=Daisy&age=29")!
        
        guard UIApplication.shared.canOpenURL(url) else {return}
        UIApplication.shared.open(url)
    }
}




