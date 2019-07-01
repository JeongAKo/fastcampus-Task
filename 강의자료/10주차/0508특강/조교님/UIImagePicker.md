# UIImagePickerController

## 사용법 

1. UIImagePickerController 객체를 만듭니다.
2. UIImagePickerControllerDelegate와 UINavigationControllerDelegate 를 채택합니다.
3. UIImagePickerController 객체의 delegate에 자기 자신을 지정해줍니다. (ex) picker.delegate = self
4. UIImagePickerController 의 소스타입을 지정해줍니다. (카메라 혹은 라이브러리에서 가져오기) 
(ex) picker.sourceType = .camera

5. picker를 present 해줍니다.
(ex) present(picker, animated: true)

6. 라이브러리에서 이미지를 골랐거나 카메라로 사진을 찍은후 Use Photo 버튼을 눌렀을시에 UIImagePickerControllerDelegate 함수에 이벤트가 전달이 됩니다.
```swift
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let vc = AddFeedViewController()
        vc.image = info[.originalImage] as? UIImage
        navigationController?.pushViewController(vc, animated: true)
        picker.dismiss(animated: false, completion: nil)
        
    }

```
7. 사용자가 선택한 이미지가 info라는 인자 안에 딕셔너리 형태로 들어오게 됩니다. 원하는 형태의 이미지를 고른뒤 UIImage 타입으로 형변환을 해줍니다.
8. image가 들어오면 이미지를 사용하고 싶은 곳으로 전달해주고 picker는 dissmiss 를 호출해 닫아줍니다.


## 실습 
* 실습하기전에 
	* info.plist에서 권한 요청하기
	* Privacy - Camera Usage Description
	* Privacy - Photo Library Usage Description
	* FeedData에서 설명이 들어갈 변수 추가해주기
	* FeedData  이미지변수들의 타입을 string 타입에서 UIImage 로 바꿔주기

### 직접 찍은 사진으로 FeedData 추가하기

* image picker를 하나 만듭니다.
* HomeVC에서 카메라 버튼 이벤트에 따른 함수를 구현합니다.
* imagePicker 사용법에 따라 picker를 만들고 imagePicker의 delegate 함수에서 이미지를 받아옵니다.
* 이미지를 바로 feedData로 만들어서 추가할 수 있지만 인스타그램처럼 이미지 아래에 설명을 달아주기 위해서 새로운 뷰컨트롤러를 만듭니다.
* AddFeedViewController라는 TableVC를 만들고 그 안에 image를 받을 image라는 프로퍼티를 하나 만들어줍니다.
* tableView에 제가 만든 AddFeedTableViewCell을 등록합니다.
* 셀을 여러개 만들지 않기 때문에 numberOfRowInSection은 return 1 을 해줍니다.
* cellForRowAt 에서 위에서 등록된 셀을 가지고와 cell의 feedImageView.image에 프로퍼티로 선언해둔 image를 넣습니다. (이렇게 하면 이제 AddFeedViewController의 image에 이미지를 전달하면 셀의 이미지뷰에 들어가게됩니다.)
* 이제 공유버튼을 만들기 위해서 네비게이션의 오른쪽 아이템에 바 버튼을 하나 올려주고 액션함수를 붙여줍니다.
* 공유 버튼을 눌렀을때 동작하는 함수에서 셀의 정보를 받아와 FeedManager에 FeedData를 추가해줍니다.

```swift
// 공유버튼을 눌렀을때 호출 될 함수 
@objc private func shardItemDidTap(_ sender: UIBarButtonItem){
        guard let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? AddFeedTableViewCell else {return}
        var str =  cell.textView.text
        if cell.textView.text == "문구입력..."{
            str = ""
        }
        FeedManager.shared.addFeedData(FeedData(profileImage: user?.profileImage, nickName: user?.userName, feedImage: image, explanation: str))
        navigationController?.popViewController(animated: true)
    }

```

* 공유버튼을 누르면 이 뷰컨트롤러에서는 할일이 모두 끝났습니다. pop 해줍니다.
* ImagePikcerDelegate 함수에서 우리가 만든 AddFeedViewController를 인스턴스하고 이미지를 넣어준 뒤 네비게이션으로 푸쉬해줍니다. 
```swift
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let vc = AddFeedViewController()
        // 7 info 딕셔너리 안에서 이미지 꺼내 형변환 하기
        vc.image = info[.originalImage] as? UIImage
        navigationController?.pushViewController(vc, animated: true)
        // 8 picker 내려주기
        picker.dismiss(animated: false, completion: nil)
        
    }
```

* ViewWillAppear에서 데이터를 갱신시켜줍니다.
```swift
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 뷰가 나타날때 데이터를 갱신시켜요.
        feedDataArr = FeedManager.shared.returnFeedData()
    }
```

***


### 라이브러리에서 이미지 가져오기


* 라이브러리에서 이미지를 가져오기 위해선 picker.sourceType을  .photoLibrary로 설정해 주면 됩니다. 
* 예제에선 + 탭을 눌렀을때 라이브러리화면이 present 되도록 해보겠습니다.
* 우선 탭바 클래스를 하나 만들고 UITabBarControllerDelegate를 채택합니다.
* UIImagePickerController를 하나 인스턴스 합니다. 
* viewDidLoad() 에서 picker와 self.delegate에 self를 넣어줍니다.
* AppDelegate에서 해주던 뷰컨트롤러 생성 작업을 탭바컨트롤러 클래스로 옮겨줍니다.
* 탭바 델리게이트 메서드 중에 shouldSelect함수를 만들어줍니다.
* shouldSelect함수 구현부 입니다.
```swift
func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController == plusVC {
            // picker의 소스타입 선택해주기
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true, completion: nil)
            return false
        }
        return true
    }

```

* 지금 누른 탭바가 plusVC가 맞을때 이미지피커를 띄워줍니다.
* 여기까지 했다면 라이브러리에서 사진을 선택할 수 있습니다.
* 이미지피커 델리게이트와 네비게이션 델리게이트를 채택한 후 image를 받습니다.
* Notification을 이용해 HomeVC로 이미지를 보냅니다.
* picker를 dissmiss 해줍니다.
* HomeVC로 돌아가  addOpserver를 통해 탭바클래스에서 보낸 이미지를 받습니다.
* image를 받아 AddFeedViewController를 인스턴스한 뒤에 이미지를 넣고 푸쉬를 해 화면을 넘겨줍니다.


