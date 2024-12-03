import Foundation
import SwiftUI
import CoreGraphics

struct CirclePart : Shape {
    var startAngle: Angle = Angle.zero
    let endAngle: Angle
    var clockwise = true
    
    func path(in rect: CGRect) -> Path {
        let startAngle = startAngle - .degrees(90)
        let endAngle = endAngle - .degrees(90)
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(x: center.x + radius * cos(startAngle.radians), y: center.y + radius * sin(startAngle.radians))
        
        var path = Path()
        path.fill(Color.blue)
        path.move(to: center)
        path.addLine(to: start)
        path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: !clockwise)
        path.addLine(to: center)
        
        return path
    }
}

#Preview {
    CirclePart(startAngle: .degrees(0), endAngle: .degrees(270))
}
