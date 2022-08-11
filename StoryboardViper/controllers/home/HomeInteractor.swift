

import Foundation

protocol HomeInteractorProtocol{
    func apiPostList()
    func apiPostdelete(post: Post)
}

class HomeInteractor: HomeInteractorProtocol{
    var manager: HttpManagerProtocol!
    var response: HomeResponseProtocol!
    
    func apiPostList() {
        manager.apiPostList(completion: { (result) in
            self.response.postList(post: result)
        })
    }
    
    func apiPostdelete(post: Post) {
        manager.apiPostDelete(post: post, completion: { (result) in
            self.response.deletePost(isDel: result)
        })
    }
    
    
}
