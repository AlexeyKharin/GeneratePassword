
import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.toAutoLayout()
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        tableView.register(ProfileHeaderForSectionOne.self, forHeaderFooterViewReuseIdentifier: String(describing: ProfileHeaderForSectionOne.self))
        return tableView
    }()
//    MARK:- Hide NavigationBar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = . white
        view.addSubview(tableView)
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}


// MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Strotage.collection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Strotage.collection[section].imageContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: PostTableViewCell.self),
            for: indexPath) as! PostTableViewCell
        
        cell.content = Strotage.collection[indexPath.section].imageContent[indexPath.row]
        
        return cell
    }
}
// MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
    let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: ProfileHeaderForSectionOne.self)) as! ProfileHeaderForSectionOne
            headerView.profileHeder = Strotage.collection[section]
        headerView.collection.delegate = self
        headerView.delegate = self
            return headerView
    }
}

//MARK:- Call GallaryPhotosUINavigationController
protocol CellDelegate {
    func openGallaryPhotosUINavigationController()
}

extension ProfileViewController: CellDelegate {
    func openGallaryPhotosUINavigationController() {
        let vc = GallaryPhotosUINavigationController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
