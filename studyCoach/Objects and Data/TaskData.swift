import SwiftUI

class taskData: ObservableObject, Codable {
    @Published var sortBy: sortByOptions = .dueDate
    @Published var tasks: [SchoolTask] = [
        SchoolTask(classOrigin: "Intro to Computing", name: "CodingProject", hasDueDate: true, dueDate: Date.now, isCompleted: false, taskType: "Reading")
    ]
    @Published var taskTypes:[String] = ["Exam", "Essay", "Project", "Presentation", "Quiz", "Study", "Homework", "Review"]
    
    //@Published var taskPriorities: [ String : Color] = ["Low" : Color.green, "Medium" : Color.yellow, "High" : Color.red]
    func addTask(_ newTask: SchoolTask) {
        tasks.append(newTask)
    }
    func sortByClass (_ filter: String) {
        
    }
}
enum sortByOptions: String, CaseIterable, Identifiable, Codable{
    var id: String {self.rawValue}
    var name: String{self.rawValue}
    case dueDate = "Due Date"
    case className = "Class Name"
    case tag = "Tag"
    case taskStatus = "Task Status"
    case taskType = "Task Type"
    case taskPriority = "Task Priority"
}
enum taskStatus: CaseIterable, Codable{
    
    case isFuture 
    case isUpcoming
    case isUrgent
    case isOverdue
    case isComplete 
}
enum priority: String, CaseIterable, Identifiable, Codable {
    var id: String { self.rawValue }
    //case none = "None"
    case low = "Low"
    case medium = "Medium"
    case high = "High"
    var name: String {self.rawValue}
}
