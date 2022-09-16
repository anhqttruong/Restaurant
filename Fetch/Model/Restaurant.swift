//
//  Restaurant.swift
//  Fetch
//
//  Created by Thomas TRUONG on 16/09/2022.
//

import Foundation
import SwiftUI

class FoodStore: ObservableObject {
    // Observe changes to the foods variable then update the UI accordingly
    @Published var foods: [Food]
    @Published var cart: [Food]
    init(foods: [Food] = [], cart: [Food] = []) {
        self.foods = foods
        self.cart = cart
    }
}
let testStore: FoodStore = FoodStore(foods: [])
