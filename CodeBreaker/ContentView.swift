import SwiftUI
import Playgrounds

struct ContentView: View {
    var body: some View {
        VStack {
            PlayPegs(pegColors: [.red, .blue, .red, .green])
            PlayPegs(pegColors: [.blue, .yellow, .red, .blue])
            PlayPegs(pegColors: [.yellow, .yellow, .blue, .green])
            PlayPegs(pegColors: [.red, .blue, .blue, .green])
        }.padding()
    }
}


#Preview {
    ContentView()
}
