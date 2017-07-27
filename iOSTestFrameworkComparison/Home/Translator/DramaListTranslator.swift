
import Foundation

protocol DramaTranslator {
    func translate(from entity: [DramaEntity]) -> DramasModel
//    func translate(from model: DramasModel) -> [DramaEntity]
}

struct DramaTranslatorImpl: DramaTranslator {
    func translate(from entity: [DramaEntity]) -> DramasModel {
        var dramasModel = DramasModel()
        entity.forEach { rowEntity in
            let dramaModel = DramaModel(id: rowEntity.id)
            dramasModel.items.append(dramaModel)
        }
        return dramasModel
    }

//    func translate(from model: DramasModel) -> [DramaEntity] {
//        var dramasEntity = [DramaEntity]()
//        model.items.forEach { rowModel in
//            let dramaEntity = DramaEntity(id: rowModel.id)
//            dramasEntity.append(dramaEntity)
//        }
//        return dramasEntity
//    }
}
