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

#import "FriendsViewController.h"
#import "ThumbnailImageViewCell.h"
#import "UIAlertController+Addition.h"
#import "UIImageView+WebCache.h"
#import <KakaoOpenSDK/KakaoOpenSDK.h>

typedef NS_ENUM (NSInteger, FriendOptionType) {
    FriendOptionTypeTalkAll = 1,
    FriendOptionTypeTalkRegistered,
    FriendOptionTypeTalkInvitable,
    FriendOptionTypeTalkAndStoryAll,
    FriendOptionTypeTalkAndStoryRegistered,
    FriendOptionTypeTalkAndStoryInvitable
};

@interface FriendsViewController() <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) UISearchController *searchController;

@property (strong, nonatomic) NSMutableArray *allFriends;
@property (strong, nonatomic) NSMutableArray *filteredFriends;
@property (strong, nonatomic) NSString *searchText;

@property (strong, nonatomic) KOFriendContext *friendContext;

@property (assign, nonatomic) FriendOptionType optionType;
@property (assign, nonatomic) NSInteger limitCount;
@property (assign, nonatomic, getter=isRequesting) BOOL requesting;

@end

@implementation FriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.allFriends = [NSMutableArray array];
    self.filteredFriends = [NSMutableArray array];
    self.optionType = FriendOptionTypeTalkAll;
    self.limitCount = 2000;

    UISearchController *searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    searchController.searchBar.delegate = self;
    searchController.hidesNavigationBarDuringPresentation = NO;
    self.searchController = searchController;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.tableView.tableFooterView = [[UIView alloc] init];

    [self setupFriendContext];
    [self requestTalkFriends];
}

- (void)updateViews {
    [self.filteredFriends removeAllObjects];
    [self.allFriends enumerateObjectsUsingBlock:^(KOFriend * _Nonnull friend, NSUInteger idx, BOOL * _Nonnull stop) {
        if (self.searchText.length == 0 || [friend.nickName rangeOfString:self.searchText options:NSCaseInsensitiveSearch].location != NSNotFound) {
            [self.filteredFriends addObject:friend];
        }
    }];
    [self.tableView reloadData];
}

- (void)setupFriendContext {
    switch (self.optionType) {
        case FriendOptionTypeTalkAll:
            self.friendContext = [KOFriendContext contextWithServiceType:KOFriendServiceTypeTalk filterType:KOFriendFilterTypeAll limit:self.limitCount];
            break;
        case FriendOptionTypeTalkRegistered:
            self.friendContext = [KOFriendContext contextWithServiceType:KOFriendServiceTypeTalk filterType:KOFriendFilterTypeRegistered limit:self.limitCount];
            break;
        case FriendOptionTypeTalkInvitable:
            self.friendContext = [KOFriendContext contextWithServiceType:KOFriendServiceTypeTalk filterType:KOFriendFilterTypeInvitableNotRegistered limit:self.limitCount];
            break;
        case FriendOptionTypeTalkAndStoryAll:
            self.friendContext = [KOFriendContext contextWithServiceType:KOFriendServiceTypeTalkAndStory filterType:KOFriendFilterTypeAll limit:self.limitCount];
            break;
        case FriendOptionTypeTalkAndStoryRegistered:
            self.friendContext = [KOFriendContext contextWithServiceType:KOFriendServiceTypeTalkAndStory filterType:KOFriendFilterTypeRegistered limit:self.limitCount];
            break;
        case FriendOptionTypeTalkAndStoryInvitable:
            self.friendContext = [KOFriendContext contextWithServiceType:KOFriendServiceTypeTalkAndStory filterType:KOFriendFilterTypeInvitableNotRegistered limit:self.limitCount];
            break;
        default:
            self.friendContext = nil;
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
            switch (error.code) {
                case KOErrorCancelled:
                    [self.navigationController popViewControllerAnimated:YES];
                    break;
                default:
                    [UIAlertController showMessage:error.description];
                    break;
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
                                            [UIAlertAction actionWithTitle:@"Talk (All)"
                                                                     style:UIAlertActionStyleDefault
                                                                   handler:^(UIAlertAction * _Nonnull action) { [self setOption:FriendOptionTypeTalkAll]; }],
                                            [UIAlertAction actionWithTitle:@"Talk (Registered)"
                                                                     style:UIAlertActionStyleDefault
                                                                   handler:^(UIAlertAction * _Nonnull action) { [self setOption:FriendOptionTypeTalkRegistered]; }],
                                            [UIAlertAction actionWithTitle:@"Talk (Invitable)"
                                                                     style:UIAlertActionStyleDefault
                                                                   handler:^(UIAlertAction * _Nonnull action) { [self setOption:FriendOptionTypeTalkInvitable]; }],
                                            [UIAlertAction actionWithTitle:@"TalkAndStory (All)"
                                                                     style:UIAlertActionStyleDefault
                                                                   handler:^(UIAlertAction * _Nonnull action) { [self setOption:FriendOptionTypeTalkAndStoryAll]; }],
                                            [UIAlertAction actionWithTitle:@"TalkAndStory (Registered)"
                                                                     style:UIAlertActionStyleDefault
                                                                   handler:^(UIAlertAction * _Nonnull action) { [self setOption:FriendOptionTypeTalkAndStoryRegistered]; }],
                                            [UIAlertAction actionWithTitle:@"TalkAndStory (Invitable)"
                                                                     style:UIAlertActionStyleDefault
                                                                   handler:^(UIAlertAction * _Nonnull action) { [self setOption:FriendOptionTypeTalkAndStoryInvitable]; }],
                                            ]];
}

- (void)setOption:(FriendOptionType)optionType {
    self.optionType = optionType;
    [self.allFriends removeAllObjects];
    [self updateViews];
    
    [self setupFriendContext];
    [self requestTalkFriends];
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
    
    KOFriend *friend = self.filteredFriends[indexPath.row];
    
    cell.textLabel.text = friend.nickName;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:friend.thumbnailURL]
                      placeholderImage:[UIImage imageNamed:@"PlaceHolder"]];
    
    NSInteger count = self.filteredFriends.count;
    if (indexPath.row > (count - count / 3)) {
        [self requestTalkFriends];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self showFriendInfo:self.filteredFriends[indexPath.row]];
}

- (void)showFriendInfo:(KOFriend *)friend {
    if (!friend) {
        return;
    }
    
    NSMutableString *message = [NSMutableString stringWithFormat:@"id:%@\nuuid:%@\nappRegistered:%@\nnickname:%@\nos:%@\nallowedTalkMessaging:%@\nrelations:",
                                friend.ID, friend.uuid,
                                (friend.appRegistered ? @"YES" : @"NO"), friend.nickName ,convertOSPropertyTypeString(friend.talkOS),
                                (friend.allowedTalkMessaging ? @"YES" : @"NO")];
    
    if (friend.talkRelation == KORelationValueFriend) {
        [message appendString:@" talk"];
    }
    if (friend.storyRelation == KORelationValueFriend) {
        [message appendString:@" story"];
    }
    
    [UIAlertController showMessage:message];
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
