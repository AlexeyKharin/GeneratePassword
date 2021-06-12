

import UIKit

class PostViewController: UIViewController {
    
    static func storyboardInstance() -> PostViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: PostViewController.self)) as? PostViewController
    }
//    Вы можете использовать этот же подход для инициализации вью из nib:
//    class LoginView: UIView {
//        static func nibInstance() -> LoginView? {
//            let nib = Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)
//            return nib?.first as? LoginView
//        }
//    }
    

//
    var post: Post?
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = post?.title
    }
}
