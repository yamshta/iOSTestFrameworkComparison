
import Foundation

protocol DramaRepository {
    func fetchDramaList(_ closure: ([DramaEntity]) -> Void)
}

struct DramaRepositoryImpl: DramaRepository {
    private let dataStore: DramaDataStore

    init(dataStore: DramaDataStore) {
        self.dataStore = dataStore
    }

    func fetchDramaList(_ closure: ([DramaEntity]) -> Void) {
        return dataStore.fetchDramaList(closure)
    }
}
