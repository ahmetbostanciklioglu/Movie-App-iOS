//
//  String.swift
//  movie
//
//  Created by Ahmet Bostanci on 25.04.2025.
//

import Foundation

extension String {
    var capitalizeFirstLetter: String {
        if self.count == 0 { return self }
        return prefix(1).uppercased() + dropFirst()
    }
}
