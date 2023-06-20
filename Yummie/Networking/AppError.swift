//
//  AppError.swift
//  Yummie
//
//  Created by STARK on 24.05.2023.
//

import Foundation

enum AppError: LocalizedError {
case errorDecoding
case unknownError
case invalidUrl
case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "Bruhh"
        case .invalidUrl:
            return "heyy"
        case .serverError(let error):
            return error
        }
    }
}
