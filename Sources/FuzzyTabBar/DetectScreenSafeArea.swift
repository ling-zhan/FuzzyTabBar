//
//  File.swift
//  
//
//  Created by Ling on 2021/11/17.
//

import SwiftUI

class DetectScreenSafeArea {
    static let shared = DetectScreenSafeArea.init()
    
    func topPadding()-> CGFloat? {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            return window?.safeAreaInsets.top
        }
        
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.first
            return window?.safeAreaInsets.top
        }
    }
    func bottomPadding()-> CGFloat? {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            return window?.safeAreaInsets.bottom
        }
        
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.first
            return window?.safeAreaInsets.bottom
        }
    }
}
