
import Foundation

protocol DramaListUseCase {
    func fetch(_ closure: @escaping (DramaModels) -> Void)
}

struct DramaListUseCaseImpl: DramaListUseCase {
    private let repository: DramaRepository
    private let translator: DramaListTranslator

    init(repository: DramaRepository, translator: DramaListTranslator) {
        self.repository = repository
        self.translator = translator
    }

    func fetch(_ closure: @escaping (DramaModels) -> Void) {
        repository.fetch {
            closure(translator.translate(from: $0))
        }
    }
}
