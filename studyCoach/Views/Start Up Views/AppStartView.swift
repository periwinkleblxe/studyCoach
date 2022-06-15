import SwiftUI
import UIKit

struct AppStartView: View {
    @State var isNewUser: Bool = false
    @State var isReturning: Bool = false
    var body: some View {
        VStack{
        VStack(alignment: HorizontalAlignment.center){ 
            Text("Study Coach")
                .font(Font.largeTitle)
            
                
            LinearGradient(gradient: Gradient(colors: [Color.cyan, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(maxWidth: 300, maxHeight: 300)
                .cornerRadius(40)
                .saturation(4)
                .blur(radius: 2)
                .padding()
                .overlay(
                        Text("Content Placeholder")
                            .font(Font.system(.body).weight(.light))         
                    )
                /*.overlay(
                        LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                    )*/
                    
            
            Text("Study Coach is an innovative app that supports students through effective time management, organization, and productivity management.")
                .padding()
                .font(Font.system(.body).weight(.light)).foregroundColor(Color.secondary)
            }
        HStack{
            Button{
                isNewUser = true
            } label: {
                Text("Get Started")
                    .foregroundColor(.blue)
            }
            .sheet(isPresented: $isNewUser) { 
                NavigationView {
                    //new user view
                    RegisterView()
                }
                //.navigationTitle("Register")
            }
            Button {
                isReturning = true
            } label: {
                Text("Log In")
                    .foregroundColor(.blue)
            }
            .sheet(isPresented: $isReturning) { 
                NavigationView {
                    //returning user view
                    LoginView()
                }
                
            }
        }.buttonStyle(.bordered)
        
        NavigationLink(destination: registerGuestUserView().navigationTitle("Getting Started")) {
            
                Text("Continue as Guest").font(.body).fontWeight(.regular).foregroundColor(.blue)
            
        }.padding()
        
        //is the sheet mecessary?
        
        
    }
    }
}
