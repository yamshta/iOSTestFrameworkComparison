
import Foundation

protocol __USECASE__ {
    func fetch(_ closure: (__MODEL__s) -> Void)
}

struct __USECASE__Impl: __USECASE__ {
    private let repository: __REPOSITORY__
    private let translator: __TRANSLATOR__

    init(repository: __REPOSITORY__, translator: __TRANSLATOR__) {
        self.repository = repository
        self.translator = translator
    }

    func fetch(_ closure: (__MODEL__s) -> Void) {
        repository.fetch {
            closure(translator.translate(from: $0))
        }
    }
}
