
import Foundation

protocol DramaListPresenter: class {
    func fetch()
}

class DramaListPresenterImpl: DramaListPresenter {
    private weak var viewController: DramaListViewControllerOutput?
    private let wireframe: DramaListWireframe
    private let useCase: DramaListUseCase

    init(viewController: DramaListViewControllerOutput, wireframe: DramaListWireframe, useCase: DramaListUseCase) {
        self.viewController = viewController
        self.useCase = useCase
        self.wireframe = wireframe
    }

    func fetch() {
        self.viewController?.setDramaListState(.loading)
        DispatchQueue.main.async { [weak self] in
            self?.useCase.fetch { (models) in
                let state = models.items.isEmpty ? DramaListState.blank : DramaListState.working(models)
                self?.viewController?.setDramaListState(state)
            }
        }
    }
}
