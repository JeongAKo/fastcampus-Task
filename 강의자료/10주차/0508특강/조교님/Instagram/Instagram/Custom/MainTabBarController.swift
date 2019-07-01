//
//  MainViewController.swift
//  Instagram
//
//  Created by Wi on 29/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    // MARK: - Properties
    
    // 탭바에 올릴 뷰컨트롤러 생성
    let homeVC = HomeViewController()
    let plusVC = PlusViewController()
    let myVC = MyViewController()
    
    // 이미지 피커컨트롤러 생성
    let picker = UIImagePickerController()
    
    // MARK: - Methods
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        picker.delegate = self
        
        // 탭바 이미지 설정해주기
        homeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: AppImageData.homeNomal), selectedImage: UIImage(named: AppImageData.homeSelected))
        plusVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: AppImageData.plus), selectedImage: UIImage(named: AppImageData.plus))
        
        // 탭바 델리게이트 적용
        self.delegate = self
        // homeVC에 네비게이션 적용시키기
        self.viewControllers = [UINavigationController.init(rootViewController: homeVC), plusVC, UINavigationController(rootViewController: myVC)]
        
        
    }

    //MARK: UITabbar Delegate
    // 탭바를 선택했을때
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController == plusVC {
            // picker의 소스타입 선택해주기
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true, completion: nil)
            return false
        }
        return true
    }
}

// MARK: UIImagePickerControllerDelegate

extension MainTabBarController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    // 이미지를 받는 함수 
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        NotificationCenter.default.post(name: NSNotification.Name("photoSelected"), object: nil, userInfo: ["image" : info[.originalImage]])
        picker.dismiss(animated: false, completion: nil)
    }
    
    
}
