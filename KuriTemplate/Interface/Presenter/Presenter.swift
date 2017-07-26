
import Foundation

protocol __PRESENTER__: class {
    func fetch()
}

class __PRESENTER__Impl: __PRESENTER__ {
    private weak var viewController: __VIEW__Output?
    private let wireframe: __WIREFRAME__
    private let useCase: __USECASE__

    init(viewController: __VIEW__Output, wireframe: __WIREFRAME__, useCase: __USECASE__) {
        self.viewController = viewController
        self.useCase = useCase
        self.wireframe = wireframe
    }

    func fetch() {
        DispatchQueue.main.async { [weak self] in
            self?.useCase.fetch { (items) in
                self?.viewController?.set__MODEL__(items)
            }
        }
    }
}
