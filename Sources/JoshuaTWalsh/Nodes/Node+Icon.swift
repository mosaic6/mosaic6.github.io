//
//  File.swift
//  
//
//  Created by Joshua Walsh on 1/1/21.
//

import Plot

extension Node where Context == HTML.AnchorContext {
    static func icon(_ text: String) -> Node {
        return .element(named: "i", attributes: [.class(text + " l-box social-icon")])
    }
}
