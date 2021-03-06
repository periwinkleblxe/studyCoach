//
//  studyCoachApp.swift
//  studyCoach
//
//  Created by Nayantara Das on 6/15/22.
//

import SwiftUI
import UIKit
import FirebaseDatabase
import FirebaseCore
import FirebaseAuth


//import FirebaseFirestore
/*
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      //let provider = FUIOAuth.appleAuthProvider()
      var ref: DatabaseReference!
          ref = Database.database().reference()
      return true
  }
}*/

@main
struct studyCoachApp: App {
    init() {
            FirebaseApp.configure()
        }
    //@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @Environment(\.scenePhase) private var scenePhase
    @StateObject var classData: ClassData = ClassData()
    @StateObject var tData: taskData = taskData()
    @StateObject var tgData: tagData = tagData()
    @StateObject var thisUser: User = User()
    @StateObject var dateData: dates = dates()
    @StateObject var dData: dayData = dayData()
    
    //@StateObject var dataSet: dataCaching = dataCaching()
    var body: some Scene {
        WindowGroup {
            
            ContentView()
                
                        //fill text with preview features?
                /*Text("")
                    .foregroundStyle(.secondary)*/
            
            .environmentObject(classData)
            .environmentObject(tData)
            .environmentObject(tgData)
            .environmentObject(thisUser)
            .environmentObject(dateData)
            .environmentObject(dData)
        }.onChange(of: scenePhase) { phase in
            if phase == .background {
                //dataSet.saveData()
            }
            if phase == .active {
                //let handle = Auth.auth().addStateDidChangeListener { auth, user in
                  
                
            }
        }    }
    
    
    
}
