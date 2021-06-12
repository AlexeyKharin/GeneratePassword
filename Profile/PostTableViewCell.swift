






import UIKit

class PostTableViewCell: UITableViewCell {
    
    var content: ImageContent? {
        didSet {
            titleLabel.text = content?.title
            deviceImageView.image = content?.image
            descriptionLabel.text = content?.discreption
            viewLabel.text = content?.views
            likeLabel.text = content?.likes
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        label.toAutoLayout()
        return label
    }()
    
    private let deviceImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .black
        iv.contentMode = .scaleAspectFit
        iv.toAutoLayout()
        return iv
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.toAutoLayout()
        label.numberOfLines = 0
        return label
    }()
    
    private let viewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.toAutoLayout()
        return label
    }()
    
    private let likeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.toAutoLayout()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        [deviceImageView, titleLabel, likeLabel, viewLabel, descriptionLabel ].forEach{ contentView.addSubview($0) }
        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            deviceImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            deviceImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            deviceImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            deviceImageView.heightAnchor.constraint(equalTo: deviceImageView.widthAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: deviceImageView.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            likeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            likeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            viewLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            viewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}


