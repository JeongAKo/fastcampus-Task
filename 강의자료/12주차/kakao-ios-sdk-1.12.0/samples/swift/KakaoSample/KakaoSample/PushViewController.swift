/**
 * Copyright 2015-2018 Kakao Corp.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIKit

class PushViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    fileprivate var menu: [String] = ["My Token", "Register", "Send", "Get Tokens", "Deregister", "Deregister All Devices"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var normalCell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if normalCell == nil {
            normalCell = IconTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        }
        
        normalCell?.imageView?.image = UIImage(named: "PushMenuIcon\((indexPath as NSIndexPath).row)")
        normalCell?.textLabel?.text = menu[(indexPath as NSIndexPath).row]
        
        return normalCell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch menu[(indexPath as NSIndexPath).row] {
        case "My Token":
            getMyToken()
        case "Register":
            register()
        case "Send":
            send()
        case "Get Tokens":
            getTokens()
        case "Deregister":
            deregister()
        case "Deregister All Devices":
            deregisterAllDevices()
        default:
            fatalError("no menu item!!")
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func deviceToken() -> Data! {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.deviceToken as Data?
    }
    
    func getMyToken() {
        var hexString: String = ""
        for byte in deviceToken() {
            hexString.append(String(Int(byte), radix: 16))
        }
        UIAlertController.showMessage("My Token = \(hexString)")
    }
    
    func register() {
        if let token = deviceToken() {

            KOSessionTask.pushRegisterDevice(withToken: token, completionHandler: { (success, expiredAt, error) -> Void in
                if error == nil {
                    UIAlertController.showMessage("Token register success = \(expiredAt)day available to use.")
                } else {
                    UIAlertController.showMessage("Token register fail.")
                }
            })
        } else {
            UIAlertController.showMessage("Token is not exist.")
        }
    }
    
    func send() {
        if let _ = deviceToken() {
            let message = ["title": "KAKAO PUSH",
                           "body": "푸시 잘 갑니까?"]
            let customField = ["key1": "value1",
                               "key2": "value2"]
            let collapse = "collapse_id_1234"
            
            // for_apns
            let apns = KakaoPushMessagePropertyForApns(badgeCount: 10, sound: "default", pushAlert: true, messageDictionary: message, customField: customField)
            apns.collapse = collapse
            
            // for_gcm
            let gcm = KakaoPushMessagePropertyForGcm(collapse: collapse, delayWhileIdle: false, returnUrl: "http://www.example.com/test", customField: customField)
            gcm.notification = message
            
            // push_message
            let pushMessageObject = KakaoPushMessageObject(apnsProperty: apns, gcmProperty: gcm)
            
            KOSessionTask.pushSendMsg(pushMessageObject, completionHandler: { (success, error) -> Void in
                if error == nil {
                    UIAlertController.showMessage("Send PushMessage success.")
                } else {
                    UIAlertController.showMessage("Send PushMessage fail.")
                }
            })
        } else {
            UIAlertController.showMessage("Token is not exist.")
        }
    }
    
    func getTokens() {
        KOSessionTask.pushGetTokensTask { (tokens, error) -> Void in
            if error == nil {
                UIAlertController.showMessage("Tokens = \(tokens!)")
            } else {
                UIAlertController.showMessage("Get tokens fail.")
            }
        }
    }
    
    func deregister() {
        if let token = deviceToken() {
            KOSessionTask.pushDeregisterDevice(withToken: token, completionHandler: { (success, error) -> Void in
                if error == nil {
                    UIAlertController.showMessage("Token deregister success.")
                } else {
                    UIAlertController.showMessage("Token deregister fail.")
                }
            })
        } else {
            UIAlertController.showMessage("Token is not exist.")
        }
    }
    
    func deregisterAllDevices() {
        KOSessionTask.pushDeregisterAllDevice { (success, error) -> Void in
            if error == nil {
                UIAlertController.showMessage("All Devices token deregister success.")
            } else {
                UIAlertController.showMessage("All Devices token deregister fail.")
            }
        }
    }
}
