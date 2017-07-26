
import UIKit

struct __BUILDER__ {
    func build() -> UIViewController {
        let viewController = __VIEW__.instantiate()
        viewController.inject(
            presenter: __PRESENTER__Impl(
                viewController: viewController,
                wireframe: __WIREFRAME__Impl(
                    viewController: viewController
                ),
                useCase: __USECASE__Impl(
                    repository: __REPOSITORY__Impl (
                        dataStore: __DATASTORE__Impl()
                    ),
                    translator: __TRANSLATOR__Impl()
                )
            )
        )
        return viewController
    }
}
