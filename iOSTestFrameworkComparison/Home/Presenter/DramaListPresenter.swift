
import Foundation

protocol DramaPresenter: class {
    func fetch()
}

class DramaPresenterImpl: DramaPresenter {
    private weak var viewController: DramaViewControllerOutput?
    private let wireframe: DramaWireframe
    private let useCase: DramaUseCase

    init(viewController: DramaViewControllerOutput, wireframe: DramaWireframe, useCase: DramaUseCase) {
        self.viewController = viewController
        self.useCase = useCase
        self.wireframe = wireframe
    }

    func fetch() {
        DispatchQueue.main.async { [weak self] in
            self?.useCase.fetch { (model) in
                self?.viewController?.setdramasModel(model)
            }
        }
    }
}
