//
//  ViewExtension.swift
//  Toast
//
//  Created by RiuHDuo on 2022/3/28.
//

import SwiftUI


public extension View{
    func toast(toastList:Binding<[ToastMessage]>) -> some View{
        modifier(ToastModifier(controller: ToastController(toastList: toastList), toastList: toastList))
    }
}



extension View {
    func debugPrint(_ value:Any) -> some View {
#if DEBUG
        print(value)
#endif
        return self
    }
}
