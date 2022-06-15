import SwiftUI
import UIKit

struct createClassView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var newClass: Class = Class(className: "", teacher: "",color: .clear, time: Date.now, daysSelected: [])
    @State var sameTimes = false
    @EnvironmentObject var classData: ClassData
    @EnvironmentObject var dData: dayData
    var body: some View {
        
        VStack(alignment: HorizontalAlignment.leading, spacing: 20) {
            TextField("Class Name: ", text: $newClass.className)
            
            TextField("Teacher Name: ", text:$newClass.teacher).font(Font.system(.body).weight(.light))
            
            NavigationLink(destination: symbolSelectorView(thisClass: newClass).navigationTitle("Symbol Selector").navigationBarTitleDisplayMode(.inline)) {
                Text("Click to select an icon : ").font(Font.system(.body).weight(.light))
                Image(systemName: newClass.icon)
                
            }
            
            //ColorPicker("Class Color", selection: $newClass.classColor).font(Font.system(.body).weight(.light))
            NavigationLink(destination: colorSelectorView(thisClass:newClass)) {
                Text("Select Class Color").font(Font.system(.body).weight(.light))
                Image(systemName: "checkmark.circle.fill").foregroundColor(newClass.classColor)
            }
            
            DatePicker("Start Date", selection: $newClass.startDate, displayedComponents: [.date]).font(Font.system(.body).weight(.light))            
            //Recurring Days
            Text("On what days do you have this class?")
                .font(Font.system(.body).weight(.light))
            
            //Figure out way to use for loop to code in buttons and values
            HStack {
                Button {
                    newClass.editClassSchedule("Sunday")
                    
                } label: {
                    if (newClass.daysSelected.contains("Sunday")) {
                        Image(systemName: "s.circle.fill")
                    } else {
                        Image(systemName: "s.circle")
                    }
                }
                .imageScale(.large)
                .font(Font.title3)                
                Button {
                    newClass.editClassSchedule("Monday")
                    
                } label: {
                    if (newClass.daysSelected.contains("Monday")) {
                        Image(systemName: "m.circle.fill")
                    } else {
                        Image(systemName: "m.circle")
                    }
                }
                .imageScale(.large)
                .font(Font.title3)
                Button {
                    newClass.editClassSchedule("Tuesday")
                    
                } label: {
                    if (newClass.daysSelected.contains("Tuesday")) {
                        Image(systemName: "t.circle.fill")
                    } else {
                        Image(systemName: "t.circle")
                    }
                }
                .imageScale(.large)
                .font(Font.title3)
                Button {
                    newClass.editClassSchedule("Wednesday")
                    
                } label: {
                    if (newClass.daysSelected.contains("Wednesday")) {
                        Image(systemName: "w.circle.fill")
                    } else {
                        Image(systemName: "w.circle")
                    }
                }
                .imageScale(.large)
                .font(Font.title3)            
                Button {
                    newClass.editClassSchedule("Thursday")
                    
                } label: {
                    if (newClass.daysSelected.contains("Thursday")) {
                        Image(systemName: "t.circle.fill")
                    } else {
                        Image(systemName: "t.circle")
                    }
                }
                .imageScale(.large)
                .font(Font.title3)            
                Button {
                    newClass.editClassSchedule("Friday")
                    
                } label: {
                    if (newClass.daysSelected.contains("Friday")) {
                        Image(systemName: "f.circle.fill")
                    } else {
                        Image(systemName: "f.circle")
                    }
                }
                .imageScale(.large)
                .font(Font.title3)            
                Button {
                    newClass.editClassSchedule("Saturday")
                    
                } label: {
                    if (newClass.daysSelected.contains("Saturday")) {
                        Image(systemName: "s.circle.fill")
                    } else {
                        Image(systemName: "s.circle")
                    }
                }
                .imageScale(.large)
                .font(Font.title3)            
                
            }.foregroundColor(Color.blue)
            
            Toggle(isOn: $newClass.sameTime) {
                Text("Same Time?").font(Font.system(.body).weight(.light))
                
            }
            if !(newClass.daysSelected.isEmpty){
            if (!newClass.sameTime) {
                LazyVStack(alignment: .leading) {
                    
                        ForEach(0...newClass.daysSelected.count-1, id: \.self) {count in
                        Text("\(newClass.daysSelected[count])").font(Font.system(.body).weight(.medium))
                        
                        VStack{
                            
                            DatePicker("Start Time", selection: $newClass.daysAndTimes[count].startTime, displayedComponents: [.hourAndMinute])
                                .font(Font.system(.body).weight(.light))
                            
                            DatePicker("End Time", selection: $newClass.daysAndTimes[count].endTime, displayedComponents: [.hourAndMinute]).font(Font.system(.body).weight(.light))
                        }.padding(.horizontal)
                        
                    }
                    
                    }
                
            } 
            else {
                
                    DatePicker("Start Time", selection: $newClass.startTime, displayedComponents: [.hourAndMinute]).font(Font.system(.body).weight(.light))  
                    DatePicker("End Time", selection: $newClass.endTime, displayedComponents: [.hourAndMinute]).font(Font.system(.body).weight(.light))
                
            }
            }
            
        }.toolbar{
            ToolbarItem{
                Button("Confirm") {
                    
                    if(newClass.sameTime){
                        if !(newClass.daysAndTimes.isEmpty){
                            for i in 0...newClass.daysAndTimes.count-1 {
                                newClass.daysAndTimes[i].startTime = newClass.startTime
                                newClass.daysAndTimes[i].endTime = newClass.endTime
                            }
                        }
                    }
                    
                    classData.addClass(newClass)
                    //dData.addClass(thisClass: newClass)
                    dismiss()
                    
                    
                }.buttonStyle(.bordered)
            }
        }
        .padding()
        Spacer()
        
        }
    
    
    
}


