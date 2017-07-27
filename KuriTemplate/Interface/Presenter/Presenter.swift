
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
        self?.useCase.fetch { (models) in
          
        }
    }
}
