
import UIKit

protocol __WIREFRAME__: class {
    weak var viewController: __VIEW__? { get set }
}

class __WIREFRAME__Impl: __WIREFRAME__ {
    weak var viewController: __VIEW__?

    init(viewController: __VIEW__) {
        self.viewController = viewController
    }
}
