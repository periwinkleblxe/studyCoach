import SwiftUI
import Firebase
import FirebaseAuth
struct RegisterView: View {
    //@StateObject var classData: ClassData = ClassData()
    //@StateObject var tData: taskData = taskData()
    //@StateObject var tgData: tagData = tagData()
    //@StateObject var dateData: dates = dates()
    //@StateObject var dData: dayData = dayData()
    let userRef = Database.database().reference(withPath: "users")
    //var userRefObservers: [DatabaseHandle] = []
    //@State var user: User?
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
              //Auth.auth().currentUser?.uid
              
              
                  
              //self.userRef.child(
              
          } else {
            print("Error in createUser: \(error?.localizedDescription ?? "")")
          }
        }    }
    func setUser() {
        handle = Auth.auth().addStateDidChangeListener{ _, user in
            
            guard let user = user else {return}
            self.userRef.child("users").child(user.uid).setValue(["username": email])
            //let newUser = UserAccount(email: email)
            //have useraccount save data
        }
    }
    
}
    
