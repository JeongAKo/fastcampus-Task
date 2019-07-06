//
//  ViewController.swift
//  URLSessionExample
//
//  Created by giftbot on 2019. 6. 6..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  private let imageUrlStr = "https://loremflickr.com/860/640/cat"
  
  
  // MARK: - Sync method
  
  @IBAction private func syncMethod() {
    print("\n---------- [ syncMethod ] ----------\n")
    let url = URL(string: imageUrlStr)!
    
    // sync(동기)- 호출한 메서드가 종료될때 까지 기다렸다가 다음작업 수행, async(비동기) - 메서드를 호출만하고 완료를 기다리지 않고 다음작업 실행
//    if let data = try? Data(contentsOf: url) {
//        imageView.image = UIImage(data: data)
//    }
    
    DispatchQueue.global().async {
        if let data = try? Data(contentsOf: url) {
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
    }
    print("1")
  }
  
  
  // MARK: - URLComponents
  
  @IBAction private func urlComponentsExample(_ sender: Any) {
    print("\n---------- [ urlComponentsExample ] ----------\n")
    /***************************************************
     http://username:password@www.example.com:80/index.html?key1=value1&key2=value2#frag
     
     scheme - http
     
     ***************************************************/
    
    var components = URLComponents()
    components.scheme = "http"
    components.user = "username"
    components.password = "password"
    components.host = "www.example.com"
    components.port = 80
    components.path = "/index.html"
//    components.query = "key1=value1&key2=value2" ↓↓↓↓↓ 요러케도 쓰지롱
    components.queryItems = [URLQueryItem(name: "key1", value: "value1"),URLQueryItem(name: "key2", value: "value2")]
    components.fragment = "frag"
    print(components)

    
    var comp = URLComponents(string: "http://username:password@www.example.com:80/index.html?key1=value1&key2=value2#frag")
    comp?.fragment = "myFragment"
    
    print(comp)  // http://username:password@www.example.com:80/index.html?key1=value1&key2=value2#myFragment
    
  }
  
  
  // MARK: - URL Encoding Example
    
  @IBAction private func urlEncodingExample() {
    print("\n---------- [ urlEncodingExample ] ----------\n")
    
    
    //영어주소는 문제가 없다
    let urlStringE = "https://search.naver.com/search.naver?query=swift"
    if let url = URL(string: urlStringE) {
        print(url)
    } else {
        print("nil")
    }
    
        //한글주소 그대로 쓰면 → nil
        let urlStringK = "https://search.naver.com/search.naver?query=한글"
        if let url = URL(string: urlStringK) {
            print(url)
        } else {
            print("nil")
    }
    
    // URL 주소에 한글을 넣어줄때에는 addingPercentEncoding 해줘야 한다
    let str = "https://search.naver.com/search.naver?query=한글"
    let queryEncodedStr = str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
  
    let convertedURL = URL(string: queryEncodedStr)!
    print(convertedURL)
    
    
    let originalString = "color=#708090"  // #때문에 변경해줌
    var allowed = CharacterSet.urlFragmentAllowed
    allowed.insert("#")
    let encodingString = originalString.addingPercentEncoding(withAllowedCharacters: allowed)
    print(encodingString)  //prints "color-%23708090"
    
    let encodedURLString = "https://example.com/#color-%708090"
    let url = URL(string: encodedURLString)!
    let compornents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
    let fragment = compornents.fragment!
    print(fragment)
    
    }
  
  
  
  // MARK: - Session Configuration
  
  @IBAction private func sessionConfig(_ sender: Any) {
    print("\n---------- [ Session Configuration ] ----------\n")
    
    _ = URLSession.shared
    _ = URLSessionConfiguration.default
    _ = URLSessionConfiguration.ephemeral
    _ = URLSessionConfiguration.background(withIdentifier: "backgroundID")
    
    let sessionConfig = URLSessionConfiguration.default
    //기본값 true Wi-Fi만 사용사능하도록 할 때는 false
    sessionConfig.allowsCellularAccess = false
    
    //기본값 4
    sessionConfig.httpMaximumConnectionsPerHost = 5
    
    //기본값 60초
    sessionConfig.timeoutIntervalForRequest = 20

    // 기본값 .useProtocolCachePolicy
    sessionConfig.requestCachePolicy = .reloadRevalidatingCacheData
    
    // 기본값 false
    sessionConfig.waitsForConnectivity  = true // 즉각 실패 메세지를 띄우느게 아니라 대기 하거나 함
    
    // 16KB(16*1024 = 16384), 256MB (256*1024*1024 = 268435456)
    let myCache = URLCache(memoryCapacity: 16_384, diskCapacity: 268_435_456, diskPath: nil)
  
   
//    FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0] ← 경로 알아보기
     // ↓ 설정 안하면 기본
    let cache = URLCache.shared
    sessionConfig.urlCache = cache
    print(cache.diskCapacity)
    print(cache.currentDiskUsage)
////    cache.removeAllCachedResponses()
//    let mySession = URLSession(configuration: sessionConfig)
//    let url = URL(string: imageUrlStr)!
//    let task = mySession.dataTask(with: url) { [weak self], (data, response, error) in
//        guard let data = data else {return}
//        DispatchQueue.main.async {
//            self
//    }
//    }
// task.resume()
    }


  // MARK: - Get, Post, Delete
    
    struct User: Decodable {
        let userId: Int
        let id: Int
        let title: String
        let completed: Bool
    }
    
    
  
  @IBAction func requestGet(_ sender: Any) {
    print("\n---------- [ Get Method ] ----------\n")
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos/1"
    let url = URL(string: todoEndpoint)!
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard error == nil else { return print(error!.localizedDescription)}
        guard let response = response as? HTTPURLResponse,
            (200..<300).contains(response.statusCode),
            response.mimeType == "application/json" else {return print("error status")}
        
        guard let data = data else { return print("no data")}
        
        guard let obj = try? JSONDecoder().decode(User.self, from: data) else { return print("can't parsed")}
        
        print(obj)
        
        }.resume()
    
  }
  
  

  @IBAction func requestPost(_ sender: Any) {
    print("\n---------- [ Post Method ] ----------\n")
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos"
    guard let url = URL(string: todoEndpoint) else {
        return print("Error: cannot create URL")
    }
    let newTodo: [String: Any] = [
        "userId": 1,
        "title": "delectus aut autem",
        "completed": false
    ]
    guard let encodedTodo = try? JSONSerialization.data(withJSONObject: newTodo)
        else {return}
  
    var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST" //기본은 get
        urlRequest.httpBody =  encodedTodo
   
    URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
        guard error == nil else { return print(error!.localizedDescription)}
        guard let response = response as? HTTPURLResponse,
            (200..<300).contains(response.statusCode),
            response.mimeType == "application/json" else {return print("error status")}
        
        print(response.statusCode)
        
        }.resume()
    
    }
  
  
  @IBAction func requestDelete(_ sender: Any) {
    print("\n---------- [ Delete Method ] ----------\n")
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos/1"
    guard let url = URL(string: todoEndpoint) else {
        return print("Error: cannot create URL")
    }
    
    let removeData: [String: Any] = [
        "userId": 1,
        "id": 1,
        "title": "delectus aut autem",
        "completed": false
    ]
    
    guard let data = try? JSONSerialization.data(withJSONObject: removeData)
        else {return}
    var urlRemove = URLRequest(url: url)
        urlRemove.httpMethod = "DELETE"
    
    URLSession.shared.dataTask(with: urlRemove) { (data, response, error) in
        guard error == nil else { return print(error!.localizedDescription)}
        guard let response = response as? HTTPURLResponse,
            (200..<300).contains(response.statusCode),
            response.mimeType == "application/json" else {return print("error status")}
        
        print(response.statusCode)
        
        }.resume()
    
    
  }
}

