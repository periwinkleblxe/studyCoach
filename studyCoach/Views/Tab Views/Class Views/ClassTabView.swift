import SwiftUI
struct classTabView: View {
    @EnvironmentObject var classData: ClassData
    @State var addingNewClass = false
    
    var body: some View {
        
            VStack {
                HStack(spacing: 10) {
                    ZStack{
                        LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            .frame(width: 130)
                            .frame(maxHeight: 40)
                            .cornerRadius(40)
                            .saturation(2)
                            .blur(radius: 2)
                        HStack(spacing: 10) {
                            Image(systemName: "graduationcap")//.foregroundColor(.white)
                            Text("Classes").font(Font.system(.body).weight(.light))//.foregroundColor(.white)
                        }
                    }.padding(.vertical, 5)
                    /*
                    Button {
                        addingNewClass.toggle()
                    } label: {
                        if (addingNewClass){
                            Image(systemName: "pencil.slash")
                            Text("Cancel")
                        } else {
                            Image(systemName: "plus")
                            Text("Add")
                            
                        }
                    }.buttonStyle(.bordered)*/
                    NavigationLink(destination: createClassView().navigationTitle("New Class").navigationBarTitleDisplayMode(.inline)) {
                        Text("New Class")
                    }.buttonStyle(.bordered) 
                }
                Divider()
                
                
                    ScrollView{
                        classListView()
                        /*
                            ForEach (classData.classes) { classID in
                                dailyClassCardView(className: classID.className, teacherName: classID.teacher, color: classID.classColor, time: classID.startTime)
                                
                                
                            }*/
                        
                    }
                    //dailyClassCardView()
                    
                
                
                Divider()            
                
            }
            
    
    }
}
