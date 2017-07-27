
import Foundation

protocol DramaListPresenter: class {
    var dramas: DramaModels { get }
    func fetchDramas()
}

class DramaListPresenterImpl: DramaListPresenter {
    private weak var viewController: DramaListViewControllerOutput?
    private let wireframe: DramaListWireframe
    private let useCase: DramaListUseCase

    internal var dramas = DramaModels()

    init(viewController: DramaListViewControllerOutput, wireframe: DramaListWireframe, useCase: DramaListUseCase) {
        self.viewController = viewController
        self.useCase = useCase
        self.wireframe = wireframe
    }

    func fetchDramas() {
        viewController?.setDramaListState(.loading)
        useCase.fetchDramas { (models) in
            self.dramas.items += models.items
            let state = self.dramas.items.count == 0 ? DramaListState.blank : DramaListState.working
            self.viewController?.setDramaListState(state)
        }
    }
}
