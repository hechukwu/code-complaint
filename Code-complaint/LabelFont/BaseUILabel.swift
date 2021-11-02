//
//  BaseUILabel.swift
//  Code-complaint
//
//  Created by Henry Chukwu on 02/11/2021.
//

import UIKit

@IBDesignable
class BaseUILabel: UILabel {
    
    let lineSpacing: CGFloat = 8
    
    @IBInspectable var fontSize: CGFloat {
        return self.font.pointSize
    }
    
    @IBInspectable var fontType: UIFont? {
        return UIFont(name: EFontConstant.Name.regular.rawValue, size: EFontConstant.Size.regular.rawValue)
    }
    
    @IBInspectable var underline: Bool = false {
        didSet {
            if underline {
                self.underline()
            }
        }
    }
    
    @IBInspectable var alignCenter: Bool = false {
        didSet {
            if alignCenter {
                attributedText = text?.lineSpaced(lineSpacing, .center)
            }
        }
    }
    
    @IBInspectable var stringToColor: String? {
        didSet {
            if let stringToColor = stringToColor {
                let alignment: NSTextAlignment = alignCenter ? .center : .left
                attributedText = text?.lineSpacedWithInlineColor(lineSpacing, alignment, stringToColor: stringToColor)
            }
        }
    }
    
    @IBInspectable var boldColor: UIColor {
        UIColor()
    }
    
    @IBInspectable var stringToBold: String? {
        didSet {
            if let stringToBold = stringToBold {
                let alignment: NSTextAlignment = alignCenter ? .center : .left
                attributedText = text?.lineSpacedWithInlineColor(lineSpacing, alignment, stringToColor: stringToBold, color: boldColor, bold: true, boldTextSize: fontSize)
            }
        }
    }
    
    @IBInspectable var characterSpacing: Double = 0 {
        didSet {
            self.addCharacterSpacing(kernValue: characterSpacing)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
    }
    
    func commonInit() {
        guard let customFont = fontType else {
            fatalError("""
                Failed to load the "\(String(describing: fontType?.fontName))" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }

        font = UIFontMetrics.default.scaledFont(for: customFont)
        adjustsFontForContentSizeCategory = true

        attributedText = text?.lineSpaced(lineSpacing)
    }
}
