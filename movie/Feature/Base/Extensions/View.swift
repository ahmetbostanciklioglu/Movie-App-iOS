//
//  View.swift
//  movie
//
//  Created by Ahmet Bostanci on 25.04.2025.
//

import SwiftUI

extension View {
    func poppins(_ font: Poppins, _ size: CGFloat = 14) -> some View {
        self.font(.custom(font.fontName, size: size))
    }
    
    var screenWidth: CGFloat {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return UIScreen.main.bounds.width
        }
        return windowScene.screen.bounds.width
    }
    
    var screenHeight: CGFloat {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return UIScreen.main.bounds.height
        }
        return windowScene.screen.bounds.height
    }
}
