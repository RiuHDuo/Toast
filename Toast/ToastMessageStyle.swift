//
//  ToastMessageStyle.swift
//  Toast
//
//  Created by RiuHDuo on 2022/3/29.
//

import SwiftUI


public enum ToastPosition{
    case top
    case bottom
    case center
}

public struct ToastMessageStyle{
    let position: ToastPosition
    let background: AnyShapeStyle
    let hasFeedback: Bool
    
    public init<S: ShapeStyle>(position: ToastPosition = .top, background: S, hasFeedback: Bool = false){
        self.position = position
        self.background = AnyShapeStyle(background)
        self.hasFeedback = hasFeedback
    }
}
