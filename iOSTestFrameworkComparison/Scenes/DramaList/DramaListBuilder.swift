
import UIKit

struct DramaListBuilder {
    static func build() -> DramaListViewController {
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
