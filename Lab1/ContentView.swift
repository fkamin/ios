import SwiftUI

struct ContentView: View {
    var arraysOfColor: [ColorData] = [
        ColorData.init(colorName: "red", colorValue: Color.red),
        ColorData.init(colorName: "blue", colorValue: Color.blue),
        ColorData.init(colorName: "yellow", colorValue: Color.yellow),
        ColorData.init(colorName: "green", colorValue: Color.green),
        ColorData.init(colorName: "purple", colorValue: Color.purple),
        ColorData.init(colorName: "orange", colorValue: Color.orange),
        ColorData.init(colorName: "black", colorValue: Color.black),
        ColorData.init(colorName: "gray", colorValue: Color.gray),
    ]
    
    var body: some View {
        VStack {
            Circle().fill(Color.red).opacity(0.5)
            Circle().fill(Color.blue).opacity(0.5)
            Circle().fill(randColor())
        }
        .padding()
    }
    
    func randColor() -> Color {
        let randomColor = Int.random(in: 0..<8)
        //arraysOfColor[randomColor].incCount()
        return arraysOfColor[randomColor].colorValue
    }
}

#Preview {
    ContentView()
}
