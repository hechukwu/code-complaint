//
//  EFontRegular.swift
//  Code-complaint
//
//  Created by Henry Chukwu on 02/11/2021.
//

import UIKit

@IBDesignable
final class EFontRegular: BaseUILabel {
    
    override var fontType: UIFont? {
        return UIFont(name: EFontConstant.Name.regular.rawValue, size: fontSize)
    }
    
}
