//
//  ContentView.swift
//  Calculator with SwiftUI
//
//  Created by Eric Morales on 2/8/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var env: GlobalState
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text(env.display)
                        .font(.system(size: 70))
                        .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 70, maxHeight: .infinity, alignment: .bottomTrailing)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                }
                HStack {
                    self.makeButton(key: env.clearAllClear, backgroundColor: .gray)
                    self.makeButton(key: .plusMinus, backgroundColor: .gray)
                    self.makeButton(key: .percent, backgroundColor: .gray)
                    self.makeButton(key: .divide, backgroundColor: .orange)
                }
                HStack {
                    self.makeButton(key: .seven)
                    self.makeButton(key: .eight)
                    self.makeButton(key: .nine)
                    self.makeButton(key: .multiply, backgroundColor: .orange)
                }
                HStack {
                    self.makeButton(key: .four)
                    self.makeButton(key: .five)
                    self.makeButton(key: .six)
                    self.makeButton(key: .minus, backgroundColor: .orange)
                }
                HStack {
                    self.makeButton(key: .one)
                    self.makeButton(key: .two)
                    self.makeButton(key: .three)
                    self.makeButton(key: .plus, backgroundColor: .orange)
                }
                HStack {
                    self.makeButton(key: .zero, width: 150)
                    self.makeButton(key: .dot)
                    self.makeButton(key: .equals, backgroundColor: .orange)
                }
                Spacer()
            }
        }
    }
    
    func makeButton(key: CalculatorKey, width: CGFloat = 70, alignment: Alignment = .center, backgroundColor:Color = Color(white: 0.2)) -> some View{
        return AnyView(
            Button(action: {
                env.keyPressed(key: key)
            }, label: {
                Text(key.rawValue)
                    .frame(width: width, height: 70, alignment: alignment)
                    .background(backgroundColor)
                    .cornerRadius(35)
                    .font(.system(size: 28))
                    .foregroundColor(.white)
                    .padding(1)
        }))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalState())
    }
}
