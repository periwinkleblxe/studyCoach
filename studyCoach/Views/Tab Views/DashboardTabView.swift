import SwiftUI

struct dashboardView: View {
    @State var today = Date.now
    @State var showCalendar: Bool = false
    @EnvironmentObject var classData:ClassData
    var body: some View {
        
         VStack{
             Button{
                 showCalendar.toggle()
             } label: {
             ZStack{
                 LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                     .frame(minWidth: 300, maxHeight: 40)
                     .cornerRadius(40)
                     .saturation(2)
                     .blur(radius: 2)
                     .padding(.horizontal)
                 HStack(spacing: 15) {
                 Image(systemName: "sun.and.horizon")//.foregroundColor(.white)
                 Text("Dashboard").font(Font.system(.body).weight(.light))//.foregroundColor(.white)
                 Text(today, style: .date).font(Font.system(.body).weight(.light))//.foregroundColor(.white)
                     if(showCalendar){
                         Image(systemName: "chevron.up")
                     } else {
                         Image(systemName: "chevron.down")
                     }
             }.padding(.vertical)
             }
             }.buttonStyle(.plain)
             if(showCalendar == true) {
                 scheduleCalView()
             }
             Divider()
             ScrollView{
                 
                 ForEach (classData.classes) { classID in
                     dailyClassCardView(className: classID.className, teacherName: classID.teacher, color: classID.classColor, time: classID.startTime)
                     
                 } 
             }
             
             Divider()
         }
        
    }
}
