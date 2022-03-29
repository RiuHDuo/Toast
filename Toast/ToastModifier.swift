//
//  ToastModifier.swift
//  Toast
//
//  Created by RiuHDuo on 2022/3/28.
//

import SwiftUI
import Combine

public struct ToastModifier: ViewModifier{
    var screen: CGRect{
        return UIScreen.main.bounds
    }
    
    @ObservedObject var controller:ToastController
    @Binding var toastList: [ToastMessage]
    
    public func body(content: Content) -> some View{
        ZStack{
            content
            if let msg = controller.message {
                ToastView(content: msg.content, icon: msg.icon, isExpanding: controller.isExpanding, style: msg.style)
                    .opacity(controller.opacity)
                    .offset(y: controller.offset)
                    .padding(.vertical)
                    .animation(.none, value: controller.offset)
                    .zIndex(999)
            }
        }.onAppear(){
            controller.onAppear()
        }.onChange(of: toastList) { _ in
            controller.update()
        }
    }

}
