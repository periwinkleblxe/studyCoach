import SwiftUI

struct registerGuestUserView: View{
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var classData: ClassData
    @EnvironmentObject var thisUser: User
    @EnvironmentObject var dateData: dates
    @EnvironmentObject var dData: dayData
    var body: some View {
        
        VStack{
            //Text("Semester")
            VStack{
                DatePicker(selection: $dateData.startDate, displayedComponents: .date, label: { Text("Start Date").font(.body).fontWeight(.light) })
                DatePicker(selection: $dateData.endDate, displayedComponents: .date, label: { Text("End Date").font(.body).fontWeight(.light) })
            }.padding()
            Divider()
            
                ForEach(classData.classes) { classID in
                    classCardView(thisClass: classID)
                }
            
            NavigationLink(destination: createClassView().navigationTitle("New Class").navigationBarTitleDisplayMode(.inline)) {
                Text("Add Class").font(.body).fontWeight(.light)
            }.buttonStyle(.bordered)
            Spacer()
        }.toolbar{
            Button {
                dateData.fillDates(startDate: dateData.startDate, endDate: dateData.endDate)
                dData.fillData(dateSet: dateData.allDates)
                for classID in classData.classes{
                    dData.addClass(thisClass: classID)
                }
                /*
                for dayID in dData.dayItemData {
                    print(dayID.dayFormatted)
                }*/
                thisUser.isNewUser = false
                dismiss()
            } label: {
                Text("Confirm").font(.body).fontWeight(.light)
            }
        }
        
    }
}
