import SwiftUI

struct taskTabView: View {
    @EnvironmentObject var classData: ClassData
    @EnvironmentObject var tData: taskData
    @EnvironmentObject var tgData: tagData
    @State var filterOption = sortByOptions.className
    //@State var filters: (options: sortByOptions, id: UUID)
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .frame(width: 130)
                        .frame(maxHeight: 40)
                        .cornerRadius(40)
                        .saturation(2)
                        .blur(radius: 2)
                    HStack(spacing: 10) {
                        Image(systemName: "pencil")//.foregroundColor(.white)
                        Text("Tasks").font(Font.system(.body).weight(.light))//.foregroundColor(.white)
                    }
                }.padding(.vertical, 5)
                Menu("Filter: \(filterOption.name)") {
                    ForEach (sortByOptions.allCases) {optID in
                        Button {
                            filterOption = optID
                        } label : {
                            Text(optID.name)
                        }
                    }
                }
                
            }.padding(.horizontal).frame(height: 50).fixedSize(horizontal: false, vertical: true)
            Divider()
            /*
            HStack{
                NavigationLink(destination: createTaskView().navigationTitle("New Task").navigationBarTitleDisplayMode(.inline)) {
                    Text("Task")
                    Image(systemName: "plus")
                }.buttonStyle(.bordered)
                NavigationLink(destination: createTagView().navigationTitle("New Tag").navigationBarTitleDisplayMode(.inline)) {
                    Text("Tag")
                    Image(systemName: "plus")
                }.buttonStyle(.bordered)
            }.padding(.horizontal)*/
            Divider()
            
            setView()
            Spacer()
            
        }//.padding(.horizontal)
    }
    func setView() -> AnyView {
        switch filterOption {
            case .taskPriority: return AnyView(Rectangle())
        case .className: return AnyView(sortTasksByClass())
        default: return AnyView(Rectangle())
        }
    }
}
struct sortTasksByPriority: View {
    @EnvironmentObject var tData: taskData
    var body: some View {
        VStack{
            
        }
    }
}
struct sortTasksByClass : View {
    @EnvironmentObject var tData: taskData
    @EnvironmentObject var classData: ClassData
    @State var classString: String = ""
    @State var classSelected = Class(className: "", teacher: "", color: .clear, time: .now, daysSelected: [])
    var body: some View {
        VStack {
            HStack{
                Menu {
                    ForEach(classData.classes) {classID in
                        Button {
                            classSelected = classID
                        } label: {
                            Text(classID.className)
                        }
                    }
                }label : {
                    Text("Select Class")
                }
                NavigationLink(destination: createTaskView().navigationTitle("New Task").navigationBarTitleDisplayMode(.inline)) {
                    Text("Task")
                    Image(systemName: "plus")
                }.buttonStyle(.bordered)
                NavigationLink(destination: createTagView().navigationTitle("New Tag").navigationBarTitleDisplayMode(.inline)) {
                    Text("Tag")
                    Image(systemName: "plus")
                }.buttonStyle(.bordered)
            }.padding(.horizontal)
            
            ScrollView{
                ForEach(classSelected.tasks) {tID in
                    taskCardView(thisTask: tID)
                }
            }
        }
        
    }
}
