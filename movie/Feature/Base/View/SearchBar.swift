//
//  SearchBar.swift
//  movie
//
//  Created by Ahmet Bostanci on 25.04.2025.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
        TextField("Search", text: $searchText)
            .focused($isFocused)
            .overlay(
                ZStack {
                    Image.CancelIcon
                        .foregroundStyle(.white)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                            isFocused = false
                        }
                    Image.SearchIcon
                        .opacity(searchText.isEmpty ? 1.0 : 0.0)
                },alignment: .trailing)
            .foregroundStyle(.white)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.appGrayColor1)
            )
    }
}

#Preview {
    SearchBar(searchText: .constant(""))
}
