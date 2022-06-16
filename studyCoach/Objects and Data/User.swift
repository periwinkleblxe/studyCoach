import SwiftUI

class User: ObservableObject, Identifiable, Codable {
    var id = UUID().uuidString
    var name: String = ""
    @Published var isNewUser: Bool = true
    @Published var email = ""
    var password = ""    //var classes: [Class] = []
    
}
