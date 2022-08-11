

import UIKit

protocol CreateRequestProtocol{
    func apiCreatePost(post: Post)
}

protocol CreateResponseProtocol{
    func createPost(isCreated: Bool)
}

class CreateViewController: BaseViewController, CreateResponseProtocol {
    var item = Post()
    
    var presenter: CreateRequestProtocol!
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var bodyText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViper()
       
    }
    
    
    func configureViper(){
        let manager = HttpManager()
        let presenter = CreatePresenter()
        let interactor = CreateInteractor()
        let routing = CreateRouting()
        
        presenter.controller = self
        
        self.presenter = presenter
        presenter.interactor = interactor
        presenter.routing = routing
        routing.viewController = self
        interactor.manager = manager
        interactor.response = self
    }

    @IBAction func createTapped(_ sender: Any) {
        if titleText.text != "" && bodyText.text != "" {
            presenter.apiCreatePost(post: Post(title: titleText.text!, body: bodyText.text!))
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        }
    }
    
    func createPost(isCreated: Bool) {
        if isCreated {
            self.navigationController?.popViewController(animated: true)
        }else{
            
        }
    }
}
