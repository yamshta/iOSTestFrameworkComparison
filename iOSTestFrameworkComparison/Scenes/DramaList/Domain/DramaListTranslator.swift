
import Foundation

protocol DramaListTranslator {
    func translate(from entity: [DramaEntity]) -> DramaListModel
//    func translate(from model: DramaListModel) -> [DramaEntity]
}

struct DramaListTranslatorImpl: DramaListTranslator {
    func translate(from entity: [DramaEntity]) -> DramaListModel {
        var models = DramaListModel()
        entity.forEach { rowEntity in
            let model = DramaModel(data: rowEntity)
            models.items.append(model)
        }
        return models
    }

//    func translate(from model: DramaListModel) -> [DramaEntity] {
//        var entities = [DramaEntity]()
//        model.items.forEach { rowModel in
//            let entity = DramaEntity(id: rowModel.id)
//            entities.append(entity)
//        }
//        return entities
//    }
}
