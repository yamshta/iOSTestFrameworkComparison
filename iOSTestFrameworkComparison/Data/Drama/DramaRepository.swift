
import Foundation

protocol DramaRepository {
    func fetchDramas(_ closure: ([DramaEntity]) -> Void)
}

struct DramaRepositoryImpl: DramaRepository {
    private let dataStore: DramaDataStore

    init(dataStore: DramaDataStore) {
        self.dataStore = dataStore
    }

    func fetchDramas(_ closure: ([DramaEntity]) -> Void) {
        return dataStore.fetchDramas(closure)
    }
}
