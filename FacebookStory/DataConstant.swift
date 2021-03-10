import Foundation

struct InstagramStory {
    let name: String
    let avatar: String
    let image: String
}

enum DataConstant {
   static let listStory = [
    InstagramStory(name: "Min", avatar: "avatar1", image: "pexels1"),
    InstagramStory(name: "Anna", avatar: "avatar2", image: "pexels2"),
    InstagramStory(name: "Scara", avatar: "avatar3", image: "pexels3"),
    InstagramStory(name: "Violet", avatar: "avatar4", image: "pexels4"),
    InstagramStory(name: "Anie", avatar: "avatar5", image: "pexels5")]
}
