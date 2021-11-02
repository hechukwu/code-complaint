//
//  String+Extension.swift
//  Code-complaint
//
//  Created by Henry Chukwu on 02/11/2021.
//

import UIKit

extension String {
    
    func lineSpaced(_ spacing: CGFloat,_ alignment: NSTextAlignment = .left) -> NSAttributedString {
        let attr = NSMutableAttributedString(string: self)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        paragraphStyle.alignment = alignment
        attr.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attr.length))
        return attr
    }
    
    func lineSpacedWithInlineColor(_ spacing: CGFloat,_ alignment: NSTextAlignment = .left, stringToColor: String, color: UIColor = #colorLiteral(red: 0.9490196078, green: 0.462745098, blue: 0.1058823529, alpha: 1), bold: Bool = false, boldTextSize: CGFloat = EFontConstant.Size.regular.rawValue) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        for word in stringToColor.components(separatedBy: ",,") {
            let range = (self as NSString).range(of: word)
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color , range: range)
            if bold {
                attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont(name: EFontConstant.Name.bold.rawValue, size: boldTextSize) ?? .systemFont(ofSize: 12), range: range)
            }
        }
        
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        paragraphStyle.alignment = alignment
        
        return attributedString
    }
}
