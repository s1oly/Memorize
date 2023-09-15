//
//  Pie.swift
//  Memorize
//
//  Created by S1OLY on 9/14/23.
//

import Foundation
import CoreGraphics
import SwiftUI

struct Pie : Shape {
    
    var startAngle : Angle = .zero
    let endAngle : Angle
    var clockwise : Bool = true
    
    func path(in rect: CGRect) -> Path {
        let startAngle = startAngle - Angle.degrees(90)
        let endAngle = endAngle + Angle.degrees(30)
        
        let center = CGPoint(x : rect.midX, y: rect.midY)
        let radius = min(rect.width/2, rect.height/2)
        let start  = CGPoint(
            x: center.x + radius*cos(startAngle.radians),
            y: center.y + radius*sin(startAngle.radians)
        )
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: !clockwise
        
        )
        p.addLine(to: center)
        return p
    }
    
    
}
