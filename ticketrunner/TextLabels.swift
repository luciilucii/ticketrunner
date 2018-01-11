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

class HomeTableCellLabel: CustomUIView {
    
    var title: String
    var icon: UIImage
    
    lazy var headlineLabel: H1 = {
        let label = H1()
        label.text = title
        label.textAlignment = .left
        return label
    }()
    
    lazy var iconImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.image = icon
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    init(title: String, icon: UIImage) {
        self.title = title
        self.icon = icon
        
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(iconImageView)
        addSubview(headlineLabel)
        
        iconImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 45, height: 0)
        
        headlineLabel.anchor(top: topAnchor, left: iconImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
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

class TicketrunnerTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setLeftPaddingPoints(8)
        self.setRightPaddingPoints(8)
        self.textColor = ColorCodes.textColorGrey
        self.layer.borderColor = ColorCodes.lightGrayText.cgColor
        self.font = UIFont.sourceSansPro(ofSize: 14)
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class TicketrunnerTextView: UITextView {
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        self.font = UIFont.sourceSansPro(ofSize: 14)
        self.backgroundColor = UIColor.white
        
        self.layer.borderWidth = 1
        self.layer.borderColor = ColorCodes.lightGrayText.cgColor
        self.layer.cornerRadius = 5
        self.textColor = ColorCodes.textColorGrey
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
        return UIFont(name: "SourceSansPro-Bold", size: ofSize) ?? UIFont.boldSystemFont(ofSize: ofSize)
    }
    
    class func italicSourceSansPro(ofSize: CGFloat) -> UIFont {
        return UIFont(name: "SourceSansPro-It", size: ofSize) ?? UIFont.italicSystemFont(ofSize: ofSize)
    }
}

