import SwiftUI

struct ContentView: View {
    @State var selectActivity : Int = Int.max
    @State var show = false
    
    var body: some View {
        ZStack {
            Color("bg")
                .opacity(0.15)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(Array(DataConstant.listStory.enumerated()), id: \.offset) { index, item in
                            VStack {
                                ZStack {
                                    Image(uiImage: UIImage(named: item.avatar) ?? UIImage())
                                        .renderingMode(.original)
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .clipShape(Circle())
                                    
                                    Circle()
                                        .trim(from: 0, to: 1)
                                        .stroke(
                                            AngularGradient(
                                                gradient: .init(colors:[ Color("circle") ]),
                                                center: .center),
                                            style: StrokeStyle(
                                                lineWidth: 4,
                                                dash: [ self.selectActivity == index ? 7: 1 ]))
                                        .frame(width: 85, height: 85)
                                        .rotationEffect(
                                            .init(degrees: self.selectActivity == index ? 360 : 1))
                                }
                                .onTapGesture {
                                    withAnimation(Animation.default.speed(0.35)
                                                    .repeatForever(
                                                    autoreverses: false)) {
                                        self.selectActivity = index
                                    }
                                    
                                    withAnimation(Animation.default.delay(1)) {
                                        self.show.toggle()
                                    }
                                }
                                
                                Text(item.name)
                                    .font(.headline)
                                    .fontWeight(.bold)
                            }
                            .padding(5)
                        }
                    }
                }
                Spacer()
            }
            
            if self.show {
                ZStack(alignment: .topTrailing) {
                    Color("active")
                        .edgesIgnoringSafeArea(.all)
                    ZStack(alignment: .topLeading) {
                        GeometryReader { _ in
                            VStack(spacing: 20) {
                                Image(
                                    uiImage: UIImage(named: DataConstant.listStory[selectActivity].image) ?? UIImage())
                                    .resizable()
                                    .cornerRadius(10)
                            }
                            .padding()
                            .foregroundColor(.black)
                        }
                        Loader(show: self.$show)
                    }
                }
                .transition(.move(edge: .trailing))
                .onTapGesture {
                    withAnimation(.default) {
                        self.show = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
