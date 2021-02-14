//
//  GlobalState.swift
//  Calculator with SwiftUI
//
//  Created by Eric Morales on 2/8/21.
//

import Foundation

class GlobalState: ObservableObject {
    @Published var display = "0"
    @Published var clearAllClear = CalculatorKey.allClear
    
    var storedValue: Double? = nil
    var operation: CalculatorKey? = nil
    var beginInput: Bool = true
    
    func keyPressed(key: CalculatorKey) {
        switch key {
        
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine: // Estos casos son para todos los numeros
            if beginInput {                                     // Si estamos empezando a escribir alguna cantidad esto corre.
                display = key.rawValue                          // Enseñara el valor del boton en la calculadora
                beginInput = false                              // Dejara saber al programa que ya se escribio el primer numero
                clearAllClear = CalculatorKey.clear
            } else {                                            // Esto corre cuando el ya se empezado a escribir un numero
                display = display + key.rawValue                // Esto añade a la calculadora el numero nuevo que se a escrito
            }
            
        case .plus, .minus, .multiply, .divide:                 // Estos casos son para todos los signos
            
            if storedValue == nil {                             // Si no hay ningun valor guardado esto correra.
                storedValue = Double(display)
                operation = key                                 // Esto guarda la operacion que fue presionada.
                beginInput = true                               // Esto le dejara saber al programa que el valor proximo es nuevo
            } else {
                if beginInput {
                    operation = key
                } else {
                    calculate()
                    beginInput = true
                    operation = key
                }
                
                
            }
            
        case .percent:
            porcentage()
            
        case .equals:
            calculate()
            
        case .dot:
            if display.contains(CalculatorKey.dot.rawValue) {
                break
            }
            
            display = display + CalculatorKey.dot.rawValue
            
            
            
            
            
        case .plusMinus:
            if display[0] == CalculatorKey.minus.rawValue {
                display.remove(at: display.startIndex)
            } else {
                display = CalculatorKey.minus.rawValue + display
            }
            
            
            
            
            
            
        case .clear:
            display = CalculatorKey.zero.rawValue
            beginInput = true
            clearAllClear = CalculatorKey.allClear
            
        case .allClear:
            display = CalculatorKey.zero.rawValue
            beginInput = true
            storedValue = nil
            
        }
    }
    
    func porcentage() {
        let a = Double(display) ?? 0
        let answer = a / 100
        display = String(answer)
        
    }
    
    func calculate() {
        let a = storedValue ?? 0
        let b = Double(display) ?? 0
        var answer: Double = 0
        
        switch operation {
        case .plus:
            answer = a + b
        case .minus:
            answer = a - b
        case .multiply:
            answer = a * b
        case .divide:
            answer = a / b
        default:
            break
        }
        
        beginInput = true
        storedValue = answer
        
        if (answer.truncatingRemainder(dividingBy: 2)) == 0 { // THIS JUST WORK FOR EVEN NUMBERS... IT NEED TO BE IMPLEMENTED FOR ALL NUMBERS
            display = String(Int(answer))
        } else {
            display = String(answer)
        }
        
    }
    
}
