
import Foundation

struct DramaModels {
    var items = [DramaModel]()
}

struct DramaModel {
    let id: String
    let title: String
    let imageURL: URL
    let seasonCount: Int

    init(data: DramaEntity) {
        self.id = data.id
        self.title = data.title
        self.imageURL = URL(string: data.image_url)!
        self.seasonCount = data.season_count
    }
}
