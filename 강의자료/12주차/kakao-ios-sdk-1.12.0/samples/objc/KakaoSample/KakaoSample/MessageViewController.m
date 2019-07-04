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

#import "MessageViewController.h"
#import "ThumbnailImageViewCell.h"
#import "UIAlertController+Addition.h"
#import "UIImageView+WebCache.h"
#import <KakaoOpenSDK/KakaoOpenSDK.h>
#import "ConfigConstants.h"

typedef NS_ENUM (NSInteger, TalkFriendOptionType) {
    TalkFriendOptionTypeAll = 1,
    TalkFriendOptionTypeInvitable,
    TalkFriendOptionTypeRegistered
};

@interface MessageViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) UISearchController *searchController;

@property (strong, nonatomic) NSMutableArray *allFriends;
@property (strong, nonatomic) NSMutableArray *filteredFriends;
@property (strong, nonatomic) NSString *searchText;

@property (strong, nonatomic) KOFriendContext *friendContext;

@property (weak, nonatomic) id selectedFriend;
@property (assign, nonatomic) TalkFriendOptionType optionType;
@property (assign, nonatomic) NSInteger limitCount;
@property (assign, nonatomic, getter=isRequesting) BOOL requesting;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.allFriends = [NSMutableArray array];
    self.filteredFriends = [NSMutableArray array];
    self.optionType = TalkFriendOptionTypeAll;
    self.limitCount = 2000;
    
    UISearchController *searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    searchController.searchBar.delegate = self;
    searchController.hidesNavigationBarDuringPresentation = NO;
    self.searchController = searchController;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self requestMe];
}

- (void)updateViews {
    [self.filteredFriends removeAllObjects];
    [self.allFriends enumerateObjectsUsingBlock:^(id _Nonnull friend, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *nickName = nil;
        if ([friend isKindOfClass:[KOFriend class]]) {
            nickName = [friend nickName];
        } else if ([friend isKindOfClass:[KOUserMe class]]) {
            nickName = [friend properties][@"nickname"];
        }
        
        if (self.searchText.length == 0 || [nickName rangeOfString:self.searchText options:NSCaseInsensitiveSearch].location != NSNotFound) {
            [self.filteredFriends addObject:friend];
        }
    }];
    [self.tableView reloadData];
}

- (void)requestMe {
    [KOSessionTask userMeTaskWithCompletion:^(NSError *error, KOUserMe *me) {
        if (error) {
            NSLog(@"requestMe error = %@", error);
            if (error.code == KOErrorCancelled) {
                [self.navigationController popViewControllerAnimated:YES];
            }
        } else {
            [self.allFriends addObject:me];
            
            [self setupFriendContext];
            [self requestTalkFriends];
        }
    }];
}

- (void)setupFriendContext {
    switch (self.optionType) {
        case TalkFriendOptionTypeInvitable:
            self.friendContext = [KOFriendContext contextWithServiceType:KOFriendServiceTypeTalk filterType:KOFriendFilterTypeInvitableNotRegistered limit:self.limitCount];
            break;
        case TalkFriendOptionTypeRegistered:
            self.friendContext = [KOFriendContext contextWithServiceType:KOFriendServiceTypeTalk filterType:KOFriendFilterTypeRegistered limit:self.limitCount];
            break;
        default:
            self.friendContext = [KOFriendContext contextWithServiceType:KOFriendServiceTypeTalk filterType:KOFriendFilterTypeAll limit:self.limitCount];
            break;
    }
}

- (void)requestTalkFriends {
    if (self.friendContext == nil) {
        NSLog(@"friendContext must be setup.");
        return;
    }
    
    if (self.isRequesting || !self.friendContext.hasMoreItems) {
        return;
    }
    
    self.requesting = YES;
    [KOSessionTask friendsWithContext:self.friendContext completionHandler:^(NSArray *friends, NSError *error) {
        if (error) {
            NSLog(@"friends error = %@", error);
            if (error.code == KOErrorCancelled) {
                [self.navigationController popViewControllerAnimated:YES];
            }
        } else {
            self.title = [NSString stringWithFormat:@"Friends (%@)", self.friendContext.totalCount];
            [self.allFriends addObjectsFromArray:friends];
            [self updateViews];
        }
        
        self.requesting = NO;
    }];
}

- (IBAction)selectOptions:(id)sender {
    [UIAlertController showAlertWithTitle:@""
                                  message:@"Options?"
                                  actions:@[[UIAlertAction actionWithTitle:@"Cancel"
                                                                     style:UIAlertActionStyleCancel
                                                                   handler:nil],
                                            [UIAlertAction actionWithTitle:@"All"
                                                                     style:UIAlertActionStyleDefault
                                                                   handler:^(UIAlertAction * _Nonnull action) { [self setOption:TalkFriendOptionTypeAll]; }],
                                            [UIAlertAction actionWithTitle:@"Invitable, Not App Registered"
                                                                     style:UIAlertActionStyleDefault
                                                                   handler:^(UIAlertAction * _Nonnull action) { [self setOption:TalkFriendOptionTypeInvitable]; }],
                                            [UIAlertAction actionWithTitle:@"App Registered"
                                                                     style:UIAlertActionStyleDefault
                                                                   handler:^(UIAlertAction * _Nonnull action) { [self setOption:TalkFriendOptionTypeRegistered]; }],
                                            ]];
}

