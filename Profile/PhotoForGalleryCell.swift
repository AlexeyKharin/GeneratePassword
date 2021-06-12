//
//  PhotoForGalleryCell.swift
//  TableView-IOS-8 Kharin_ALEXEY
//
//  Created by Alexey Kharin on 14.02.2021.
//

import UIKit

class PhotoForGalleryCell: UICollectionViewCell {
   
    var photo: Photo? {
        didSet {
            photoInGallery.image = photo?.image
            print("Фото загружено")
        }
    }
    
    private let photoInGallery: UIImageView = {
        let photoInGallery = UIImageView()
        photoInGallery.clipsToBounds = true
        photoInGallery.toAutoLayout()
        return photoInGallery
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUp() {
        contentView.addSubview(photoInGallery)
        
      let constraints = [
        photoInGallery.topAnchor.constraint(equalTo: contentView.topAnchor),
        photoInGallery.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        photoInGallery.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        photoInGallery.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
      ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
