//
//  ContentView.swift
//  Fetch
//
//  Created by Thomas TRUONG on 16/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var store: FoodStore
    @State var showCart = false
    var body: some View {
        NavigationView {
            List {
                ForEach(store.foods) { food in
                    NavigationLink(destination: FoodView(store: store, food: food)) {
                        RowView(food: food)
                    }
                }
                HStack {
                    Spacer()
                    Text("\(store.foods.count) Item\(store.foods.count > 1 ? "s" : "")").foregroundColor(.secondary)
                    Spacer()
                }
            }
            .sheet(isPresented: $showCart, content: {
                NavigationView {
                    CartView(store: store).navigationBarTitle("Cart")
                }
            })
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                        apiCall().getFood { (food) in
                            self.store.foods = food
                        }
                    }, label: {
                        Label("Refresh",systemImage: "arrow.clockwise.circle.fill").foregroundColor(.blue).font(.largeTitle).labelStyle(.titleAndIcon)
                    })
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation {
                            showCart = true
                        }
                    }, label: {
                        Image(systemName: "cart.fill").font(.title)
                    })
                    .foregroundColor(.blue)
                }
            }
            .navigationBarTitle("Menu")
        }
        
        .onAppear {
            apiCall().getFood { (food) in
                self.store.foods = food
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    var store: FoodStore
    static var previews: some View {
        ContentView(store: testStore)
    }
}
