import SwiftUI
import Playgrounds

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                PlayPegs(pegColors: [.red, .blue, .red, .green])
            }
            HStack {
                PlayPegs(pegColors: [.blue, .yellow, .red, .blue])
            }
            HStack {
                PlayPegs(pegColors: [.yellow, .yellow, .blue, .green])
            }
            HStack {
                PlayPegs(pegColors: [.red, .blue, .red, .green])
            }
        }.padding()
    }
}

#Preview {
    ContentView()
}
