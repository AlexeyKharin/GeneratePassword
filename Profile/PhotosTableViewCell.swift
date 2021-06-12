



import UIKit

class PhotosTableViewCell:  UICollectionViewCell {
   
    var photo: Photo? {
        didSet {
            photoFromGallary.image = photo?.image
            print("Фото загружено")
        }
    }
    

    
    private let photoFromGallary: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 6
        iv.toAutoLayout()
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        contentView.addSubview(photoFromGallary)
        
      let constraints = [
        photoFromGallary.topAnchor.constraint(equalTo: contentView.topAnchor),
        photoFromGallary.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        photoFromGallary.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        photoFromGallary.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
      ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
