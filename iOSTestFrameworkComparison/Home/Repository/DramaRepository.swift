
import Foundation

protocol DramaRepository {
    func fetch(_ closure: ([DramaEntity]) -> Void)
}

struct DramaRepositoryImpl: DramaRepository {
    private let dataStore: DramaDataStore

    init(dataStore: DramaDataStore) {
        self.dataStore = dataStore
    }

    func fetch(_ closure: ([DramaEntity]) -> Void) {
        return dataStore.fetch(closure)
    }
}
