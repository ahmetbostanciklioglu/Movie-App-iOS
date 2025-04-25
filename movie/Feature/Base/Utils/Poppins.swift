//
//  Poppins.swift
//  movie
//
//  Created by Ahmet Bostanci on 25.04.2025.
//

import Foundation

enum Poppins: String {
 case black, blackItalic, bold, boldItalic, extraBold, extraBoldItalic, extraLight, extraLightItalic, italic, light, lightItalic, medium, mediumItalic, regular, semiBold, semiBoldItalic, thin, thinItalic
    
    var fontName: String {
        "Poppins-\(self.rawValue.capitalized)"
    }
 
}
