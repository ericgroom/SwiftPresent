//
//  ForceGenerators.swift
//  Boids
//
//  Created by Eric Groom on 7/12/21.
//

import Foundation
import SimulationKit

typealias Force = Vec2
typealias ForceGenerator = (Boid, NeighborFinder, ForceConfiguration) -> Force

protocol NeighborFinder {
    func query(seenBy subject: Boid) -> [Boid]
}

extension Array: NeighborFinder where Element == Boid {
    func query(seenBy subject: Boid) -> [Boid] {
        filter { other in
            subject.vision.contains(other.position)
        }
    }
}

struct ForceConfiguration {
    let maxSpeed: Double
    
    static let `default` = ForceConfiguration(maxSpeed: 300.0)
}

func alignmentForceGenerator(actOn boid: Boid, boids: NeighborFinder, configuration: ForceConfiguration) -> Force {
    var avgVelocity = Vec2.zero
    var count = 0
    for other in boids.query(seenBy: boid) where other != boid { // potential bug, need identity
        avgVelocity += other.velocity
        count += 1
    }
    
    var steering = avgVelocity
    if count > 0 {
        steering /= Double(count)
        steering.magnitude = configuration.maxSpeed
        steering -= boid.velocity
    }
    return steering
}

func cohesionForceGenerator(actOn boid: Boid, boids: NeighborFinder, configuration: ForceConfiguration) -> Force {
    var avgPosition = Vec2.zero
    var count = 0
    for other in boids.query(seenBy: boid) where other != boid { // potential bug, need identity
        avgPosition += other.position
        count += 1
    }

    var steering = avgPosition
    if count > 0 {
        steering /= Double(count)
        steering -= boid.position
        steering.magnitude = configuration.maxSpeed
        steering -= boid.velocity
    }
    return steering
}

func separationForceGenerator(actOn boid: Boid, boids: NeighborFinder, configuration: ForceConfiguration) -> Force {
    var steering = Vec2.zero
    var count = 0
    for other in boids.query(seenBy: boid) where other != boid { // potential bug, need identity
        let distance = boid.position.distance(to: other.position)
        guard distance < boid.visionRadius else { fatalError() }
        
        var diff = boid.position - other.position
        if distance*distance != 0 {
            diff /= distance*distance
        }
        steering += diff
        count += 1
    }

    if count > 0 {
        steering /= Double(count)
        steering.magnitude = configuration.maxSpeed
        steering -= boid.velocity
    }
    return steering
}
