import SwiftUI

class SchoolTask: Identifiable, ObservableObject, Codable {
    
    var id = UUID()
    @Published var classOrigin: String = ""
    @Published var name: String
    @Published var description: String = ""
    @Published var hasDueDate: Bool = false
    @Published var dueDate: Date? = nil
    @Published var dueDateHolder: Date = Date.now
    @Published var isCompleted = false
    @Published var status : taskStatus
    @Published var taskType = ""
    
    @Published var webLink: String = ""
    
    @Published var assignedTags: [tagItem] = []
    //@Published var taskTypes = ["Exam", "Essay", "Project", "Presentation", "Quiz", "Study", "Homework", "Review"]
    
    init(classOrigin: String?, name: String, hasDueDate: Bool, dueDate: Date?, isCompleted: Bool, taskType: String) {
        if let className = classOrigin {
            self.classOrigin = className
        }
        self.name = name
        self.hasDueDate = hasDueDate
        self.dueDate = dueDate
        self.isCompleted = isCompleted
        self.taskType = taskType
        self.taskPriority = .high
        self.status = .isFuture
    }
    
    @Published var taskPriority : priority
    @Published var taskPriorityColor = Color.clear
    @Published var taskPriorityIcon : String = "pencil"
    
    func setPriorityColor(_ priorityLevel: priority) {
        switch priorityLevel {
            case .high: taskPriorityColor = Color.red; taskPriorityIcon = "h.circle"
            case .medium: taskPriorityColor = Color.orange; taskPriorityIcon = "m.circle"
            case .low: taskPriorityColor = Color.green; taskPriorityIcon = "l.circle"
            //default: taskPriorityColor = Color.clear
        }
        /*
        if (taskPriority == "High") {
            taskPriorityColor = Color.red
            taskPriorityIcon = Image(systemName: "h.circle")
        } else if (taskPriority == "Medium") {
            taskPriorityColor = Color.orange
            taskPriorityIcon = Image(systemName: "m.circle")
            
        } else if (taskPriority == "Low") {
            taskPriorityColor = Color.green
            taskPriorityIcon = Image(systemName: "l.circle")
            
        }*/
    }
    func taskStatusColor(stat: taskStatus) -> Color{
        switch stat {
        case.isFuture: return .gray6
        case.isUpcoming: return .yellow.opacity(0.2)
        case.isUrgent: return .orange.opacity(0.2)
        case.isOverdue: return .red.opacity(0.2)
        case.isComplete: return .green.opacity(0.2)
            //colorOptions().complementaryColor(color: "green")
        }
    }
    //@Published var priorityColor = Color.clear
}

