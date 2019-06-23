import UIKit

class ViewController: UIViewController {
    
    private let topContainerView: UIView = UIView()
    private let thumbnailView: UIImageView = UIImageView()
    private let titleView: UIView = UIView()
    private let descriptionView: UIView = UIView()
    
    private let bottomContainerView: UIView = UIView()
    private let redView: UIView = UIView()
    private let greenView: UIView = UIView()
    private let blueView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
    }
    
    private func configureLayout() {
        
        // Configure UI
        let outerPadding: CGFloat = 10
        let innerPadding: CGFloat = 5
        
        // TopContainerView
        topContainerView.backgroundColor = UIColor.darkGray
        let topContainerViewWidth = self.view.frame.width - (outerPadding * 2)
        let topContainerViewHeight: CGFloat = 100
        topContainerView.frame = CGRect(x: 10, y: 10, width: topContainerViewWidth, height: topContainerViewHeight)
        self.view.addSubview(topContainerView)
        
        // ThumbnailView
        thumbnailView.backgroundColor = .orange
        let thumbnailViewWidth: CGFloat = 100
        let thumbnailViewHeight: CGFloat = topContainerViewHeight - (innerPadding * 2)
        thumbnailView.frame = CGRect(x: 5, y: 5, width: thumbnailViewWidth, height: thumbnailViewHeight)
        topContainerView.addSubview(thumbnailView)
        
        // TitleView
        titleView.backgroundColor = .blue
        let titleViewWidth: CGFloat = topContainerViewWidth - (innerPadding * 3) - 100
        let titleViewHeight: CGFloat = (topContainerViewHeight - (innerPadding * 3)) / 2
        titleView.frame = CGRect(x: 10 + thumbnailViewWidth, y: 5, width: titleViewWidth, height: titleViewHeight)
        self.topContainerView.addSubview(titleView)
        
        // DescriptionView
        descriptionView.backgroundColor = .blue
        let descriptionViewWidth: CGFloat = titleViewWidth
        let descriptionViewHeight: CGFloat = titleViewHeight
        descriptionView.frame = CGRect(x: 10 + thumbnailViewWidth, y: 10 + titleViewHeight, width: descriptionViewWidth, height: descriptionViewHeight)
        self.topContainerView.addSubview(descriptionView)
        
        // BottomContainerView
        bottomContainerView.backgroundColor = .orange
        let containerViewWidth = self.view.frame.width - (outerPadding * 2)
        let containerViewHeight = self.view.frame.height - (outerPadding * 3) - topContainerViewHeight
        bottomContainerView.frame = CGRect(x: 10, y: 20 + topContainerViewHeight, width: containerViewWidth, height: containerViewHeight)
        self.view.addSubview(bottomContainerView)
        
        let width = containerViewWidth - (innerPadding * 2)
        let height = (containerViewHeight - (innerPadding * 4)) / 3
        
        // RedView
        redView.backgroundColor = .red
        redView.frame = CGRect(x: 5, y: 5, width: width, height: height)
        bottomContainerView.addSubview(redView)
        
        // GreenView
        greenView.backgroundColor = .green
        greenView.frame = CGRect(x: 5, y: 10 + height, width: width, height: height)
        bottomContainerView.addSubview(greenView)
        
        // BlueView
        blueView.backgroundColor = .blue
        blueView.frame = CGRect(x: 5, y: 15 + (height * 2), width: width, height: height)
        bottomContainerView.addSubview(blueView)
    }
}

