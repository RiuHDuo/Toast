//
//  ToastController.swift
//  Toast
//
//  Created by RiuHDuo on 2022/3/29.
//

import SwiftUI


class ToastController: ObservableObject{
    @Published var isExpanding = false
    @Published var message: ToastMessage? = nil
    @Published var opacity: CGFloat = 0
    @Published var offset: CGFloat = 64
    @Binding var toastList: [ToastMessage]
    var timer: Timer? = nil
    var isShowing = false
    init(toastList: Binding<[ToastMessage]>){
        _toastList = toastList
    }
    
    func onAppear(){
        
    }
    
    deinit{
        self.timer?.invalidate()
    }
    
    let interval: TimeInterval = 0.2
    let haptic = UINotificationFeedbackGenerator()
    
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func update(){
        if !self.toastList.isEmpty && isShowing == false {
            self.isShowing = true
            hideKeyboard()
            withAnimation {
                self.message = self.toastList.removeFirst()
                self.opacity = 0
            }
            guard let msg = self.message else{
                return
            }
            let duration = msg.duration
            self.offset =  msg.style.position == .top ? 64 - UIScreen.main.bounds.height / 2 : msg.style.position == .center ? 0 : UIScreen.main.bounds.height / 2 - 64
            if self.message?.style.hasFeedback == true{
                haptic.notificationOccurred(.warning)
            }
            withAnimation(.easeIn.delay(interval)){
                opacity = 1
                self.isExpanding = true
            }
            withAnimation (.easeOut.delay(duration + interval)){
                self.isExpanding = false
            }
            withAnimation(.easeOut(duration: self.interval).delay(duration + interval + 0.5)) {
                self.message = nil
            }
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: duration + interval * 3 + 0.5, repeats: false, block: { _ in
                self.isShowing = false
                self.update()
            })
        }
    }
}
