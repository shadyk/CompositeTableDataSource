//
//  Created by Shady
//  All rights reserved.
//  

import UIKit

class DetailsTableCell: UITableViewCell {
    
    private var data: DetailViewModel? {
        didSet{
            lblTitle.text = data?.title
            lblValue.text = data?.value
        }
    }

    private var lblTitle: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 14)
        l.textColor = .customBlack()
        l.textAlignment = .left
        return l
    }()

    private var lblValue: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 14)
        l.textColor = .customGray()
        l.textAlignment = .right
        return l
    }()
    private lazy var sep = LineSeparator()
    convenience init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, data: DetailViewModel) {
        self.init(style: style, reuseIdentifier: reuseIdentifier)
        defer { self.data = data }
       setupInterface()
    }
    
    private func setupInterface(){

        backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(lblTitle)
        contentView.addSubview(lblValue)
        contentView.addSubview(sep)
        
        lblTitle.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0))
            make.centerY.equalToSuperview()
        }
        lblValue.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 12))
            make.centerY.equalToSuperview()
        }
        sep.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8))
            make.height.equalTo(1)
        }

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
