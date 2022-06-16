import SwiftUI
import FirebaseCore
import FirebaseAuth
struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @Environment(\.dismiss) private var dismiss  
    var body: some View {
        VStack {
            TextField("Enter Email", text: $email)
            SecureField("Enter Password", text: $password)
            Button {
                login()
            } label: {
                Text("Login")
            }
        }
        .navigationTitle("Welcome Back!")
        .toolbar {
            HStack{
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "pencil.slash")
                        .foregroundColor(.blue)
                }
            }
        }
    }
    func login(){
           Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
               if error != nil {
                   print(error?.localizedDescription ?? "")
                   
               } else {
                   print("success")
                   
               }
           }
       }
    
}
