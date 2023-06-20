//
//  String+Extension.swift
//  Yummie
//
//  Created by STARK on 22.05.2023.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
