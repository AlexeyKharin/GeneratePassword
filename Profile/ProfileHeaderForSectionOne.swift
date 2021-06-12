






import UIKit


final class ProfileHeaderForSectionOne: UITableViewHeaderFooterView {
    var profileHeder: PostContent? {
        didSet {
            image.image = profileHeder?.profileImage
            label.text = profileHeder?.profileName
        }
    }
    var delegate: CellDelegate?
    var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Lion")
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.clipsToBounds = true
        image.layer.cornerRadius = 50
        image.toAutoLayout()
        return image
    }()
    
    var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.backgroundColor = .lightGray
        label.toAutoLayout()
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        print("button \(type(of: self))")
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.toAutoLayout()
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonPressed() {
        guard textfield.text?.count != 0 else { return labeltwo.text = "Waiting for sonething..." }
        labeltwo.text = textfield.text
    }
    
    var labeltwo: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.toAutoLayout()
        label.backgroundColor = .lightGray
        label.text = "Waiting for sonething..."
        return label
    }()
    
    lazy var textfield: UITextField = {
        let textField = UITextField()
        print("textField \(type(of: self))")
        textField.backgroundColor = .white
        textField.toAutoLayout()
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.addTarget(self, action: #selector(statusTextChanged(textFieldQ:)), for: .editingChanged)
        return textField
    }()
    
    private var statusText: String?
    @objc func statusTextChanged(textFieldQ: UITextField) {
        statusText = textFieldQ.text!
        print(statusText ?? "HI")
    }
    
    var backgruond: UIView = {
        let backgruond = UIView()
        backgruond.toAutoLayout()
        backgruond.backgroundColor = .lightGray
        return backgruond
    }()
    
    var placeForCollection: UIView = {
        let placeForCollection = UIView()
        placeForCollection.toAutoLayout()
        placeForCollection.backgroundColor = .white
        return placeForCollection
    }()
    
    var collection: CallPfotosCell = {
        let collection = CallPfotosCell()
        collection.toAutoLayout()
        return collection
    }()
    
    let labePhoto: UILabel = {
    let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.toAutoLayout()
        label.backgroundColor = .white
        label.text = "Photos"
        return label
    }()
    
    lazy var buttonPhotos: UIButton = {
        let button = UIButton(type: .system)
        button.toAutoLayout()
        button.setImage(UIImage(systemName: "arrow.right")?.withTintColor(UIColor.systemRed).withRenderingMode(.alwaysOriginal), for:.normal)
        button.addTarget(self, action: #selector(callGallaryPhotos), for: .touchUpInside)
        return button
    }()
    @objc func callGallaryPhotos() {
        delegate?.openGallaryPhotosUINavigationController()
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(backgruond)
        [image, label, button, labeltwo, textfield, placeForCollection].forEach { backgruond.addSubview($0) }
        placeForCollection.addSubview(labePhoto)
        placeForCollection.addSubview(collection)
        placeForCollection.addSubview(buttonPhotos)
        
        let constraints = [
//
            backgruond.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgruond.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgruond.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            image.topAnchor.constraint(equalTo: backgruond.topAnchor, constant: 12),
            image.leadingAnchor.constraint(equalTo: backgruond.leadingAnchor, constant: 16),
            image.heightAnchor.constraint(equalToConstant: 100),
            image.widthAnchor.constraint(equalToConstant: 100),
            
            label.topAnchor.constraint(equalTo: backgruond.topAnchor, constant: 27),
            label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: backgruond.trailingAnchor, constant: -16),
            label.heightAnchor.constraint(equalToConstant: 20),
            
            labeltwo.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            labeltwo.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            labeltwo.trailingAnchor.constraint(equalTo: label.trailingAnchor),
            labeltwo.heightAnchor.constraint(equalToConstant: 25),
            
            
            textfield.topAnchor.constraint(equalTo: labeltwo.bottomAnchor, constant: 8),
            textfield.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            textfield.trailingAnchor.constraint(equalTo: label.trailingAnchor),
            textfield.heightAnchor.constraint(equalToConstant: 40),
            
            button.topAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 15),
            button.leadingAnchor.constraint(equalTo: backgruond.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: backgruond.trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 50),
            
            
            placeForCollection.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10),
            placeForCollection.leadingAnchor.constraint(equalTo: backgruond.leadingAnchor),
            placeForCollection.trailingAnchor.constraint(equalTo: backgruond.trailingAnchor),
           
            labePhoto.topAnchor.constraint(equalTo: placeForCollection.topAnchor, constant: 12),
            labePhoto.leadingAnchor.constraint(equalTo: placeForCollection.leadingAnchor, constant: 12),
            
            buttonPhotos.centerYAnchor.constraint(equalTo: labePhoto.centerYAnchor),
            buttonPhotos.trailingAnchor.constraint(equalTo: placeForCollection.trailingAnchor, constant: -12),
            buttonPhotos.heightAnchor.constraint(equalToConstant: 35),
            buttonPhotos.widthAnchor.constraint(equalToConstant: 35),
            
            collection.topAnchor.constraint(equalTo: labePhoto.bottomAnchor, constant: 12),
            collection.leadingAnchor.constraint(equalTo: placeForCollection.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: placeForCollection.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: placeForCollection.bottomAnchor),
            
            placeForCollection.bottomAnchor.constraint(equalTo: backgruond.bottomAnchor, constant: -8),
            
            backgruond.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    //
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
