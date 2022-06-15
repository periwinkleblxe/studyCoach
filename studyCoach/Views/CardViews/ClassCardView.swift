import SwiftUI

struct classCardView: View {
    @StateObject var thisClass: Class
    /*
    @State var color: Color = thisClass
    @State var className: String = ""
    @State var teacherName: String = ""
    @State var time: Date = Date.now*/
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image(thisClass.icon)
                    .foregroundColor(thisClass.classColor)
                    .font(Font.title3).padding(.horizontal, 10).padding(.bottom, 45)
                
            VStack(alignment: .leading, spacing: 10){
                    HStack{
                    VStack (alignment: .leading, spacing: 5){
                        Text("\(thisClass.className)").fontWeight(.bold)
                        
                        HStack{
                            if(thisClass.daysSelected.contains("Sunday")) {
                                Image(systemName: "s.circle.fill")
                            } else {
                                Image(systemName: "s.circle")
                            }
                            if(thisClass.daysSelected.contains("Monday")) {
                                Image(systemName: "m.circle.fill")
                            } else {
                                Image(systemName: "m.circle")
                            }
                            if(thisClass.daysSelected.contains("Tuesday")) {
                                Image(systemName: "t.circle.fill")
                            } else {
                                Image(systemName: "t.circle")
                            }
                            if(thisClass.daysSelected.contains("Wednesday")) {
                                Image(systemName: "w.circle.fill")
                            } else {
                                Image(systemName: "w.circle")
                            }
                            if(thisClass.daysSelected.contains("Thursday")) {
                                Image(systemName: "t.circle.fill")
                            } else {
                                Image(systemName: "t.circle")
                            }
                            if(thisClass.daysSelected.contains("Friday")) {
                                Image(systemName: "f.circle.fill")
                            } else {
                                Image(systemName: "f.circle")
                            }                    
                            if(thisClass.daysSelected.contains("Saturday")) {
                                Image(systemName: "s.circle.fill")
                            } else {
                                Image(systemName: "s.circle")
                            }
                            
                        }.foregroundColor(.blue)
                        Text("\(thisClass.tasks.count) tasks remaining").font(.body).fontWeight(.light)
                    }//.padding(.horizontal)
                        
                        //
                        
                }
                }
            }.padding(.vertical, 5)
            
            Divider()
        }    
        
    }
        
    }
    

