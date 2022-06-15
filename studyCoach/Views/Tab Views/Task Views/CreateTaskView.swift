import SwiftUI

struct createTaskView: View {
    @EnvironmentObject var classData:ClassData
    @EnvironmentObject var tData:taskData
    @EnvironmentObject var tgData:tagData
    @EnvironmentObject var dData: dayData
    @Environment(\.dismiss) private var dismiss
    @State var providedClassOrigin : String?
    @StateObject var task: SchoolTask = SchoolTask(classOrigin: nil, name: "", hasDueDate: true, dueDate: nil, isCompleted: false, taskType: "")
    @State var dueDateHolder = Date.now
    @State var whichClass: Class?
    var body: some View {
        ScrollView{
        VStack(alignment: .leading, spacing: 20){
            TextField("Task Name: ", text: $task.name)
            TextField("Task Description: ", text: $task.description)
            HStack{
                Menu {
                    ForEach(classData.classes) { classID in
                        Button {
                            //whichClass = classID
                            task.classOrigin = classID.className
                        } label: {
                            Text(classID.className)
                        }
                    }
                } label: {
                    Text("Select Class: ").font(Font.system(.body).weight(.light))  
                    
                }
                
                Text(task.classOrigin).font(Font.system(.body).weight(.light))  
                
            }
            HStack{
                Text("Task Type: ").font(Font.system(.body).weight(.light))  
                Spacer()
                Picker(selection: $task.taskType) {
                    ForEach(tData.taskTypes, id: \.self) {
                        Text($0).font(.body).fontWeight(.light)         
                    }
                } label: {
                    Text("")
                    
                }
            }
            HStack{
                
                Text("Task Priority: \(task.taskPriority.id) ").font(.body).fontWeight(.light)
                Spacer()
                Menu {
                    Button {
                        task.taskPriority = .high
                    } label: {
                        Text("High")
                    }
                    Button {
                        task.taskPriority = .medium
                    } label : {
                        Text("Medium")
                    }
                    Button {
                        task.taskPriority = .low
                    } label : {
                        Text("Low")
                    }
                } label: {
                    Text("Select").font(.body).fontWeight(.light)
                }
        }
            Toggle(isOn: $task.hasDueDate) {
                    Text("Due Date?").font(Font.system(.body).weight(.light))  
                
            }
                if (task.hasDueDate){
                    DatePicker(selection: $dueDateHolder, label: { Text("Due Date")}).datePickerStyle(.graphical)
                    //task.dueDate = dueDateHolder
                }
            HStack{
                Text("Tags: ").font(Font.system(.body).weight(.light)) 
                ScrollView(.horizontal){
                    LazyHStack {
                        ForEach(tgData.tagItems) { tagID in
                            if (tagID.classOrigin == task.classOrigin) {
                                Button {
                                    task.assignedTags.append(tagID)
                                } label: {
                                    tagCardView(thisTag: tagID)
                                }
                            }
                        }
                    }
                }
            }
            TextField("Add Link", text: $task.webLink)
            /*
            ScrollView(.horizontal) {
                HStack{
                    
                }
            }*/
            
            Spacer()
        }.padding()
        }.toolbar {
            ToolbarItem{
                Button {
                    if (task.hasDueDate) {
                        task.dueDate = dueDateHolder
                        
                    }
                    if let dueDateHolder = task.dueDate {
                        for dID in dData.dayItemData {
                            if (dID.dayFormatted == dueDateHolder.formatted(date: .abbreviated, time: .omitted)) {
                                dID.tasksDue.append(task)
                            }
                        }
                    }
                    for classID in classData.classes {
                        if (task.classOrigin == classID.className) {
                            classID.tasks.append(task)
                        }
                    }
                    task.setPriorityColor(task.taskPriority)
                    tData.addTask(task)
                    dismiss()
                } label: {
                    Text("Confirm")
                }.buttonStyle(.bordered)
            }
        }
}
}
