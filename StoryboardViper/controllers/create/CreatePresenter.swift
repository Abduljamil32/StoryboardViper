import Foundation

protocol CreatePresenterProtocol: CreateRequestProtocol {
    func apiPostCreate(post: Post)
    
}

class CreatePresenter: CreatePresenterProtocol{
    func apiPostCreate(post: Post) {
        controller.showProgress()
        interactor.apiPostCreate(post: post)
    }
    
    
    func apiCreatePost(post: Post) {
        controller.showProgress()
        interactor.apiPostCreate(post: post)
    }
    
    
    var interactor: CreateInteractorProtocol!
    var routing: CreateRoutingProtocol!
    var controller: BaseViewController!
    
   
    
}
