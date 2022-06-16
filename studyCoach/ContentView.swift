import SwiftUI
import Firebase
import FirebaseAuth

struct ContentView: View {
    @Binding var userUnAuth: Bool
    @Environment(\.scenePhase) private var scenePhase
    //@EnvironmentObject var thisUser: User
    var handle: AuthStateDidChangeListenerHandle?
    var body: some View {
        
            
                VStack{
                    ZStack{
                        LinearGradient(gradient: Gradient(colors: [.orange, .pink, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea().frame(maxHeight: 50)
                            .saturation(2)
                            .blur(radius: 5)
                        Text("Study Coach").font(Font.largeTitle)//.foregroundColor(.white)
                        
                    }//.ignoresSafeArea()
                    TabView {
                        NavigationView {
                            dashboardView()
                                .navigationBarHidden(true)
                            Text("This is the iPad content").foregroundStyle(.secondary)
                        }
                        .tabItem {
                                Image(systemName: "sun.and.horizon")
                                Text("Dashboard")
                                
                            }.tag(1)
                        NavigationView{
                            classTabView()
                                .navigationBarHidden(true)
                        }
                            .tabItem {
                                Image(systemName: "graduationcap")
                                Text("Classes")
                            }.tag(2)
                        NavigationView{
                            taskTabView()
                                .navigationBarHidden(true)
                        }
                            .tabItem {
                                Image(systemName: "pencil")
                                Text("Tasks")
                            }.tag(3)
                        NavigationView{
                            scheduleTabView()
                                .navigationBarHidden(true)
                        }
                            .tabItem {
                                Image(systemName: "calendar")
                                Text("Schedule")
                            }.tag(4)
                        Text("Tab Content 4")
                            .tabItem {
                                Image(systemName: "books.vertical")
                                Text("Study")
                            }.tag(4)
                    
                    }
                    //Spacer()
                }.fullScreenCover(isPresented: $userUnAuth, content: {
                    NavigationView{
                        
                        AppStartView()
                            .navigationBarHidden(true)
                    }
                })
        
    }
        
    
    
}


