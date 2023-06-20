//
//  AllDishes.swift
//  Yummie
//
//  Created by STARK on 20.06.2023.
//

import Foundation
struct AllDishes: Decodable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
