
import UIKit

protocol DramaListWireframe: class {
    weak var viewController: DramaListViewController? { get set }
}

class DramaListWireframeImpl: DramaListWireframe {
    weak var viewController: DramaListViewController?

    init(viewController: DramaListViewController) {
        self.viewController = viewController
    }
}
