//
//  CartView.swift
//  Fetch
//
//  Created by Thomas TRUONG on 16/09/2022.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var store: FoodStore
    var body: some View {
        List {
            // Get unique food name
            ForEach(Array(Set(store.cart.map({ $0.ref }))), id: \.self){ ref in
                VStack(alignment: .center) {
                    HStack {
                        Text(store.cart.filter({ $0.ref == ref }).first!.title ).font(.body).fontWeight(.heavy)
                        Spacer()
                        Text("Quantity: \(store.cart.filter({ $0.ref == ref }).count)").foregroundColor(.secondary)
                    }
                    Text("Cost: \(Double(store.cart.filter({ $0.ref == ref }).compactMap { $0.price }.reduce(0, +))/1000, specifier: "%.2f") €").font(.body).fontWeight(.bold)
                }
            }
            Text("Total: \(Double(store.cart.compactMap { $0.price }.reduce(0, +))/1000, specifier: "%.2f") €").font(.largeTitle).fontWeight(.bold)
        }
    }
}
