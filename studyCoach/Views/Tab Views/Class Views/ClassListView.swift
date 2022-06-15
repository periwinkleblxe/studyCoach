import SwiftUI

struct classListView: View {
    @EnvironmentObject var classData:ClassData
    var body: some View {
        
                ForEach (classData.classes) { classID in
                    NavigationLink(destination: classDetailView(thisClass: classID).navigationTitle(classID.className).navigationBarTitleDisplayMode(.inline)) {
                        classCardView(thisClass: classID)
                    }.buttonStyle(.plain)               
                }
                
        
    }
}
