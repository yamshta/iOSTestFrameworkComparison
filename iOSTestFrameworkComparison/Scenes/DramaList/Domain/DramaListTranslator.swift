
import Foundation

protocol DramaListTranslator {
    func translate(from entity: [DramaEntity]) -> DramaModels
//    func translate(from model: DramasModel) -> [DramaEntity]
}

struct DramaListTranslatorImpl: DramaListTranslator {
    func translate(from entity: [DramaEntity]) -> DramaModels {
        var models = DramaModels()
        entity.forEach { rowEntity in
            let model = DramaModel(data: rowEntity)
            models.items.append(model)
        }
        return models
    }

//    func translate(from model: DramaModels) -> [DramaEntity] {
//        var entities = [DramaEntity]()
//        model.items.forEach { rowModel in
//            let entity = DramaEntity(id: rowModel.id)
//            entities.append(entity)
//        }
//        return entities
//    }
}
