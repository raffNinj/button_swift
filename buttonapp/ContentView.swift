//
//  ContentView.swift
//  buttonapp
//
//  Created by Raffi Astvatsatryan on 2/3/23.
//

import SwiftUI

struct ContentView: View {

    enum Form: CaseIterable {
      case circle, square, triangle , pentagon
    }

    let colors: [Color] = [.red, .blue, .orange, .black]

    @State var currentColor = Color.red
    @State var currentForm:Form = .circle

    var body: some View {
        VStack{
            HStack {
                Button {
                    changeColor()
                } label: {
                    Image("color_changer")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .background(.gray)
                        .cornerRadius(13)
                }
                .offset(x: 59, y: 55)
                .position(x: -10, y: 10)
                
                Button {
                    changeForm()
                } label: {
                    Image("forms_icon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .background(.gray)
                        .cornerRadius(13)
                }
                .offset(x: 25, y: 55)
                .position(x: 30, y: 10)
                Button {
                    random_color_form()
                } label: {
                    Image("shaker")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(13)
                }
                .offset(x: 80, y: 55)
                .position(x:50 , y: 10)
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
                case .pentagon:
                  Pentagon()
                      .fill(currentColor)
                      .frame(width: 200,height: 200)
              }
           }
            .offset(x:-117,y:50)
            .position(x:20,y: 350)
        }
      }
    }

    private func changeColor() {
      if let index = colors.firstIndex(of: currentColor) {
        let nextIndex = (index + 1) % colors.count
        self.currentColor = colors[nextIndex]
      }
    }

    private func changeForm() {
      if let index = Form.allCases.firstIndex(of: currentForm) {
        let nextIndex = (index + 1) % Form.allCases.count
        self.currentForm = Form.allCases[nextIndex]
      }
    }
    private func random_color_form(){
        let randomColorIndex = Int.random(in: 0..<colors.count)
            let randomColor = colors[randomColorIndex]
            let randomFormIndex = Int.random(in: 0..<Form.allCases.count)
            let randomForm = Form.allCases[randomFormIndex]
            self.currentColor = randomColor
            self.currentForm = randomForm
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

struct Pentagon: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let pt1 = CGPoint(x: width * 0.5, y: 0)
        let pt2 = CGPoint(x: width, y: height * 0.4)
        let pt3 = CGPoint(x: width * 0.8, y: height)
        let pt4 = CGPoint(x: width * 0.2, y: height)
        let pt5 = CGPoint(x: 0, y: height * 0.4)
        var path = Path()
        path.move(to: pt1)
        path.addLine(to: pt2)
        path.addLine(to: pt3)
        path.addLine(to: pt4)
        path.addLine(to: pt5)
        path.closeSubpath()
        return path
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
