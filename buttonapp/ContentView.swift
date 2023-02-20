//
//  ContentView.swift
//  buttonapp
//
//  Created by Raffi Astvatsatryan on 2/3/23.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.orange, .green, .pink]
    
    @State var color = Color.pink
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(color)
            
            Button(action: changeColor) {
                Text("Tap")
                    .foregroundColor(.black)
                    .font(.title)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
        }
    }
    
    func changeColor() {
        if let index = colors.firstIndex(of: color) {
            let nextIndex = (index + 1) % colors.count
            self.color = colors[nextIndex]
        } else {
            self.color = colors.first ?? .pink
        }
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
