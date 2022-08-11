
import Alamofire
import UIKit


protocol EditRequestProtocol {
    func apiCallPost(id: Int)
    func apiEditPost(id: Int, post: Post)
}

protocol EditResponseProtocol {
    func onCallPost(post: Post)
    func onEditPost(result: Bool)
}


class EditViewController: BaseViewController, EditResponseProtocol {
    
    var presenter: EditRequestProtocol!
    
    @IBOutlet weak var bText: UITextField!
    @IBOutlet weak var nText: UITextField!
    
    var ContactID: String = "1"
    var Information : Post = Post()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViper()
        presenter.apiCallPost(id: Int(ContactID) ?? 0)
    }

    func initViews()  {
       
        
        DispatchQueue.main.async {
            self.bText.text = self.Information.body!
            self.nText.text = self.Information.title!
        }
        
    }
    
    func configureViper(){
        let manager = HttpManager()
        let presenter = EditPresenter()
        let interactor = EditInteractor()
        let routing = EditRouting()
        
        presenter.controller = self
        
        self.presenter = presenter
        presenter.interactor = interactor
        presenter.routing = routing
        routing.viewController = self
        interactor.manager = manager
        interactor.response = self
    }
    
    func onCallPost(post: Post) {
        self.hideProgress()
        Information = post
        initViews()
    }
    
    func onEditPost(result: Bool) {
        self.hideProgress()
        if result {
            self.dismiss(animated: true, completion: nil)
        }else{
            
        }
    }
    


    
    @IBAction func editTapped(_ sender: Any) {
        presenter.apiEditPost(id: Int(ContactID)!, post: Post(title: nText.text!, body: bText.text!))
    }
    
}
