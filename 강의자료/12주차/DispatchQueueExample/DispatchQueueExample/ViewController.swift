//
//  ViewController.swift
//  DispatchQueueExample
//
//  Created by giftbot on 2019. 5. 20..
//  Copyright © 2019년 giftbot. All rights reserved.
//




import UIKit

final class ViewController: UIViewController {
  
  @IBOutlet private weak var testView: UIView!

  @IBAction private func buttonDidTap(_ sender: Any) {
    print("---------- [ Change Color ] ----------\n")
    let r = CGFloat.random(in: 0...1.0)
    let g = CGFloat.random(in: 0...1.0)
    let b = CGFloat.random(in: 0...1.0)
    testView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
  }

  func bigTask() {
    print("= Big task start =")
    for _ in 0...900_000_000 { _ = 1 + 1 }
    print("= Big task end =")
  }
  @IBAction func bigTaskOnMainThread() {
    
//    bigTask()

    // 동시에 두 가지 작업을 수행하려면?
    DispatchQueue.global().async {
        self.bigTask()
    }
  }
  
  @IBAction func uiTaskOnBackgroundThread() {
    print("\n---------- [ uiTaskOnBackgroundThread ] ----------\n")
    
    // Invalid usage warning
//    DispatchQueue.global().async {
//      self.bigTask()
//      self.buttonDidTap(self)
//    }
    
    // 해결 방법?
    
    DispatchQueue.global().async {
        self.bigTask()
        DispatchQueue.main.async {
            self.buttonDidTap(self)
        }
    }
    
  }
  
  @IBAction func executionOrder() {
    let serialQueue = DispatchQueue(label: "kr.giftbot.serialQueue")
    
    print("\n---------- [ Serial Sync ] ----------\n")
    
    serialQueue.sync { print("1") }
    print("A")
    serialQueue.sync { print("2") }
    print("B")
    serialQueue.sync { print("3") }
    print("C")
    
    print("\n---------- [ Serial Async ] ----------\n")
    
    serialQueue.async { print("1") }
    print("A")
    serialQueue.async { print("2") }
    print("B")
    serialQueue.async { print("3") }
    print("C")
    
    
    let concurrentQueue = DispatchQueue(label: "kr.giftbot.concurrentQueue",
                                        attributes: [.concurrent])
    
    print("\n---------- [ Concurrent Sync ] ----------\n")
    
    concurrentQueue.sync { print("1") }
    print("A")
    concurrentQueue.sync { print("2") }
    print("B")
    concurrentQueue.sync { print("3") }
    print("C")
    
    print("\n---------- [ Concurrent Async ] ----------\n")
    
    concurrentQueue.async { print("1") }
    print("A")
    concurrentQueue.async { print("2") }
    print("B")
    concurrentQueue.async { print("3") }
    print("C")
  }
  
  
  private func createDispatchWorkItem() -> DispatchWorkItem {
    let workItem = DispatchWorkItem {
      let bigNumber = 20_000_000
      let divideNumber = 5_000_000
      for i in 1...bigNumber {
        i % divideNumber == 0 ? print(i / divideNumber * 25, "%") : ()
      }
      print("done")
    }
    return workItem
  }
  
  @IBAction func waitWorkItem() {
    print("\n---------- [ waitWorkItem ] ----------\n")
    
    let workItem = createDispatchWorkItem()
    let myQueue = DispatchQueue(label: "kr.giftbot.myQueue")
    myQueue.async(execute: workItem)
//    myQueue.sync(execute: workItem)   // sync 와 async 수행 결과 차이?
    
    print("before waiting")
    workItem.wait()          // wait 를 사용했을 때와 아닐 때 비교
    print("after waiting")
  }
  
  
  // InactiveQueue
  let inactiveQueue = DispatchQueue(label: "kr.giftbot.inactiveQueue",
                              attributes: .initiallyInactive)
  
  @IBAction func initiallyInactiveQueue() {
    print("\n---------- [ initiallyInactiveQueue ] ----------\n")

    let workItem = createDispatchWorkItem()
    inactiveQueue.async(execute: workItem)
    
    print("= Do Something... =")
    
    // 필요한 곳에서 활성화
    inactiveQueue.activate()  //실행 타이밍 조절
  }
  
  
  @IBAction func groupNotify() {
    print("\n---------- [ groupNotify ] ----------\n")
    let group = DispatchGroup()
    let queue1 = DispatchQueue(label: "kr.giftbot.example.queue1")
    let queue2 = DispatchQueue(label: "kr.giftbot.example.queue2")
    let queue3 = DispatchQueue(label: "kr.giftbot.example.queue3")
    
    queue1.async(group: group) {
      print("queue1 시작")
      for _ in 0...990_000_000 { _ = 1 + 1 }
      print("queue1 완료")
    }
    queue2.async(group: group) {
      print("queue2 시작")
      for _ in 0...400_000_000 { _ = 1 + 1 }
      print("queue2 완료")
    }
    queue3.async(group: group) { //요러케 그룹 넣어주고
      print("queue3 시작")
      for _ in 0...10_000_000 { _ = 1 + 1 }
      print("queue3 완료")
    }
    group.notify(queue: .main) { //그룹의 모든 작업이 끝나면 notify 알여줌
      print("전체 완료")
    }
  }
  
  
  var myWorkItem: DispatchWorkItem!
  
  @IBAction func cancelDispatchWorkItem() {
    myWorkItem = DispatchWorkItem(qos: .default) {
      let bigNumber = 80_000_000
      let divideNumber = 20_000_000
      for i in 1...bigNumber {
        guard !self.myWorkItem.isCancelled else { return }
        i % divideNumber == 0 ? print(i / divideNumber * 25, "%") : ()
      }
      print("done")
    }
    
    
//    myWorkItem.perform()
    DispatchQueue.global().async(execute: myWorkItem)
    
    
    // 2초 안에 완료하지 못하면 작업을 취소하고자 할 때
    let timeoutResult = myWorkItem.wait(timeout: .now() + 2)
    switch timeoutResult {
    case .success: print("success within 2 seconds")
    case .timedOut:
      myWorkItem.cancel()  //캔슬은 안댐 아예 중단시키려면 속성에 iscancelled true로 바꿔줘야함 181열
      print("Timed out. task cancelled")
    }
  }
  
  
  @IBAction func testButton() {
  }
}


/* 오늘의 중요!

빅테스크를 메인에서하면 안된다
UI Task 를 백그라운드 쓰레드에서 해라

*/
