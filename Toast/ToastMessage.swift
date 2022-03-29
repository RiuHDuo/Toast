//
//  ToastMessage.swift
//  Toast
//
//  Created by RiuHDuo on 2022/3/28.
//

import SwiftUI

public struct ToastMessage: Equatable{
    public static func == (lhs: ToastMessage, rhs: ToastMessage) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    
    let content:AnyView
    let icon: AnyView?
    let style: ToastMessageStyle
    let duration: TimeInterval
    let uuid = UUID().uuidString
    
    public init(title: String, titleColor: Color = .black, subTitle: String?  = nil, subTitleColor: Color  = .gray, duration: TimeInterval = 2, style: ToastMessageStyle = ToastMessageStyle(background: .regularMaterial)){
        let v: AnyView? = nil
        self.init(title: title, titleColor: titleColor, subTitle: subTitle, subTitleColor: subTitleColor, icon: v, duration: duration, style: style)
    }
    
    public init<ICON: View>(title: String, titleColor: Color = .black, subTitle: String?  = nil, subTitleColor: Color  = .gray, icon: ICON?, duration: TimeInterval = 2, style: ToastMessageStyle = ToastMessageStyle(background: .regularMaterial)){
        self.icon = icon == nil ?  nil : AnyView(icon!)
        self.content = AnyView(VStack{
            Text(title)
                .bold()
                .foregroundColor(titleColor)
            if let subTitle = subTitle {
                Text(subTitle)
                    .font(.footnote)
                    .foregroundColor(subTitleColor)
            }
        })
        self.style = style
        self.duration = duration
    }
    
    public init<C:View, I: View>(content: C, icon: I?, duration: TimeInterval = 2, style: ToastMessageStyle = ToastMessageStyle(background: .regularMaterial)){
        self.icon = icon == nil ?  nil : AnyView(icon!)
        self.content = AnyView(content)
        self.style = style
        self.duration = 2
    }
}

