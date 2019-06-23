import UIKit

class ViewController: UIViewController {
    
    var totalCount = 0
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var get: UIButton!
    
    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var total: UILabel!
    
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var name2: UILabel!
    @IBOutlet weak var price2: UILabel!
    @IBOutlet weak var get2: UIButton!
    
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var name3: UILabel!
    @IBOutlet weak var price3: UILabel!
    @IBOutlet weak var get3: UIButton!
    
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var name4: UILabel!
    @IBOutlet weak var price4: UILabel!
    @IBOutlet weak var get4: UIButton!
    
    
    let beverages: [Beverage] = [
        Beverage(name: "코카콜라", imageName: "coke", price: 1500),
        Beverage(name: "쥬스", imageName: "juice", price: 1200),
        Beverage(name: "립톤", imageName: "lipton", price: 1700),
        Beverage(name: "펩시", imageName: "pepsi", price: 1300)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAttribute()
    }
    

    
    @IBAction func perchase(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            totalCount += beverages[0].price
            total.text = String(totalCount)
        case 1:
            totalCount += beverages[1].price
            total.text = String(totalCount)
        case 2:
            totalCount += beverages[2].price
            total.text = String(totalCount)
        case 3:
            totalCount += beverages[3].price
            total.text = String(totalCount)
        default:
            break
            
        }
    }
    
    
    func configureAttribute() {
        
       let beverage1 = beverages[0]
        image.image = UIImage(named: beverage1.imageName)
        name.text = beverage1.name
        price.text = String(beverage1.price)
        corner(to: container, with: 10)
        corner(to: get, with: 10)
        
        let berverage2 = beverages[1]
        image2.image = UIImage(named: berverage2.imageName)
        name2.text = berverage2.name
        price2.text = String(berverage2.price)
        
        
        let beverage3 = beverages[2]
        image3.image = UIImage(named: beverage3.imageName)
        name3.text = beverage3.name
        price3.text = String(beverage3.price)
        
        let beverage4 = beverages[3]
        image4.image = UIImage(named: beverage4.imageName)
        name4.text = beverage4.name
        price4.text = String(beverage4.price)



    }
    

    
    func corner(to targetView: UIView, with radious: CGFloat) {
        targetView.layer.cornerRadius = radious
        targetView.clipsToBounds = true
        targetView.layer.masksToBounds = true
    }
}

