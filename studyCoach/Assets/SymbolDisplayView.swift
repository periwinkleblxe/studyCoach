import SwiftUI
/*
struct symbolDisplayView: View {
    @StateObject var thisClass: Class
    let columnLayout = Array(repeating: GridItem(), count: 4)
    //var set : symbolSet = symbolSet()
    @State var symbolGroup : [String]
    var body: some View {
        VStack{
            VStack{
                    HStack{
                        Text("Selected Symbol: ")
                        Image(thisClass.icon)
                            .font(Font.title)
                    }
                }.frame(height: 60)
            ScrollView{
                LazyVGrid(columns: columnLayout) {
                    
                    
                    ForEach(symbolGroup.indices, id: \.self) {index in
                        ZStack{
                            RoundedRectangle(cornerRadius: 10).fill(.clear).frame(minWidth: 40, minHeight: 60)
                            Button{
                                thisClass.icon = symbolGroup[index]
                            } label: {
                                Image(systemName: symbolGroup[index]).font(.title2)
                            }
                        }
                    }
                }
            }.padding()
        }
    }

}*/
struct symbolDisplayView: View {
    @StateObject var thisClass: Class
    let columnLayout = Array(repeating: GridItem(), count: 4)
    var set : symbolSet = symbolSet()
    @State var symbolGroup : [String]
    var body: some View {
        VStack{
            VStack{
                    HStack{
                        Text("Selected Symbol: ")
                        Image(systemName: thisClass.icon).font(Font.title)
                    }
                }.frame(height: 60)
            ScrollView{
                LazyVGrid(columns: columnLayout) {
                    
                    ForEach(symbolGroup.indices, id: \.self) {index in
                        ZStack{
                            RoundedRectangle(cornerRadius: 10).fill(.clear).frame(minWidth: 40, minHeight: 60)
                            Button{
                                thisClass.icon = symbolGroup[index]
                            } label: {
                                Image (systemName: symbolGroup[index]).font(.title2)
                            }
                        }
                    }
                }
            }.padding()
        }
    }
}
