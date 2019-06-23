import UIKit

class ViewController: UIViewController {
    
    private let containerView: UIView = UIView()
    private let redView: UIView = UIView()
    private let greenView: UIView = UIView()
    private let blueView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
    }
    
    private func configureLayout() {
        
        // Configure UI
        let padding: CGFloat = 10
        
        // ContainerView
        containerView.backgroundColor = .orange
        let containerViewWidth = self.view.frame.width - (padding * 2)
        let containerViewHeight = self.view.frame.height - (padding * 2)
        containerView.frame = CGRect(x: 10, y: 10, width: containerViewWidth, height: containerViewHeight)
        self.view.addSubview(containerView)
        
        let width = containerViewWidth - (padding * 2)
        let height = (containerViewHeight - (padding * 4)) / 3
        
        // RedView
        redView.backgroundColor = .red
        redView.frame = CGRect(x: 10, y: 10, width: width, height: height)
        containerView.addSubview(redView)
        
        // GreenView
        greenView.backgroundColor = .green
        greenView.frame = CGRect(x: 10, y: 20 + height, width: width, height: height)
        containerView.addSubview(greenView)
        
        // BlueView
        blueView.backgroundColor = .blue
        blueView.frame = CGRect(x: 10, y: 30 + (height * 2), width: width, height: height)
        containerView.addSubview(blueView)
    }
}

