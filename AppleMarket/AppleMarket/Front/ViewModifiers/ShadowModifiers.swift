//
//  ShadowModifiers.swift
//  AppleMarket
//
//  Created by Martin on 2023/01/03.
//

import SwiftUI

struct BasicShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(radius: 10)
    }
}

struct ThinShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color(UIColor.systemGray3), radius: 10)
    }
}

extension View {
    func basicShadow() -> some View {
        modifier(BasicShadow())
    }
    
    func thinShadow() -> some View {
        modifier(ThinShadow())
    }
}
