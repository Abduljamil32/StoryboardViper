
import Foundation

protocol HomeRoutingProtocol{
    func navigateCreateScreen()
    func navigateEditScreen()
}

class HomeRouting: HomeRoutingProtocol{
    weak var viewController: HomeViewController!
    
    func navigateCreateScreen() {
        viewController.callCreateViewcontroller()
    }
    
    func navigateEditScreen() {
        let vc = EditViewController(nibName: "EditViewController", bundle: nil)
        
        viewController.callEditViewController(post: vc.editPost!)
       
    }
    
    
}
