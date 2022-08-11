import Foundation

protocol CreateInteractorProtocol {
    func apiPostCreate(post: Post)
}

class CreateInteractor: CreateInteractorProtocol{
    var manager: HttpManagerProtocol!
    var response: CreateResponseProtocol!
    
    func apiPostCreate(post: Post) {
        manager.apiCreatePost(post: post) { result in
            self.response.createPost(isCreated: result)
        }
    }

}
