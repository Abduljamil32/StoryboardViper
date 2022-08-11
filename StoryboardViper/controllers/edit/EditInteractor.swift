
import Foundation

protocol EditInteractorProtocol {
    func apiCallPost(id: Int)
    func apiEditPost(id: Int, post: Post)
}

class EditInteractor: EditInteractorProtocol{
   
    var manager: HttpManagerProtocol!
    var response: EditResponseProtocol!
    
    func apiCallPost(id: Int) {
        manager.apiCallPost(id: id) { post in
            self.response.onCallPost(post: post)
        }
    }
    
    func apiEditPost(id: Int, post: Post) {
        manager.apiEditPost(id: id, post: post) { result in
            self.response.onEditPost(result: result)
        }
    }
}
