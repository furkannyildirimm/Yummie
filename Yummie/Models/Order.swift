//
//  Order.swift
//  Yummie
//
//  Created by STARK on 24.05.2023.
//

import Foundation

struct Order: Decodable {
    let id: String?
    let name: String?
    let dish: Dish?
}
