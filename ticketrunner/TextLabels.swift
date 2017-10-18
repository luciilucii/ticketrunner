//
//  TextLabels.swift
//  ticketrunner
//
//  Created by Luca Kiedrowski on 18.10.17.
//  Copyright © 2017 LucaKiedrowski. All rights reserved.
//

import UIKit

class H1: UILabel {

    init() {
        super.init(frame: .zero)
        self.textColor = ColorCodes.textColorGrey
        self.font = UIFont.boldSourceSansPro(ofSize: 22)
        self.textAlignment = .center

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class H2: UILabel {
    
    init() {
        super.init(frame: .zero)
        self.textColor = ColorCodes.textColorGrey
        self.font = UIFont.boldSourceSansPro(ofSize: 16)
        self.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class H3: UILabel {
    
    init() {
        super.init(frame: .zero)
        self.textColor = ColorCodes.textColorGrey
        self.font = UIFont.boldSourceSansPro(ofSize: 14)
        self.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class NormalTextLabel: UILabel {
    
    init() {
        super.init(frame: .zero)
        self.textColor = ColorCodes.lightGrayText
        self.font = UIFont.sourceSansPro(ofSize: 16)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class NormalToSmallTextLabel: UILabel {
    
    init() {
        super.init(frame: .zero)
        self.textColor = ColorCodes.lightGrayText
        self.font = UIFont.sourceSansPro(ofSize: 14)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class SmallTextLabel: UILabel {
    
    init() {
        super.init(frame: .zero)
        self.textColor = ColorCodes.lightGrayText
        self.font = UIFont.sourceSansPro(ofSize: 12)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UIFont {
    class func sourceSansPro(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "SourceSansPro-Regular", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }
    
    class func boldSourceSansPro(ofSize: CGFloat) -> UIFont {
        
        if let sourceFont = UIFont(name: "SourceSansPro-Bold", size: ofSize) {
            print("Source Font")
        }
        
        return UIFont(name: "SourceSansPro-Bold", size: ofSize) ?? UIFont.boldSystemFont(ofSize: ofSize)
    }
    
    class func italicSourceSansPro(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "SourceSansPro-It", size: ofSize) ?? UIFont.italicSystemFont(ofSize: ofSize)
    }
}

