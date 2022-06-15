import SwiftUI

struct createTagView : View {
    @EnvironmentObject var classData: ClassData
    @EnvironmentObject var tgData: tagData
    @Environment(\.dismiss) private var dismiss
    @StateObject var thisTag = tagItem(name: "", color: Color.clear, classOrigin: nil)
    @State var hasClass = false
    //@State var originNil: String? = nil
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            
            TextField("Tag Name: ", text: $thisTag.name)
            
                Menu {
                    ForEach(classData.classes) {classID in
                        Button{
                            thisTag.classOrigin = classID.className
                        } label: {
                            Text(classID.className).font(.body).fontWeight(.light)
                        }
                    }
                    Button {
                        thisTag.classOrigin = nil
                    }label: {
                        Text("No Class")
                    }
                }label: {
                    Text("Select Class").font(.body).fontWeight(.light)
                }
            
                
            
            NavigationLink(destination: colorSelectorView(thisTag: thisTag)) {
                Text("Select Color: ").font(.body).fontWeight(.light)
                Image(systemName: "checkmark.circle.fill").foregroundColor(thisTag.color)
            }
        }.padding()
            .toolbar{
                Button {
                    for classID in classData.classes {
                        if (classID.className == thisTag.classOrigin) {
                            classID.tagItems.append(thisTag)
                        }
                    }
                    tgData.tagItems.append(thisTag)
                    dismiss()
                } label: {
                    Text("Confirm").font(.body).fontWeight(.light)
                }.buttonStyle(.bordered)
                //Spacer()
            }
        Spacer()
        //.padding()
    }
}
