//
//  String+Extensions.swift
//  ApexPredators_MastersDetails_App
//
//  Created by Tiago Pinheiro on 24/10/2023.
//

import Foundation

extension String {
    func lowerCasedNoSpaces() -> Self {
        lowercased().filter { $0 != " " }
    }
}
