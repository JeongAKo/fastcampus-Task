import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    @IBOutlet weak var login: UIButton!
    
    
    let users: [User] = [
        User(name: "Mike", profileImageName: "person1", password: "abcd"),
        User(name: "Allen", profileImageName: "person2", password: "1122"),
        User(name: "Kevin", profileImageName: "person3", password: "1234"),
        User(name: "Joke", profileImageName: "person4", password: "4321"),
        User(name: "Hillary", profileImageName: "person5", password: "aaaa"),
        User(name: "Jenny", profileImageName: "person6", password: "dcba"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func login(_ sender: Any) {
        guard let id = idTextField.text, !id.isEmpty else {
            //오류처리
            //경고창 띄워서 아이디가 없습니다란 경고찬 띄우기
            //함수를 종료
            alert(title: "아이디가 없습니다.", messege: "입력해주세요")
            return
        }
        guard let pw = pwTextField.text, !pw.isEmpty else {
            //오류처리
            //경고창 띄워서 비밀번호가 없습니다란 경고창 띄우기
            //함수를 종료
            alert(title: "비밀번호가 없습니다", messege: "입력해주세요")
            return
        }
        for user in users {
            if user.name == id && user.password == pw {
                print("success")
                //다움 뷰 컨트롤러를 프리젠트
                let secondViewController = SecondViewController()
             secondViewController.currentUser = user
                present(secondViewController, animated: true, completion: nil)
                
                return
                
            }
            alert(title: "아이디 또는 비밀번호가 없습니다", messege: "입력해주세요")
        }
    //사용자에세 아이디 또는 비밀번호가 없다는 경고창 띄우기
     
    }
    
    func alert(title: String, messege: String ) {
        let alertController = UIAlertController(title: title, message: messege, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    
    func corner(to targetView: UIView, with radious: CGFloat) {
        targetView.layer.cornerRadius = radious
        targetView.clipsToBounds = true
        targetView.layer.masksToBounds = true
    }
}

