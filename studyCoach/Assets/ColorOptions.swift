import SwiftUI
struct colorOptions: Identifiable {
    @Environment(\.colorScheme) var colorScheme
    var id = UUID()
    var all : [Color] = [
        Color.red,
        Color.orange,
        Color.yellow,
        Color.green,
        Color.mint,
        Color.teal,
        Color.cyan,
        Color.blue,
        Color.indigo,
        Color.purple,
        Color.pink,
        Color.brown
    ]
    var complementaryLight: [Color] = [
        
    ]
    @State var currentColor = Color.clear
    var compGreen: Color {
        switch colorScheme {
        case .light: return Color(red: 200/255, green: 1, blue: 200/255) 
        case .dark: return Color(red: 0, green: 45/255, blue: 0)
        @unknown default: return .clear
        }
        //return Color(red: 187/255, green: 250/255, blue: 206/255)
    }
    
}

extension Color {
    
    public static var gray6: Color {
        return Color(uiColor: .systemGray6)
    }
    public static var darkGreen: Color {
        return Color(red: 0, green: 45/255, blue: 0)
    }
    public static var lightGreen: Color {
        return Color(red: 200/255, green: 1, blue: 200/255) 
        
    }
}
