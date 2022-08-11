

import Foundation

protocol HomePresenterProtocol: HomeRequestProtocol{
    func apiPostList()
    func apiPostDelete(post: Post)
    
    func navigateCreateScreen()
    func navigateEditScreen()
}

class HomePresenter: HomePresenterProtocol{
//    var manager: HttpManager!
    var interactor: HomeInteractorProtocol!
    var routing: HomeRoutingProtocol!
    var controller: BaseViewController!
    
   
    func apiPostList() {
        controller.showProgress()
        interactor.apiPostList()
    }
    
    func apiPostDelete(post: Post) {
        controller.showProgress()
        interactor.apiPostdelete(post: post)
    }
    
    func navigateCreateScreen() {
        routing.navigateCreateScreen()
    }
    
    func navigateEditScreen() {
        routing.navigateEditScreen()
    }
    
}
