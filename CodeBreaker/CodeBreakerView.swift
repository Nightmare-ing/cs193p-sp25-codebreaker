import SwiftUI
import Playgrounds

struct CodeBreakerView: View {
    @State var game = CodeBreaker()
    
    var body: some View {
        VStack {
            CodeView(code: game.masterCode)
            ScrollView {
                CodeView(code: game.guessCode) { idx in
                    game.changeGuessPeg(at: idx)
                } onButtonTap: {
                    withAnimation {
                        game.addAttempt()
                    }
                }

                ForEach(game.attempts.indices.reversed(), id: \.self) { idx in
                    CodeView(code: game.attempts[idx])
                }
            }
        }.padding()
    }
}

#Preview {
    CodeBreakerView()
}
