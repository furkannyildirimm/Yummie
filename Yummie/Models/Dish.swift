//
//  Dish.swift
//  Yummie
//
//  Created by STARK on 23.05.2023.
//

import Foundation

struct Dish: Decodable {
    let id, name, description, image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) calories"
    }

}
