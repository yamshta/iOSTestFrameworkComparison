
import Foundation

struct DramaListModel {
    var items = [DramaModel]()
}

struct DramaModel {
    let id: String
    let title: String
    let imageURL: URL
    let seasonCount: Int

    init(id: String, title: String, imageURL: URL, seasonCount: Int) {
        self.id = id
        self.title = title
        self.imageURL = imageURL
        self.seasonCount = seasonCount
    }

    init(data: DramaEntity) {
        self.id = data.id
        self.title = data.title
        self.imageURL = URL(string: data.image_url)!
        self.seasonCount = data.season_count
    }
}
