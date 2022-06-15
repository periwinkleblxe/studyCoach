import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) private var dismiss  
    var body: some View {
        VStack {
            
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
}
