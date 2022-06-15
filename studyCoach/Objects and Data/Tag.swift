import SwiftUI

class tagItem : Identifiable, ObservableObject, Codable {
    var id = UUID()
    @Published var name = ""
    @Published var color = Color.clear
    @Published var classOrigin : String?
    init(name: String, color: Color, classOrigin: String?) {
        self.name = name
        self.color = color
        self.classOrigin = classOrigin
    }
    func addColor(color: Color) {
        self.color = color
    }
    enum CodingKeys: CodingKey {
        case color
    }
    /*
    required init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        color = try container.decode(Color.self, forKey: .color)
    }*/
    
}
