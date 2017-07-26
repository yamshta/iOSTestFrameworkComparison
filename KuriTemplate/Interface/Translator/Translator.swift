
import Foundation

protocol __TRANSLATOR__ {
    func translate(from model: __MODEL__) -> __ENTITY__
    func translate(from entity: __ENTITY__) -> __MODEL__
}

struct __TRANSLATOR__Impl: __TRANSLATOR__ {
    func translate(from model: __MODEL__) -> __ENTITY__ {
        return __ENTITY__(id: model.id)
    }

    func translate(from entity: __ENTITY__) -> __MODEL__ {
        return __MODEL__(id: entity.id)
    }
}
