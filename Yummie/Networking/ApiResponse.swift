//
//  ApiResponse.swift
//  Yummie
//
//  Created by STARK on 18.06.2023.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
