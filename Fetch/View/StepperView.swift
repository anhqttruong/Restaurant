//
//  StepperView.swift
//  Fetch
//
//  Created by Thomas TRUONG on 16/09/2022.
//

import SwiftUI

struct StepperView: View {
    @State private var value = 0
    @ObservedObject var store: FoodStore
    var food: Food
    
    func incrementStep() {
        value += 1
        store.cart.append(food)
    }
    
    func decrementStep() {
        if value > 0 {
            value -= 1
            store.cart.removeLast()
        }
    }
    
    var body: some View {
        Stepper {
            Text("Order: \(value)").font(.title).fontWeight(.heavy)
        } onIncrement: {
            incrementStep()
        } onDecrement: {
            decrementStep()
        }
        .padding(40)
        .onAppear {
            value = store.cart.filter({ $0.ref == food.ref }).count
        }
    }
}



struct StepperView_Previews: PreviewProvider {
    static var previews: some View {
        StepperView(store: testStore, food: foodTest)
    }
}
