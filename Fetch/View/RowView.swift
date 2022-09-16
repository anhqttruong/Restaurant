//
//  RowView.swift
//  Fetch
//
//  Created by Thomas TRUONG on 16/09/2022.
//

import SwiftUI

struct RowView: View {
    var food: Food
    var body: some View {
        HStack {
            AsyncImage(url: food.thumbnail) { phase in
                if let image = phase.image {
                    image
                        .interpolation(.high)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 60)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                }  else if phase.error != nil  {
                    Image(systemName: "fork.knife")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 60, maxHeight: 60)
                } else {
                    ProgressView()
                }
            }
            VStack(alignment: .leading) {
                Text(food.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text("\(Double(food.price)/1000, specifier: "%.2f") €")
                Text(food.description!)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(food: foodTest)
    }
}
