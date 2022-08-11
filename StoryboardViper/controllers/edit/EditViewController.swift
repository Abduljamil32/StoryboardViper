
import Alamofire
import UIKit

class EditViewController: BaseViewController {

    @IBOutlet weak var bText: UITextField!
    @IBOutlet weak var nText: UITextField!
    
    var editPost: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
    }

    func initViews()  {
        nText.text = editPost?.title
        bText.text = editPost?.body
        
    }

    func apiEditPost(post: Post){
        showProgress()
        AFHttp.put(url: AFHttp.API_POST_UPDATE + post.id!, params: AFHttp.paramsPostUpdate(post: post), handler: { response in
            self.hideProgress()
            switch response.result{
            case .success:
                print(response.result)
                
            case let .failure(error):
                print(error)
            }
        })
    }
    
    @IBAction func editTapped(_ sender: Any) {
        apiEditPost(post: Post(id: (editPost?.id!)!, title: nText.text!, body: bText.text!))
    }
    
}
