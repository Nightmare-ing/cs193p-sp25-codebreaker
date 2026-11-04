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

struct PlayPegs: View {
    var pegColors: [Color]
    var body: some View {
        HStack {
            ForEach(pegColors.indices, id: \.self) {
                RoundedRectangle(cornerRadius: 12)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(pegColors[$0])
            }
        }
    }
}

#Preview {
    ContentView()
}
