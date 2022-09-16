//
//  FoodView.swift
//  Fetch
//
//  Created by Thomas TRUONG on 16/09/2022.
//

import SwiftUI

struct FoodView: View {
    @ObservedObject var store: FoodStore
    var food: Food
    @State var zoom = false
    var body: some View {
        VStack {
            AsyncImage(url: food.thumbnail) { image in
                image
                    .interpolation(.high)
                    .resizable()
                    .aspectRatio(contentMode: zoom ? .fill : .fit)
                    .onTapGesture {
                        withAnimation {
                            zoom.toggle()
                        }
                    }
            } placeholder: {
                ProgressView()
            }
            
            Text("\(Double(food.price)/1000, specifier: "%.2f") €")
                .font(.title)
                .foregroundColor(.primary)
            Text(food.description!)
                .font(.title2)
                .foregroundColor(.secondary)
            StepperView(store: store, food: food)
            Text("Total: \(Double(store.cart.compactMap { $0.price }.reduce(0, +))/1000, specifier: "%.2f") €").font(.title).fontWeight(.bold)
        }.padding()
            .navigationTitle(food.title)
    }
}
struct FoodView_Previews: PreviewProvider {
    var foodExample: Food
    static var previews: some View {
        NavigationView {
            FoodView(store: testStore, food: foodTest)
        }
    }
}
