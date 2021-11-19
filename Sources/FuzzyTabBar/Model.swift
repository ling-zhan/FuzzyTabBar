//
//  Model.swift
//  
//
//  Created by Ling on 2021/11/17.
//

import SwiftUI

public struct TabBarItem: Hashable {
    public var icon: String
    public var foregroundColor: Color
    public var title: String?
    public var tag: Int
    public var isBadge: Bool
    public init(icon: String, foregroundColor: Color, title: String? = nil, tag: Int, isBadge: Bool) {
        self.icon = icon
        self.foregroundColor = foregroundColor
        self.title = title
        self.tag = tag
        self.isBadge = isBadge
    }
}
