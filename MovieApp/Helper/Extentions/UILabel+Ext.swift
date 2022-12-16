//
//  UILabel+Ext.swift
//  MovieApp
//
//  Created by Cansu Özdizlekli on 12/13/22.
//

import Foundation

import UIKit

extension UILabel {
    
  func addCharacterSpacing(kernValue: Double = 1.35) {
    guard let text = text, !text.isEmpty else { return }
    let string = NSMutableAttributedString(string: text)
    string.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: string.length - 1))
    attributedText = string
  }
    

}

