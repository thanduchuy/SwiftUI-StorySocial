import SwiftUI

struct Loader: View {
    @State var width : CGFloat = 100
    @Binding var show : Bool
    @State var sesc : CGFloat = 0
    var time = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(Color.black)
                .frame(height: 5)
            Rectangle()
                .fill(Color.white)
                .frame(width: self.width, height: 5)
        }
        .onReceive(self.time) { _ in
            self.sesc += 0.1
            if self.sesc <= 6 {
                let sceenWidth = UIScreen.main.bounds.width
                self.width = sceenWidth * (self.sesc / 6)
            } else {
                self.show = false
            }
        }
    }
}

