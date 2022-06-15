import SwiftUI

class tagData: Identifiable, ObservableObject, Codable {
    var id = UUID()
    @Published var tagItems = [
        tagItem(name: "Unit 1", color: Color.pink, classOrigin: "Intro to Computing")
    ]
}
