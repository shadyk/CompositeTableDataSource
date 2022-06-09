//
//  Created by Shady
//  All rights reserved.
//  

import UIKit
class SectionHeaderView: UIView {
    private var lineSeparator = LineSeparator()
    
    private lazy var mainVStack: UIStackView = {
        let s = UIStackView(arrangedSubviews: [greySeparator, lblTitle, lineSeparator])
        s.axis = .vertical
        s.spacing = 0
        s.alignment = .fill
        s.distribution = .fillProportionally
        return s
    }()
    
    
    private var greySeparator: UIView = {
        let v = UIView()
        
        v.backgroundColor = .customLightGray()
        return v
    }()
    private var lblTitle: PaddingLabel = {
        let l = PaddingLabel()
        l.font = .boldSystemFont(ofSize: 20)
        l.textColor = .customBlack()
        l.numberOfLines = 0
        l.padding(0, 0, 8, 0)
        return l
    }()
    
    convenience init(title: String) {
        self.init()
        commonInit(title: title)
    }

    
    func commonInit(title: String) {
        lblTitle.text = title
        addSubview(mainVStack)
        mainVStack.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(-8)
        }
        
        greySeparator.snp.makeConstraints { make in
            make.height.equalTo(10)
        }

        lineSeparator.snp.makeConstraints { make in
            make.height.equalTo(2)
        }
        
    }
}
