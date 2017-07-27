
import Foundation

protocol DramaDataStore {
    func fetch(_ closure: ([DramaEntity]) -> Void)
}

struct DramaDataStoreImpl: DramaDataStore {
    func fetch(_ closure: ([DramaEntity]) -> Void) {
        let dramaEntities = [
            DramaEntity(id: "", title: "Breaking Bad", image_url: "https://www.justwatch.com/images/poster/458429/s718/breaking-bad", season_count: 5),
            DramaEntity(id: "", title: "The Walking Dead", image_url: "https://www.justwatch.com/images/poster/458725/s718/the-walking-dead", season_count: 7),
            DramaEntity(id: "", title: "Doctor Who", image_url: "https://www.justwatch.com/images/poster/678041/s718/doctor-who", season_count: 10),
            DramaEntity(id: "", title: "Black Mirror", image_url: "https://www.justwatch.com/images/poster/459370/s718/black-mirror", season_count: 3),
            DramaEntity(id: "", title: "SHERLOCK", image_url: "https://www.justwatch.com/images/poster/499868/s718/sherlock", season_count: 4),
            DramaEntity(id: "", title: "Silicon Valley", image_url: "https://www.justwatch.com/images/poster/491474/s718/silicon-valley", season_count: 4),
            DramaEntity(id: "", title: "Game of Thrones", image_url: "https://www.justwatch.com/images/poster/10109360/s718/game-of-thrones", season_count: 7)
        ]
        closure(dramaEntities)
    }
}
