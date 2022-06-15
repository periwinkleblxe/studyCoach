import SwiftUI

struct taskCardView : View{
    @StateObject var thisTask: SchoolTask
    @EnvironmentObject var classData: ClassData
    var body: some View {
        
            
                VStack(alignment: .leading, spacing: 10){
                    HStack{
                        Text(thisTask.name).font(Font.headline).fontWeight(.bold)
                        Image(thisTask.taskPriorityIcon).foregroundColor(thisTask.taskPriorityColor)
                        
                    }
                    //Text(thisTask.taskType).fontWeight(.light).font(.body)
                    VStack{
                    HStack{
                        
                            ForEach (classData.classes) { classID in
                                if (classID.className == thisTask.classOrigin){
                                    Image(classID.icon).foregroundColor(classID.classColor).padding(.trailing, 10)
                                }
                            }
                        
                        
                        VStack(alignment: .leading){
                            
                                Text(thisTask.taskType).font(Font.body).fontWeight(.light)
                            
                            HStack{
                            if let holderDate = thisTask.dueDate{
                                Text("Due: ").fontWeight(.light).font(.body)
                                Text(holderDate.formatted(date: .numeric, time: .omitted)).fontWeight(.light).font(.body) 
                                
                            } else {
                                Text("No Due Date").fontWeight(.light).font(.body)
                                
                            }
                            
                        }}
                        Spacer()
                        Button{
                            thisTask.isCompleted.toggle()
                            if(thisTask.isCompleted) {
                                thisTask.status = taskStatus.isComplete
                            } else {
                                thisTask.status = taskStatus.isFuture
                            }
                        }label :{
                            Image(systemName: thisTask.isCompleted ? "checkmark.square" : "square").font(.title)
                        }
                        
                    }
                        
                    }
                    //Need to test out length
                    LazyHStack {
                        ForEach(thisTask.assignedTags) { tagItem in
                            tagCardView(thisTag: tagItem)
                        }
                    }
                }.padding().background(
                    RoundedRectangle(cornerRadius: 20).foregroundColor(thisTask.taskStatusColor(stat: thisTask.status))
                )
                        
        Divider()
                    }
                
}
            

            



