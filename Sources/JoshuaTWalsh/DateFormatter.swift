//
//  File.swift
//  
//
//  Created by Joshua Walsh on 1/4/21.
//

import Foundation

extension DateFormatter {
    static var blog: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
}

