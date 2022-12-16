//
//  UIColor+Ext.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/11/22.
//

import Foundation
import UIKit


extension UIColor {
    static let primaryWhite = UIColor.init(red: 255, green: 255, blue: 255, reqAlpha: 1)
    static let primaryBlue = UIColor.init(red: 18, green: 14, blue: 74, reqAlpha: 1)
    static let secondaryBlue = UIColor.init(red: 129, green: 163, blue: 237, reqAlpha: 1)
//    static let genreBackground = UIColor.init(red: 200, green: 214, blue: 254, reqAlpha: 1)
    static let lightestBlue = UIColor.init(red: 217, green: 227, blue: 255, reqAlpha: 1)
    static let textGray = UIColor.init(red: 156, green: 156, blue: 156, reqAlpha: 1)
    
}

extension UIColor {
    convenience init(hexFromString:String, alpha:CGFloat = 1.0) {
        var cString:String = hexFromString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgbValue:UInt64 = 10066329
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) == 6) {
            Scanner(string: cString).scanHexInt64(&rgbValue)
        }
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(red: Int, green: Int, blue: Int, reqAlpha: CGFloat) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: reqAlpha)
    }
    
}

