import SwiftUI

struct scheduleTabView: View {
    @EnvironmentObject var dData: dayData
    @EnvironmentObject var classData: ClassData
    @State var dateSelected: Date = Date.now
    @State var currentDaySelected: dayItem = dayItem(day: Date.now)
    var body: some View {
        VStack{
            DatePicker(selection: $dateSelected,displayedComponents: .date, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ }).datePickerStyle(.graphical)
            ScrollView{
                VStack{
                    
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
            Divider()
                
                    ForEach(dData.dayItemData) {dayID in
                        if(dayID.dayFormatted == dateSelected.formatted(date: .abbreviated, time: .omitted)) {
                            ForEach(dayID.classes) {classID in
                                classCardView(thisClass: classID)
                            }
                            ForEach(dayID.tasksDue) { tID in
                                taskCardView(thisTask: tID)
                            }
                        }
                    }
                }
                
            }
        }.padding(.horizontal, 5)
        
    }
}
