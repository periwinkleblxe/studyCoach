import SwiftUI

class dayItem: ObservableObject, Identifiable, Codable {
    var id = UUID()
    @Published var dayFormatted: String
    @Published var dayDate: Date
    @Published var dayOfWeek: String
    @Published var classes: [Class] = []
    @Published var tasksDue: [SchoolTask] = []
    init(day: Date) {
        self.dayFormatted = day.formatted(date: .abbreviated, time: .omitted)
        self.dayDate = day
        self.dayOfWeek = day.daysOfWeek()
        
    }
    
}
