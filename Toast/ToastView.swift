//
//  ToastView.swift
//  Toast
//
//  Created by RiuHDuo on 2022/3/28.
//

import SwiftUI

let BOX_WIDTH: CGFloat = 250

struct ToastView<Content: View, Icon: View>: View {
    var content: Content
    var icon: Icon?
    var isExpanding: Bool
    var style: ToastMessageStyle
    
    var body: some View {
        HStack(alignment: .center){
            icon.frame(width: 32, height: 32)
            if isExpanding {
                content
                .frame(width: 150)
                .padding(.trailing, icon == nil ? 0: 32)
                .transition(.scale.combined(with: .opacity))
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .frame(height: 48, alignment: .leading)
        .frame(width: isExpanding ? BOX_WIDTH : 48)
        .background {
            RoundedRectangle(cornerRadius: 24)
                .foregroundStyle(style.background)
        }
    }
    
}
