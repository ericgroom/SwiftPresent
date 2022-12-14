//
//  Boid.swift
//  Boids
//
//  Created by Eric Groom on 7/10/21.
//

import Foundation
import SwiftUI
import SimulationKit

let boidColors = [
    Color("PalenightBlue"),
    Color("PalenightCyan"),
    Color("PalenightRed"),
    Color("PalenightYellow"),
    Color("PalenightGreen"),
    Color("PalenightMagenta")
]

struct Boid: Equatable {
    var position: Vec2
    var velocity: Vec2
    var acceleration: Vec2
    var visionRadius: Double
    
    let color: Color = boidColors.randomElement()!
    
    var vision: CircleSector {
        CircleSector(center: position, heading: velocity.direction, width: 5.23599, radius: visionRadius)
    }
}