- (void)setOption:(TalkFriendOptionType)optionType {
    self.optionType = optionType;
    [self.allFriends removeAllObjects];
    [self updateViews];
    
    if (self.optionType == TalkFriendOptionTypeAll) {
        [self requestMe];
    } else {
        [self setupFriendContext];
        [self requestTalkFriends];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 52;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.filteredFriends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ThumbnailImageViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[ThumbnailImageViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    id anyObject = self.filteredFriends[indexPath.row];
    
    if ([anyObject isKindOfClass:[KOUserMe class]]) {
        KOUserMe *me = (KOUserMe *)anyObject;
        
        cell.textLabel.text = @"ToMe(나와의 채팅방)";
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:me.properties[@"thumbnail_image"]]
                          placeholderImage:[UIImage imageNamed:@"PlaceHolder"]];
    } else {
        KOFriend *friend = (KOFriend *)anyObject;
        
        cell.textLabel.text = friend.nickName;
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:friend.thumbnailURL]
                          placeholderImage:[UIImage imageNamed:@"PlaceHolder"]];
    }
    
    NSInteger count = self.filteredFriends.count;
    if (indexPath.row > (count - count / 3)) {
        [self requestTalkFriends];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.selectedFriend = self.filteredFriends[indexPath.row];
    
    [UIAlertController showAlertWithTitle:@""
                                  message:@"Send Message?"
                                  actions:@[[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil],
                                            [UIAlertAction actionWithTitle:@"OK"
                                                                     style:UIAlertActionStyleDefault
                                                                   handler:^(UIAlertAction * _Nonnull action) {
                                                                       [self sendTemplateMessage];
                                                                   }]
                                            ]];
}

- (void)sendTemplateMessage {
    if (self.selectedFriend == nil) {
        return;
    }
    
    if ([self.selectedFriend isKindOfClass:[KOUserMe class]]) {
        KOUserMe *me = (KOUserMe *)self.selectedFriend;
        
        [me sendMemoWithTemplateId:MESSAGE_VIEW_CONTROLLER_MEMO_TEMPLATE_ID
                      templateArgs:@{@"MESSAGE":@"안녕하세요? 나와의 채팅방으로 보낸 메세지입니다.", @"DATE":@"2016-XX-XX(objective-c)"}
                 completionHandler:^(NSError *error) {
                     if (error) {
                         if (error.code != KOErrorOperationInProgress) {
                             [UIAlertController showMessage:[NSString stringWithFormat:@"message send failed = %@", error]];
                         }
                     } else {
                         [UIAlertController showMessage:@"message send succeed."];
                     }
                 }];
    } else {
        KOFriend *friend = (KOFriend *)self.selectedFriend;
        
        if (!friend.allowedTalkMessaging) {
            [UIAlertController showMessage:@"friend set message blocked."];
            return;
        }
        
        if (self.optionType == TalkFriendOptionTypeRegistered) {
            NSString *templateID = MESSAGE_VIEW_CONTROLLER_MESSAGE_TEMPLATE_ID;  // feed template message id
            [friend sendMessageWithTemplateId:templateID
                                 templateArgs:@{@"msg":@"새로운 연결, 새로운 세상.", @"iphoneMarketParam":@"test", @"iphoneExecParam":@"test"}
                            completionHandler:^(NSError *error) {
                                if (error) {
                                    if (error.code != KOErrorOperationInProgress) {
                                        [UIAlertController showMessage:[NSString stringWithFormat:@"message send failed = %@", error]];
                                    }
                                } else {
                                    [UIAlertController showMessage:@"message send succeed."];
                                }
                            }];
        } else {
            NSString *templateID = MESSAGE_VIEW_CONTROLLER_INVITE_TEMPLATE_ID;  // invite template message id
            [friend sendMessageWithTemplateId:templateID
                                 templateArgs:@{@"name":friend.nickName, @"iphoneMarketParam":@"test", @"iphoneExecParam":@"test"}
                            completionHandler:^(NSError *error) {
                                if (error) {
                                    if (error.code != KOErrorOperationInProgress) {
                                        [UIAlertController showMessage:[NSString stringWithFormat:@"message send failed = %@", error]];
                                    }
                                } else {
                                    [UIAlertController showMessage:@"message send succeed."];
                                }
                            }];
        }
    }
    
    self.selectedFriend = nil;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    self.searchText = searchText;
    [self updateViews];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    searchBar.text = self.searchText;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    searchBar.text = self.searchText;
}

@end
