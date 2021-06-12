


import UIKit
class  ProfileFooterForSection: UITableViewHeaderFooterView  {
    
    var descript: PostContent? {
        didSet {
            descriptionLabel.text = descript?.discreption
            viewLabel.text = descript?.views
            likeLabel.text = descript?.likes
        }
    }
   
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        [likeLabel, viewLabel, descriptionLabel].forEach { contentView.addSubview($0) }
        let constraints = [
           
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
