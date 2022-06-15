import SwiftUI

struct symbolSelectorView: View {
    @StateObject var thisClass : Class
    @State var category=0
    //@StateObject var SelSym: selSym
    @State var set : symbolSet = symbolSet()
    var body: some View {
        VStack{
            Picker(selection: $category, label: Text("Picker")) {
                            Text("Math").tag(0)
                            Text("Science").tag(1)
                            Text("Technology").tag(2)
                            Text("Language Arts").tag(3)
                            Text("Social Science").tag(4)
                            Text("Fine Arts").tag(5)
                            Text("Sports/PE").tag(6)
                            Text("Career").tag(7)
                        }.pickerStyle(.wheel)
                        ScrollView{
                            if(category == 0) {
                                symbolDisplayView(thisClass: thisClass, set: set, symbolGroup: symbolSet.math)
                            } else if (category == 1) {
                                symbolDisplayView(thisClass: thisClass, set: set, symbolGroup: symbolSet.science)
                            } else if (category == 2) {
                                symbolDisplayView(thisClass: thisClass, set: set, symbolGroup: symbolSet.technology)
                                
                            } else if (category == 3) {
                                symbolDisplayView(thisClass: thisClass, set: set, symbolGroup: symbolSet.language)
                                
                            }else if (category == 4) {
                                symbolDisplayView(thisClass: thisClass, set: set, symbolGroup: symbolSet.social)
                                
                            }        else if (category == 5) {
                                symbolDisplayView(thisClass: thisClass, set: set, symbolGroup: symbolSet.art)
                                
                            }        else if (category == 6) {
                                symbolDisplayView(thisClass: thisClass, set: set, symbolGroup: symbolSet.physical)
                                
                            } else if (category == 7) {
                                symbolDisplayView(thisClass: thisClass, set: set, symbolGroup: symbolSet.career)
                            }
                        }
            /*
            Menu{
                ForEach(options.allCases) {opID in
                    Button {
                        set.choices = opID
                        set.symbolGroup = set.returnStrings(choice: opID)
                        print(opID)
                    } label: {
                    Text(opID.name).tag(opID)
                    }
                }
            } label: {
                Text("Select Icon")
            }
            
            ScrollView{
               
                //symbolDisplayView(thisClass: thisClass, symbolGroup: SelSym(symbolSet(selected: category)))
                
        
                
                    setView()
                 
            }
            }*/
    }
    }
}
