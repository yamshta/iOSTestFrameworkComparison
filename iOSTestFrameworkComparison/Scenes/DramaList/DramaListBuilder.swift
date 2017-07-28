
import UIKit

struct DramaBuilder {
    static func build() -> UIViewController {
        let viewController = DramaListViewController()
        viewController.inject(
            presenter: DramaListPresenterImpl(
                viewController: viewController,
                wireframe: DramaListWireframeImpl(
                    viewController: viewController
                ),
                useCase: DramaListUseCaseImpl(
                    repository: DramaRepositoryImpl (
                        dataStore: DramaDataStoreImpl()
                    ),
                    translator: DramaListTranslatorImpl()
                )
            )
        )
        return viewController
    }
}
