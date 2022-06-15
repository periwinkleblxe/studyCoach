import SwiftUI

struct dailyClassCardView: View {
    @State var className: String
    @State var teacherName: String
    @State var color: Color
    @State var time: Date
    var body: some View {
        VStack{
        HStack{
            Label {
                HStack{
                    VStack (alignment: .leading, spacing: 5){
                        Text("\(className)").fontWeight(.bold)
                        Text("\(teacherName)").fontWeight(.light).font(.body)
                    }
                    Spacer()
                    VStack{
                        Text("Today at: ").font(.body).fontWeight(.light)
                        Text(time, style: .time)
                            .font(.body).fontWeight(.light)
                            
                    }
                }
            } icon: {
                Image(systemName: "studentdesk")
                    .foregroundColor(color)
                    .padding(.trailing, 10)
            }
        }.padding()
            Divider()
        }
        /*
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(.quaternary)
                    .frame(minWidth: 300)
                    .frame(height: 75)
                    .padding(.horizontal)
                    .overlay(
                    HStack(spacing: 10) {
                        
                        VStack (spacing: 5){
                            Text("Class Name:")
                                .font(Font.system(.body).weight(.light))
                            Text("Today at:").font(Font.system(.body).weight(.light))
                        }
                        Circle()
                            .fill(.cyan)
                            .frame(width: 40)
                            
                    }
                )
                
            }
        }
         */
    }
}
