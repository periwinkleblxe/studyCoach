import SwiftUI

struct classDetailView: View {
    @State var thisClass: Class
    @EnvironmentObject var tData: taskData
    
    var body: some View {
        VStack(alignment: .leading){
            if !(thisClass.daysAndTimes.isEmpty){
                //Divider()
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .frame(width: 130)
                        .frame(height: 30)
                        .cornerRadius(10)
                        .saturation(2)
                        .blur(radius: 2)
                    HStack(spacing: 10) {
                        Image(systemName: "calendar.badge.clock")
                        Text("Schedule").font(Font.system(.body).weight(.light))//.foregroundColor(.white)
                    }
                }
                Divider()
                ForEach (0...thisClass.daysAndTimes.count-1, id: \.self) { index in
                    HStack{
                        Text(thisClass.daysAndTimes[index].day + ":")
                        Text(thisClass.daysAndTimes[index].startTime, style: .time)
                        Text("to")
                        Text(thisClass.daysAndTimes[index].endTime, style: .time)
                    }.padding(.vertical, 5)
                    
                }
                
            }
            //Divider()
            HStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(width: 130)
                    .frame(height: 30)
                    .cornerRadius(10)
                    .saturation(2)
                    .blur(radius: 2)
                HStack(spacing: 10) {
                    Image(systemName: "pencil.and.outline")
                    Text("Tasks").font(Font.system(.body).weight(.light))//.foregroundColor(.white)
                }            
            }
                NavigationLink(destination: createTaskView(whichClass: thisClass).navigationTitle("New Task")) {
                    Text("Create Task")
                }.buttonStyle(.bordered)
                
            }
                Divider()
            ScrollView{
                ForEach(thisClass.tasks) {tID in
                    taskCardView(thisTask: tID)
                }
                
            }
        }.padding()
    }
}
