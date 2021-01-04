//
//  File.swift
//  
//
//  Created by Joshua Walsh on 1/4/21.
//

import Publish
import Plot

extension Theme where Site == JoshuaTWalsh {
    static var blog: Self {
        Theme(htmlFactory: JTWHTMLFactory())
    }
}
