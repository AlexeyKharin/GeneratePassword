

import UIKit

class GallaryPhotosUINavigationController: UIViewController {
    
    private let layout = UICollectionViewFlowLayout()
  
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.toAutoLayout()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            PhotoForGalleryCell.self,
            forCellWithReuseIdentifier: String(describing: PhotoForGalleryCell.self)
        )
        return collectionView
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo Galery"
        view.backgroundColor = .white
        layout.scrollDirection = .vertical
        view.addSubview(collectionView)
    }
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        collectionView.frame = CGRect(
            x: .zero,
            y: view.safeAreaInsets.top,
            width: view.bounds.width,
            height: view.bounds.height - view.safeAreaInsets.top
        )
    }
}

extension GallaryPhotosUINavigationController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Gallary.gallary.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Gallary.gallary[section].repository.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let photoInGallary = Gallary.gallary[indexPath.section].repository[indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: PhotoForGalleryCell.self),
            for: indexPath) as! PhotoForGalleryCell
        cell.photo = photoInGallary
        
        return cell
    }
}

extension GallaryPhotosUINavigationController: UICollectionViewDelegateFlowLayout {

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            let width: CGFloat = (collectionView.bounds.width - 8 * 4) / 3
            return CGSize(width: width, height: width)
        }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: .zero, left: 8, bottom: 20, right: 8)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
    }
}

