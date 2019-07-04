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
class FriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    enum OptionType: Int {
        case talkAll = 1
        case talkRegistered
        case talkInvitable
        case talkAndStoryAll
        case talkAndStoryRegistered
        case talkAndStoryInvitable
        
        static func toType(_ type: Int) -> OptionType {
            switch type {
            case talkRegistered.rawValue:
                return talkRegistered
            case talkInvitable.rawValue:
                return talkInvitable
            case talkAndStoryAll.rawValue:
                return talkAndStoryAll
            case talkAndStoryRegistered.rawValue:
                return talkAndStoryRegistered
            case talkAndStoryInvitable.rawValue:
                return talkAndStoryInvitable
            default:
                break
            }
            
            return talkAll
        }
    }
    
    let searchController: UISearchController! = UISearchController(searchResultsController: nil)
    
    let limitCount: Int = 2000
    
    var friendContext: KOFriendContext!
    var allFriends: [KOFriend] = []
    var filteredFriends: [KOFriend] = []
    var searchText: String?
    
    var requesting: Bool = false
    var optionType: OptionType = .talkAll
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = searchController.searchBar
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        searchText = searchController.searchBar.text
        
        setupFriendContext()
        requestTalkFriends()
    }
    
    func updateViews() {
        filteredFriends.removeAll()
        for friend in allFriends {
            if (searchText ?? "").isEmpty  || friend.nickName.range(of: searchText!, options: NSString.CompareOptions.caseInsensitive) != nil {
                filteredFriends.append(friend)
            }
        }
        tableView.reloadData()
    }
    
    func setupFriendContext() {
        switch optionType {
        case .talkRegistered:
            friendContext = KOFriendContext(serviceType: .talk, filterType: .registered, limit: limitCount)
        case .talkInvitable:
            friendContext = KOFriendContext(serviceType: .talk, filterType: .invitableNotRegistered, limit: limitCount)
        case .talkAndStoryAll:
            friendContext = KOFriendContext(serviceType: .talkAndStory, filterType: .all, limit: limitCount)
        case .talkAndStoryRegistered:
            friendContext = KOFriendContext(serviceType: .talkAndStory, filterType: .registered, limit: limitCount)
        case .talkAndStoryInvitable:
            friendContext = KOFriendContext(serviceType: .talkAndStory, filterType: .invitableNotRegistered, limit: limitCount)
        default:
            friendContext = KOFriendContext(serviceType: .talk, filterType: .all, limit: limitCount)
        }
    }
    
    func requestTalkFriends() {
        if friendContext == nil {
            print("friendContext must be setup.")
            return
        }
        
        if requesting || !friendContext.hasMoreItems {
            return
        }
        
        requesting = true
        KOSessionTask.friends(with: friendContext, completionHandler: { [weak self] (friends, error) -> Void in
            if let error = error as NSError? {
                print("friends error=\(error)")
                switch error.code {
                case Int(KOErrorCancelled.rawValue):
                    _ = self?.navigationController?.popViewController(animated: true)
                    break
                default:
                    UIAlertController.showMessage(error.description)
                    break
                }
            } else if let friends = friends as [KOFriend]? {
                if let totalCount = self?.friendContext.totalCount {
                    self?.title = "Friends (\(totalCount))"
                }
                self?.allFriends.append(contentsOf: friends)
                self?.updateViews()
            }
            self?.requesting = false
        })
    }
    
    @IBAction func selectOptions(_ sender: AnyObject) {
        UIAlertController.showAlert(title: "Options?", message: "", actions: [
            UIAlertAction(title: "Cancel", style: .cancel, handler: nil),
            UIAlertAction(title: "Talk (All)", style: .default, handler: { (alertAction) in
                print(alertAction.title!)
                self.setOption(.talkAll)
            }),
            UIAlertAction(title: "Talk (Registered)", style: .default, handler: { (alertAction) in
                print(alertAction.title!)
                self.setOption(.talkRegistered)
            }),
            UIAlertAction(title: "Talk (Invitable)", style: .default, handler: { (alertAction) in
                print(alertAction.title!)
                self.setOption(.talkInvitable)
            }),
            UIAlertAction(title: "TalkAndStory (All)", style: .default, handler: { (alertAction) in
                print(alertAction.title!)
                self.setOption(.talkAndStoryAll)
            }),
            UIAlertAction(title: "TalkAndStory (Registered)", style: .default, handler: { (alertAction) in
                print(alertAction.title!)
                self.setOption(.talkAndStoryRegistered)
            }),
            UIAlertAction(title: "TalkAndStory (Invitable)", style: .default, handler: { (alertAction) in
                print(alertAction.title!)
                self.setOption(.talkAndStoryInvitable)
            })
        ])
    }
    
    func setOption(_ optionType: OptionType) {
        self.optionType = optionType
        allFriends.removeAll()
        updateViews()
        
        setupFriendContext()
        requestTalkFriends()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredFriends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var normalCell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if normalCell == nil {
            normalCell = ThumbnailImageViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        }
        
        let friend: KOFriend = filteredFriends[(indexPath as NSIndexPath).row]
        normalCell?.textLabel?.text = friend.nickName
        
        normalCell?.imageView?.image = UIImage(named: "PlaceHolder")
        if let url = friend.thumbnailURL, let imageUrl = URL(string: url) {
            normalCell?.imageView?.setImage(withUrl: imageUrl)
        }
        
        // load more
        let friendsCount = filteredFriends.count
        if (indexPath as NSIndexPath).row > (friendsCount - friendsCount / 3) {
            requestTalkFriends()
        }
        
        return normalCell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showAlert(filteredFriends[(indexPath as NSIndexPath).row])
    }
    
    func showAlert(_ friend: KOFriend!) {
        if let friend = friend {
            var message: String = "id:\(String(describing: friend.id))\nuuid:\(String(describing: friend.uuid))\nappRegistered:\(friend.isAppRegistered)"
            message += "\nnickname:\(String(describing: friend.nickName))"
            message += "\nos:\(String(describing: convertOSPropertyTypeString(friend.talkOS)))"
            message += "\nallowedTalkMessaging:\(friend.isAllowedTalkMessaging)"
            message += "\nrelations:"
            if friend.talkRelation == .friend {
                message += " talk"
            }
            if friend.storyRelation == .friend {
                message += " story"
            }
            
            UIAlertController.showMessage(message)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchText = searchText
        updateViews()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.text = self.searchText
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.text = self.searchText
    }
}
