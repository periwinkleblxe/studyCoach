import SwiftUI

struct RegisterView: View {
    @Environment(\.dismiss) private var dismiss
    @State var progress = 0
    @State var currentUser: User = User()
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var regComplete:Bool = false
    
    @State var isNewClass: Bool = false //toggles for new class page
    var body: some View {
        VStack{
            /*
            if(regComplete == true) {
                initClassView
            } else {
                registerView
            }*/
            
        }
        .toolbar {
            HStack{
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(Color.blue)
                }
                Button {
                    regComplete.toggle()
                    
                } label: {
                    Image(systemName: "arrow.right")
                        .foregroundColor(.blue)
                }
            }
        } 
            
        
        .navigationTitle("Get Started")
    }
    var initClassView: some View {
        VStack{
            Divider()
            ScrollView{
                VStack(alignment: HorizontalAlignment.center) {
                    HStack {
                        Text("Add your classes: ")
                            .padding()
                            .font(Font.system(.body).weight(.light))
                        Spacer()
                        Button {
                            
                            isNewClass.toggle()
                            
                        } label: {
                            if(isNewClass){
                                Text("Cancel")
                                    .foregroundColor(Color.blue)
                                Image(systemName: "pencil.slash")
                                    .foregroundColor(Color.blue)
                            }
                            else {
                                Text("Add")
                                .foregroundColor(Color.blue)
                                Image(systemName: "plus")
                                .foregroundColor(Color.blue)
                            }
                        }
                        .buttonStyle(.bordered)
                        .padding()
                        
                    }
                    Divider()
                    if (isNewClass) {
                        //ClassInitView()
                    }
                }
            }
        }
    }
    /*
    var newClassView: some View {
        VStack {
            TextField("Class Name: ", text: $newClass.className)
                .padding()
        }
    }*/
    var registerView: some View {
        VStack{
            Divider()
            ScrollView {
                VStack(alignment: HorizontalAlignment.leading) {
                    
                    Text("Let's start with the basics:")
                        .padding()
                        .font(Font.system(.body).weight(.light))
                    Divider()
                    
                    HStack{
                        TextField("First Name: ", text: $firstName)
                            .padding()
                        TextField("Last Name: ", text: $lastName)
                    }
                    
                }
                
            }
        }
        
    }
}
