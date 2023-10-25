//
//  ApexPredator.swift
//  Apex Predators - Master Detail App
//
//  Created by Tiago Pinheiro on 24/10/2023.
//

import Foundation
import SwiftUI

struct ApexPredator: Codable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    func typeOverlayer() -> Color {
        switch type {
        case "land":
            return .brown.opacity(0.33)
        case "sea":
            return .blue.opacity(0.33)
        case "air":
            return .teal.opacity(0.33)
        default:
            return .black
        }
    }
}

struct MovieScene: Codable, Identifiable {
    let id: Int
    let movie: String
    let sceneDescription: String
}
