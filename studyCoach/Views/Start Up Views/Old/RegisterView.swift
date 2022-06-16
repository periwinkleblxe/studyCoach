import SwiftUI
import Firebase
import FirebaseAuth
struct RegisterView: View {
    let userRef = Database.database().reference(withPath: "users")
    //var userRefObservers: [DatabaseHandle] = []
    @State var user: User?
    @State var handle: AuthStateDidChangeListenerHandle?
    @State var email = ""
            @State var password = ""
            @Environment(\.dismiss) private var dismiss
            var body: some View {
                VStack {
                    TextField("Enter Email", text: $email)
                    SecureField("Enter Password", text: $password)
                    Button {
                        registerUser()
                    } label: {
                        Text("Login")
                    }
                }
                .navigationTitle("Create an account")
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
    func registerUser() {
        Auth.auth().createUser(withEmail: email, password: password) { _, error in
          // 3
          if error == nil {
            Auth.auth().signIn(withEmail: email, password: password)
            
              //self.userRef.child(
              
          } else {
            print("Error in createUser: \(error?.localizedDescription ?? "")")
          }
        }    }
    func setUser() {
        handle = Auth.auth().addStateDidChangeListener{ _, user in
            //guard let user = user else {return}
            //let newUser = UserAccount(email: email)
            //have useraccount save data
        }
    }
    
}
    
