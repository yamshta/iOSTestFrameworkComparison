
import Foundation

protocol DramaUseCase {
    func fetch(_ closure: @escaping (DramasModel) -> Void)
}

struct DramaUseCaseImpl: DramaUseCase {
    private let repository: DramaRepository
    private let translator: DramaTranslator

    init(repository: DramaRepository, translator: DramaTranslator) {
        self.repository = repository
        self.translator = translator
    }

    func fetch(_ closure: @escaping (DramasModel) -> Void) {
        repository.fetch {
            closure(translator.translate(from: $0))
        }
    }
}
