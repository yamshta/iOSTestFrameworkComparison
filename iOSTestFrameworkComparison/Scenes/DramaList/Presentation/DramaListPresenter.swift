
import Foundation

protocol DramaListPresenter: class {
    var dramaList: DramaListModel { get }
    func fetchDramaList()
}

class DramaListPresenterImpl: DramaListPresenter {
    private weak var viewController: DramaListViewControllerOutput?
    private let wireframe: DramaListWireframe
    private let useCase: DramaListUseCase

    internal var dramaList = DramaListModel()

    init(viewController: DramaListViewControllerOutput, wireframe: DramaListWireframe, useCase: DramaListUseCase) {
        self.viewController = viewController
        self.useCase = useCase
        self.wireframe = wireframe
    }

    func fetchDramaList() {
        viewController?.setDramaListState(.loading)
        useCase.fetchDramaList { (models) in
            self.dramaList.items += models.items
            let state = self.dramaList.items.count == 0 ? DramaListState.blank : DramaListState.working
            self.viewController?.setDramaListState(state)
        }
    }
}
