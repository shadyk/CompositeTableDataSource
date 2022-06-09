//
//  Created by Shady
//  All rights reserved.
//  

import UIKit

class FeatureCollectionCell: UICollectionViewCell {
    var data: String? {
        didSet{
            lblTitle.text = data
        }
    }
    
    private var image: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named:"Checkmark")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private var lblTitle: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 14)
        l.textColor = .customBlack()
        l.numberOfLines = 0
        return l
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(image)
        contentView.addSubview(lblTitle)
        image.snp.makeConstraints { make in
            make.width.equalTo(15)
            make.height.equalTo(11)
            make.leading.top.equalToSuperview().offset(12)
//            make.centerY.equalToSuperview()
        }
        lblTitle.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(5)
            make.centerY.equalTo(image.snp.centerY)
//            make.trailing.equalToSuperview().offset(3)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
