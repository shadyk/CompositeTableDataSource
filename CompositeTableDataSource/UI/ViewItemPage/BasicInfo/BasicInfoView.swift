//
//  Created by Shady
//  All rights reserved.
//  

import UIKit

class BasicInfoView: UIView {
    var basicInfo : BasicInfoViewModel? {
        didSet {
            lblTitle.text = basicInfo?.title
            lblID.text = "ID: \(basicInfo?.id ?? "")"
            lblDate.text = basicInfo?.date
            lblViews.text = basicInfo?.views
            lblPrice.text = basicInfo?.price
            lblAddress.text = basicInfo?.address
        }
    }
    
    init(frame:CGRect, basicInfo : BasicInfoViewModel) {
        super.init(frame: frame)
        self.addSubview(mainVStack)
        mainVStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(12)
        }
        
        imageEye.snp.makeConstraints { make in
            make.size.equalTo(15)
        }
        imageCalendar.snp.makeConstraints { make in
            make.size.equalTo(15)
        }
//        spacer.snp.makeConstraints { make in
//            make.size.equalTo(20)
//        }
        defer {
            self.basicInfo = basicInfo
        }
    }
    
    
    private lazy var mainVStack: UIStackView = {
        let s = UIStackView(arrangedSubviews: [titleVStack,lblAddress,mainHStack])
        s.axis = .vertical
        s.spacing = 0
        s.alignment = .fill
//        s.translatesAutoresizingMaskIntoConstraints = false
        s.distribution = .fillProportionally
        return s
    }()
    
    private var lblTitle: UILabel = {
        let l = UILabel()
        l.font = .boldSystemFont(ofSize: 20)
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .customBlack()
        l.numberOfLines = 0
        return l
    }()

    private var lblPrice: UILabel = {
        let l = UILabel()
        l.font = .boldSystemFont(ofSize: 20)
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .customGreen()
        l.numberOfLines = 1
        return l
    }()


    private lazy var titleVStack: UIStackView = {
        let s = UIStackView(arrangedSubviews: [lblTitle, lblPrice])
        s.axis = .vertical
        s.translatesAutoresizingMaskIntoConstraints = false
        s.spacing = 0
        s.alignment = .leading
        s.distribution = .fillProportionally
        return s
    }()
    
    private var lblAddress: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 14)
        l.textColor = .customGray()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 1
        return l
    }()
    
    private lazy var mainHStack: UIStackView = {
        let s = UIStackView(arrangedSubviews: [dateHStack,viewsHStack,spacer, lblID])
        s.axis = .horizontal
        s.translatesAutoresizingMaskIntoConstraints = false
        s.spacing = 8
        s.alignment = .fill
        s.distribution = .fillProportionally
        return s
    }()
    
    private lazy var spacer: UIView = {
        let v = UIView()
        return v
    }()
    
    private lazy var dateHStack: UIStackView = {
        let s = UIStackView(arrangedSubviews: [imageCalendar,lblDate])
        s.axis = .horizontal
        s.translatesAutoresizingMaskIntoConstraints = false
        s.spacing = 5
        s.alignment = .fill
        s.distribution = .fillProportionally
        return s
    }()
    private var imageCalendar: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Calendar")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private var lblDate: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 14)
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .customGray()
        l.numberOfLines = 1
        return l
    }()
    
    
    private lazy var viewsHStack: UIStackView = {
        let s = UIStackView(arrangedSubviews: [imageEye, lblViews])
        s.axis = .horizontal
        s.translatesAutoresizingMaskIntoConstraints = false
        s.spacing = 5
        s.alignment = .fill
        s.distribution = .fillProportionally
        return s
    }()
    
    private var imageEye: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Eye")
        iv.contentMode = .scaleAspectFit
//        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private var lblViews: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 14)
//        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .customGray()
        l.numberOfLines = 1
        return l
    }()
    
    private var lblID: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 14)
        l.textColor = .customGray()
//        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .right
        l.numberOfLines = 1
        return l
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
