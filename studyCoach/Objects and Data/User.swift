import SwiftUI
import Firebase
import FirebaseAuth

class UserAccount: ObservableObject, Identifiable, Codable {
    let userID = Auth.auth().currentUser?.uid
    //@StateObject var classData: ClassData
    var emailString: String
    
    //var email: String
    
    //var password: String  //var classes: [Class] = []
    init(email: String) {
        emailString = email
        //classData = ClassData()
        
    }
    func loadFromData(uid: String) {
        
        
    }
    func saveToData(uid: String) {
        
        
    }
}
