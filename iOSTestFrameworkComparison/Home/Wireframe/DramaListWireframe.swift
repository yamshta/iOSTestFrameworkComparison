
import UIKit

protocol DramaWireframe: class {
    weak var viewController: DramaViewController? { get set }
}

class DramaWireframeImpl: DramaWireframe {
    weak var viewController: dramaViewController?

    init(viewController: DramaViewController) {
        self.viewController = viewController
    }
}
