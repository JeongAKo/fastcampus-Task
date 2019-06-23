import UIKit

class ViewController: UIViewController {
    

    let orangeView = UIView()
    
    let redView = UIView()
    let greenView = UIView()
    let blueView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let padding: CGFloat = 5
        
        orangeView.frame = CGRect(x: 10, y: 120, width: view.frame.width - 20, height: view.frame.height - 130)
        orangeView.backgroundColor = .orange
       
        let orangeViewWidth = orangeView.frame.width
        let orangeViewHeight = orangeView.frame.height
        
        let width = orangeViewWidth - (padding * 2)
        let height = (orangeViewHeight - (padding * 4)) / 3

        
        redView.frame = CGRect(x: 5 , y: 5, width: width, height: height)
         redView.backgroundColor = .red
        
      
       greenView.frame = CGRect(x: 5 , y: height + ( padding * 2 ), width: width, height: height)
         greenView.backgroundColor = .green
        
 
        blueView.frame = CGRect(x: 5 , y: height * 2 + ( padding * 3 ), width: width, height: height)
         blueView.backgroundColor = .blue
        
        
        
        view.addSubview(orangeView)
        orangeView.addSubview(redView)
        orangeView.addSubview(greenView)
        orangeView.addSubview(blueView)

    }
    
    
}

