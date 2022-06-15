import SwiftUI

struct scheduleCalView: View {
    
    @State var dateSelected: Date = Date.now
    var body: some View {
        VStack{
            DatePicker(selection: $dateSelected,displayedComponents: .date, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ }).datePickerStyle(.graphical)
            
        }.padding(.horizontal, 5)
        
    }
}
