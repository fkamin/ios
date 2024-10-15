import Foundation
import SwiftUI

struct ColorData {
    let colorName: String
    let colorValue: Color
    let id: String = UUID().uuidString
    var count: Int = 0
    
    init(colorName: String, colorValue: Color) {
        self.colorName = colorName
        self.colorValue = colorValue
    }
    
    mutating func incCount() {
        count += 1
    }
}
