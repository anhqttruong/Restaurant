import SwiftUI
import Foundation

// Food is Codable since it is fetched from an API and identifiable to be able to be displayed in a list - ForEarch
struct Food: Codable, Identifiable  {
    let id = UUID()
    let ref: String
    let title: String
    let description: String?
    let thumbnail: URL?
    var price: Int
}
// This class will fetch data from the link then decode the content
class apiCall {
    func getFood(completion:@escaping ([Food]) -> ()) {
        guard let url = URL(string: "https://uad.io/bigburger/") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            do {
                let food = try JSONDecoder().decode([Food].self, from: data!)
                
                DispatchQueue.main.async {
                    completion(food)
                }
            }
            catch {
                print(error)
            }
        }
        .resume()
    }
}

// Create a test to display previews of subviews
let foodTest: Food = Food(ref: "1",
                          title: "The Big Burger",
                          description: "Un classique mais tellement bon.",
                          thumbnail: URL(string: "https://uad.io/bigburger/images/1.png"),
                          price: 92820)

