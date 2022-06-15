import SwiftUI

struct colorSelectorView : View{
    @State var thisClass: Class?
    @State var thisTag: tagItem?
    @State var color: Color = Color.clear
    @State var colorSet: colorOptions = colorOptions()
    @Environment(\.dismiss) private var dismiss
    let columnLayout = Array(repeating: GridItem(), count: 4)
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text("Color Selected: ").font(.body).fontWeight(.light)
                RoundedRectangle(cornerRadius: 10).fill(color).frame(width: 60, height: 60)
            }.padding(.horizontal)
            
                LazyVGrid(columns: columnLayout) {
                    
                    ForEach(colorSet.all.indices, id: \.self) {index in
                        ZStack{
                            Button{
                                color = colorSet.all[index]
                            } label: {
                                RoundedRectangle(cornerRadius: 10).fill(colorSet.all[index]).frame(minWidth: 40, minHeight: 60)
                            }
                            
                        }
                    }
                }.padding(.horizontal)
        }
        VStack(alignment: .center){
            Button {
                thisTag?.addColor(color: color)
                thisClass?.addColor(color: color)
                dismiss()
            } label: {
                Text("Confirm")
            }.buttonStyle(.bordered).padding()
            Spacer()
        }
    }
}
