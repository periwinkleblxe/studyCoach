import SwiftUI

class ClassData: ObservableObject, Codable {
    @Published var classes: [Class] = [
        Class(className: "Intro to Computing", teacher: "Bhowmik", color: Color.red, time: Date.now, daysSelected: ["Monday", "Wednesday", "Friday"])
    
    ]
    func addClass(_ newClass : Class) {
        classes.append(newClass)
    }
    
}
 
