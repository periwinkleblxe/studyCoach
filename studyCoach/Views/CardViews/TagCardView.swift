import SwiftUI

struct tagCardView: View {
    @StateObject var thisTag: tagItem
    var body: some View {
        VStack{
            Text(thisTag.name).font(.caption).fontWeight(.light).padding().background(
                Capsule(style: .continuous).fill(thisTag.color).frame(height: 20)
            )
            
        }//.padding(.horizontal, 5)
        
    }
}
