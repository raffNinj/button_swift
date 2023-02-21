//
//  ContentView.swift
//  buttonapp
//
//  Created by Raffi Astvatsatryan on 2/3/23.
//

import SwiftUI

struct ContentView: View {

    enum Form: CaseIterable {
      case circle, square, triangle
    }

    let colors: [Color] = [.red, .blue, .orange]

    @State var currentColor = Color.red
    @State var currentForm:Form = .circle

    var body: some View {
      HStack {
        Button {
          changeColor()
        } label: {
          Text("change color")
            .foregroundColor(.white)
            .font(.title)
        }

        Button {
          changeForm()
        } label: {
          Text("change form")
            .foregroundColor(.white)
            .font(.title)
        }
      }

        ZStack {
          switch currentForm {
            case .circle:
              Circle()
                .fill(currentColor)
                .frame(width: 200, height: 200)
            case .square:
              Rectangle()
                .fill(currentColor)
                .frame(width: 200, height: 200)
            case .triangle:
              Triangle()
                .fill(currentColor)
                .frame(width: 200, height: 200)
          }
       }
    }

    private func changeColor() {
      if let index = colors.firstIndex(of: currentColor) {
        let nextIndex = (index + 1) % colors.count
        self.currentColor = colors[nextIndex]
      } else {
        self.currentColor = colors.first ?? .pink
      }
    }

    private func changeForm() {
      if let index = Form.allCases.firstIndex(of: currentForm) {
        let nextIndex = (index + 1) % Form.allCases.count
        self.currentForm = Form.allCases[nextIndex]
      } else {
        self.currentForm = .triangle
      }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
