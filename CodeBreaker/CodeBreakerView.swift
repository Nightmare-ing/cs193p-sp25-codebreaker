import SwiftUI
import Playgrounds

struct CodeBreakerView: View {
    @State var game = CodeBreaker()
    
    var body: some View {
        VStack {
            CodeView(code: game.masterCode)
            CodeView(code: game.guessCode) { idx in
                game.changeGuessPeg(at: idx)
            } onButtonTap: {
                game.addAttempt()
            }
            ForEach(game.attempts.indices, id: \.self) { idx in
                CodeView(code: game.attempts[idx])
            }
        }.padding()
    }
}

#Preview {
    CodeBreakerView()
}
