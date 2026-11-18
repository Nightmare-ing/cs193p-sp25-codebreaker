import SwiftUI
import Playgrounds

struct ContentView: View {
    var game = CodeBreaker()
    
    var body: some View {
        VStack {
            PlayPegs(pegColors: game.masterCode.pegs)
            PlayPegs(pegColors: game.guessCode.pegs)
            ForEach(game.attempts.indices, id: \.self) { idx in
                PlayPegs(pegColors: game.attempts[idx].pegs)
            }
        }.padding()
    }
}

#Preview {
    ContentView()
}
