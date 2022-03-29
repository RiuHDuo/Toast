//
//  ContentView.swift
//  Example
//
//  Created by RiuHDuo on 2022/3/28.
//

import SwiftUI
import Toast

var index = 0

struct ContentView: View {
    @State var toastList = [ToastMessage]()

    let colors = [Color(hue: 191 / 360.0, saturation: 0.91, brightness: 0.92), Color(hue: 280 / 360.0, saturation: 0.52, brightness: 0.93), Color(hue: 356 / 360.0, saturation: 0.68, brightness: 0.96)]
    
    var body: some View {
        VStack{
            Image("toasts")
                .resizable()
                .aspectRatio(contentMode: .fit
                )
                .frame(width: 256, height: 256, alignment: .center)
            
            Text("It's toasted")
                .padding()
            
            Button {
                self.toastList.append(ToastMessage(content: HStack{
                    Image(systemName: "sun.max.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.red)
                        .frame(width: 16, height: 16)
                        .padding(.horizontal,8)
                    Text("Toast").bold().foregroundColor(.red)
                }, icon: Image(systemName: "applelogo").resizable().aspectRatio(contentMode: .fit).foregroundColor(.red)))
           } label: {
               Text("Toast")
           }
            
            Button {
                index += 1
                self.toastList.append(ToastMessage(title: "Toast", titleColor: Color.white, subTitle: "\(index)", subTitleColor: Color.white, icon: Image(systemName: "applelogo").resizable().aspectRatio(contentMode: .fit).foregroundColor(.white), style: ToastMessageStyle(position: .top, background: .orange, hasFeedback: true)))
            } label: {
                Text("Toast At Top")
            }

            Button {
                index += 1
                self.toastList.append(ToastMessage(title: "Toast", titleColor: Color.white, subTitle: "\(index)", subTitleColor: Color.white, icon: Image(systemName: "applelogo").resizable().aspectRatio(contentMode: .fit).foregroundColor(.white), style: ToastMessageStyle(position: .center, background: LinearGradient(colors: colors, startPoint: UnitPoint(x: 0, y: 0.5), endPoint: UnitPoint(x: 1, y: 0.5)), hasFeedback: true)))
            } label: {
                Text("Toast At Center")
            }
            .padding()
            
            Button {
                index += 1
                self.toastList.append(ToastMessage(title: "Toast", titleColor: Color.black, subTitle: "\(index)", subTitleColor: Color.black, icon: Image(systemName: "applelogo").resizable().aspectRatio(contentMode: .fit).foregroundColor(.black), style: ToastMessageStyle(position: .bottom, background: .regularMaterial, hasFeedback: true)))
            } label: {
                Text("Toast At Bottom")
            }
            

        }
        .toast(toastList: $toastList)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
