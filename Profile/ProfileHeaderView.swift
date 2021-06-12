
import UIKit

class ProfileHeaderView: UIView {
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//    

    @IBOutlet weak var image: UIImageView! {
            didSet {
        image.image = UIImage(named: "Lion")
        image.layer.borderWidth = 0
        image.layer.borderColor = UIColor.white.cgColor
        image.clipsToBounds = true
                image.layer.cornerRadius = image.frame.height / 2
    }
}

    @IBOutlet weak var label: UILabel! {
        didSet {
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "Hipster cat"
        label.textColor = .black
        label.backgroundColor = .lightGray
        }
    }
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
   }()
    
       @objc func buttonPressed() {
           guard textField.text?.count != 0 else { return labelTwo.text = "Waiting for sonething..." }
           labelTwo.text = textField.text
       }
    
    @IBOutlet weak var labelTwo: UILabel! {
        didSet {
            labelTwo.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            labelTwo.textColor = .gray
            labelTwo.backgroundColor = .lightGray
            labelTwo.text = "Waiting for sonething..."
            
        }
    }
//
    @IBOutlet weak var textField: UITextField! {
        didSet {
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
    }
    }
//
    
    
    


//    @IBAction func type(_ sender: Any) {
//        statusText
//        print(statusText ?? "HI")
//    }

//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

}
