//
//  Toast.swift
//  LuckyPay
//
//  Created by RiuHDuo on 2021/3/29.
//

import SwiftUI
import Combine

let BOX_WIDTH: CGFloat = 250

public struct Toast: View{
    var message: ToastMessage
    var isExpanding: Bool = false
    public init(message: ToastMessage){
        self.message = message
    }
    
    var screen: CGRect{
        return UIScreen.main.bounds
    }
    
    public var body: some View{
        content
    }
    
    @ViewBuilder
    var content: some View{
        ToastView(title: message.title, subTitle: message.subTitle, icon: message.icon, isExpanding: isExpanding)
    }
}

extension Toast{
    func set(isExpanding: Bool) -> Self{
        var this = self
        this.isExpanding = isExpanding
        return this
    }
}
