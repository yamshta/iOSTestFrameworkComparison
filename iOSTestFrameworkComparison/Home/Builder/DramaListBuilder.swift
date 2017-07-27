
import UIKit

struct DramaBuilder {
    static func build() -> UIViewController {
        let viewController = DramaViewController()
        viewController.inject(
            presenter: DramaPresenterImpl(
                viewController: viewController,
                wireframe: DramaWireframeImpl(
                    viewController: viewController
                ),
                useCase: DramaUseCaseImpl(
                    repository: DramaRepositoryImpl (
                        dataStore: DramaDataStoreImpl()
                    ),
                    translator: DramaTranslatorImpl()
                )
            )
        )
        return viewController
    }
}
