# UserManager 만들기

* 유저매니저를 만들면 앱에서 상주하는 유저의 데이터를 단일 객체로 관리할 수 있어 편리합니다.

* 실습에서는 유저의 닉네임과 프로필 사진을 정하면 피드에 사진을 추가 했을 시에 그대로 적용되도록 해보겠습니다.

## 실습 


* 유저의 데이터를 정의합니다. ( User 구조체 만들기 )
* 유저 매니저 클래스 만들기 (싱글톤)
* 유저의 데이터를 가져오는 getUserInfo 함수와 changeUserInfo함수를 만들어줍니다.
	* getUserInfo함수는 completion 인자에 현재 매니저가 가지고 있는 user라는 변수를 전달합니다.
	* chageUserInfo함수는 변경된 유저정보를 받아 자신의 유저와 바꿔준뒤 바뀐 유저 변수를 completion인자에 전달합니다.
* MyViewController에 User타입의 user 변수를 만들어줍니다.
* MyViewController엔 두가지의 노티피케이션 옵저버가 있습니다. 미리 만들어둔 MyViewTableViewCell에서 두가지 이벤트를 받아옵니다. 
	* nickNameChange : 닉네임 수정 버튼을 눌렀을때 호출이 됩니다.
	* profileImageView: profile 이미지뷰를 눌렀을때 호출이 됩니다. 
* 먼저 프로필 이미지를 등록하는 방법입니다. 
	* 카메라로 찍어서 정할지, 앨범에서 가져올지 정하기 위해 alert창을 하나 띄워줍니다.
	* 카메라액션과 라이브러리액션의 handler에 picker의 소스타입을 정해준뒤 picker를 띄워줍니다.
	* UIImagePickerControllerDelegate로 가서 현재 클래스의 user.profileImage 에 이미지를 넣어줍니다.
	* userManager에서 만들어준 changeUserInfo 함수를 통해 변경된 유저를 전달하고 현재 유저를 업데이트 합니다.
	* 테이블뷰를 리로드 시키고 picker를 dissmiss 합니다.

* 닉네임을 정하는 방법입니다. 한번 정한 닉네임은 다시 정해지지 않도록 UserDefaults를 사용해서 중복검사를 구현해보겠습니다.
	* 유저 매니저로 돌아가 changeUserName 함수를 만듭니다.
	* chageUserName함수는 전달인자로 변경될 유저 이름과 completion을 통해 성공여부와 변경된 유저 이름을 전달하는 클로저를 가지고 있습니다.
	* 먼저 가드 문으로 이전에 유저 디폴트안에 유저이름 배열이 저장되 있는지 검사를 해봅니다.
	* 만약 처음 닉네임을 입력한것이라면 (UserDefault 안에 유저이름배열이 없다면) 현재 전달받은 유저이름을 담은 배열을 하나 유저디폴트에 저장합니다.
	* 매니저 클래스안의 user 변수에 유저이름을 저장하고 completion을 통해 변경성공여부와 변경된 유저이름을 전달합니다.
	* 만약 처음 닉네임을 입력한것이 아니라면 (else{} 로 빠지지 않았다면) 유저 이름 배열에서 같은 이름을 가진 유저이름이 있는지 검사합니다.
	* 만약 중복된 유저 이름이 있다면 completion을 통해 닉네임을 변경하지 못했다는 false와 중복된 닉네임이 있다는 메세지를 보내줍니다.
	* 중복된 이름이 없다면 배열에 유저이름을 추가하고 userDefaults를 업데이트 해줍니다.
	* 그리고 매니저 클래스의 유저에 이름을 업데이트 하고 completion을 통해 성공여부와 변경된 유저 이름을 전달합니다.
	* MyViewController로 돌아가 닉네임 버튼을 눌렀을때 띄울 Alert을 만듭니다.
	* okAction을 눌렀을때 userManger에서 getUserInfo를 호출해 현재 클래스의 유저를 업데이트 해줍니다.
	* 닉네임 수정버튼을 눌렀을때 동작하는 nickNameChange에서 Notification에서 받은 userName을 UserManager의 changeUserName을 호출합니다.
	* completion으로 전달된 성공여부와 메세지를 통해 Alert함수를 호출해 변경된 닉네임을 사용자에게 띄워줍니다.

* AddFeedViewController로 돌아가 user 변수를 만들고 공유버튼 부분에서 피드데이터를 추가할때 user의 데이터를 프로필과 닉네임 부분에 넣어줍니다.