
import Foundation

protocol __TRANSLATOR__ {
    func translate(from entity: [__ENTITY__]) -> __MODEL__s
}

struct __TRANSLATOR__Impl: __TRANSLATOR__ {
  func translate(from entity: [__ENTITY__]) -> __MODEL__s {
      var models = __MODEL__s()
      entity.forEach { rowEntity in
          let model = __MODEL__(data: rowEntity)
          models.items.append(model)
      }
      return models
  }
}
