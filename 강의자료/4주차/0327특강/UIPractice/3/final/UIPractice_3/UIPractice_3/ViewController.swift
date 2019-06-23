import UIKit

class ViewController: UIViewController {
    
    var totalCount: Int = 0 {
        didSet {
            totalLabel.text = "\(totalCount)"
        }
    }
    
    let beverages: [Beverage] = [
        Beverage(name: "코카콜라", imageName: "coke", price: 1500),
        Beverage(name: "쥬스", imageName: "juice", price: 1200),
        Beverage(name: "립톤", imageName: "lipton", price: 1700),
        Beverage(name: "펩시", imageName: "pepsi", price: 1300)
    ]
    
    // IBOutlet
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var beverageView1: UIView!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var titleLabel1: UILabel!
    @IBOutlet weak var priceLabel1: UILabel!
    @IBOutlet weak var purchageButton1: UIButton!
    
    @IBOutlet weak var beverageView2: UIView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var titleLabel2: UILabel!
    @IBOutlet weak var priceLabel2: UILabel!
    @IBOutlet weak var purchageButton2: UIButton!
    
    @IBOutlet weak var beverageView3: UIView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var titleLabel3: UILabel!
    @IBOutlet weak var priceLabel3: UILabel!
    @IBOutlet weak var purchageButton3: UIButton!
    
    @IBOutlet weak var beverageView4: UIView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var titleLabel4: UILabel!
    @IBOutlet weak var priceLabel4: UILabel!
    @IBOutlet weak var purchageButton4: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAttribute()
    }
    
    func configureAttribute() {
        totalLabel.text = "\(totalCount)"
        
        let beverage1 = beverages[0]
        imageView1.image = UIImage(named: beverage1.imageName)
        titleLabel1.text = beverage1.name
        priceLabel1.text = "\(beverage1.price)"
//        corner(to: beverageView1, with: 10)
        
        let beverage2 = beverages[1]
        imageView2.image = UIImage(named: beverage2.imageName)
        titleLabel2.text = beverage2.name
        priceLabel2.text = "\(beverage2.price)"
        corner(to: beverageView2, with: 10)
        
        let beverage3 = beverages[2]
        imageView3.image = UIImage(named: beverage3.imageName)
        titleLabel3.text = beverage3.name
        priceLabel3.text = "\(beverage3.price)"
        corner(to: beverageView3, with: 10)
        
        let beverage4 = beverages[3]
        imageView4.image = UIImage(named: beverage4.imageName)
        titleLabel4.text = beverage4.name
        priceLabel4.text = "\(beverage4.price)"
        corner(to: beverageView4, with: 10)
    }
    
    @IBAction func purchase(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            totalCount += beverages[0].price
        case 2:
            totalCount += beverages[1].price
        case 3:
            totalCount += beverages[2].price
        case 4:
            totalCount += beverages[3].price
        default:
            break
        }
    }
    
    func corner(to targetView: UIView, with radious: CGFloat) {
        targetView.layer.cornerRadius = radious
        targetView.clipsToBounds = true
        targetView.layer.masksToBounds = true
    }
}

