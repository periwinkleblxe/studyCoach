import SwiftUI

class Class: Identifiable, ObservableObject, Codable {
    var id = UUID().uuidString
    @Published var className: String = ""
    @Published var teacher: String = ""
    @Published var roomNumber: String = ""
    @Published var classColor: Color = Color.clear
    
    @Published var startDate = Date.now
    @Published var sameTime: Bool = true
    @Published var startTime = Date.now
    @Published var endTime = Date.now
    
    @Published var daysAndTimes: [(day: String, startTime: Date, endTime: Date)] = []
    @Published var daysSelected: [String] = []
    
    @Published var tasks: [SchoolTask] = []
    @Published var tagItems: [tagItem] = []
    @Published var icon: String
    
    
    init(className: String, teacher: String, color: Color, time: Date, daysSelected: [String]) {
        self.className = className
        self.teacher = teacher
        self.classColor = color
        self.startTime = time
        self.daysSelected = daysSelected
        self.tasks = []
        self.icon = "cube"
    }
    func editClassSchedule(_ testDay: String) {
        
        if !(daysSelected.contains(testDay)) {
            daysAndTimes.append((testDay, Date.now, Date.now))         
            daysSelected.append(testDay)
            
        }else if(daysSelected.contains(testDay)) {
            if let locateIn = daysSelected.firstIndex(of: testDay) {
                daysSelected.remove(at: locateIn)
                daysAndTimes.remove(at: locateIn)
            }
        }
    }
    
    func editTimeIndividual(_ dayIn: String ,_ time: DateInterval) {
        
    }
    func addColor (color: Color) {
        self.classColor = color
    }
    enum CodingKeys: CodingKey {
        case icon
    }
    
}
