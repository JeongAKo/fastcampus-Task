import UIKit

class SecondViewController: UIViewController {
  
  var currentUser: User?
  
  let userImageView: UIImageView = UIImageView()
  let greetingLabel: UILabel = UILabel()
  let backButton: UIButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = .white
    
    if let user = currentUser {
      userImageView.image = UIImage(named: user.profileImageName)
      greetingLabel.text = "\(user.name)님 환영합니다."
    }
    
    configureLayout()
    
  }
  
  func configureLayout() {
    userImageView.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
    self.view.addSubview(userImageView)
    
    greetingLabel.frame = CGRect(x: 100, y: 350, width: 200, height: 200)
    greetingLabel.font = UIFont.systemFont(ofSize: 30)
    self.view.addSubview(greetingLabel)
    
    backButton.frame = CGRect(x: 20, y: 50, width: 30, height: 30)
    backButton.setImage(UIImage(named: "exit"), for: .normal)
    backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
    self.view.addSubview(backButton)
  }
  
  
  @objc func back(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
}
