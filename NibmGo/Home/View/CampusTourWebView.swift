import AVKit
import SwiftUI

struct CampusTourWebView: View {
    @State var player = AVPlayer()
    @State var isPlaying = false

    var body: some View {
        ZStack {
            VideoPlayer(player: player)
                .frame(height: 200)
                .cornerRadius(15)

            if !isPlaying {
                Button {
                    player.play()
                    isPlaying = true
                } label: {
                    Image(systemName: "play.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .frame(
                            width: UIScreen.main.bounds.width * 0.1,
                            height: UIScreen.main.bounds.width * 0.1
                        )
                        .padding(10)
                }
            }
        }
        .onAppear {
            player = playVideo(file: "tour")
        }
        .background(.white)
        .cornerRadius(15)
    }

    func playVideo(file: String) -> AVPlayer {
        guard let path = Bundle.main.path(forResource: file, ofType: "mp4")
        else {
            fatalError("video not found")
        }
        let url = URL(fileURLWithPath: path)
        return AVPlayer(url: url)
    }
}

#Preview {
    CampusTourWebView()
}
