
import Foundation

protocol DramaListUseCase {
    func fetchDramaList(_ closure: @escaping (DramaListModel) -> Void)
}

struct DramaListUseCaseImpl: DramaListUseCase {
    private let repository: DramaRepository
    private let translator: DramaListTranslator

    init(repository: DramaRepository, translator: DramaListTranslator) {
        self.repository = repository
        self.translator = translator
    }

    func fetchDramaList(_ closure: @escaping (DramaListModel) -> Void) {
        repository.fetchDramaList {
            closure(translator.translate(from: $0))
        }
    }
}
