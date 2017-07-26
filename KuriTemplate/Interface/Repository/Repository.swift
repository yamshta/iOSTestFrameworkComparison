
import Foundation

protocol __REPOSITORY__ {
    func fetch(_ closure: ([__ENTITY__]) -> Void)
}

struct __REPOSITORY__Impl: __REPOSITORY__ {
    private let dataStore: __DATASTORE__

    init(dataStore: __DATASTORE__) {
        self.dataStore = dataStore
    }

    func fetch(_ closure: ([__ENTITY__]) -> Void) {
        return dataStore.fetch(closure)
    }
}
