
import Foundation

protocol DramaDataStore {
    func fetch(_ closure: ([DramaEntity]) -> Void)
}

struct DramaDataStoreImpl: DramaDataStore {
    func fetch(_ closure: ([DramaEntity]) -> Void) {

    }
}
