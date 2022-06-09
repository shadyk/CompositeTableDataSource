//
//  Created by Shady
//  All rights reserved.
//  

import UIKit

class DocsTableCell: UITableViewCell {
    
    private var data: DocsViewModel? {
        didSet{
            lblTitle.text = data?.title
        }
    }

    private var lblTitle: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 14)
        l.textColor = .customBlack()
        l.textAlignment = .left
        return l
    }()
    
    private var image: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named:"Pdf")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private lazy var sep = LineSeparator()

    
    convenience init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, data: DocsViewModel) {
        self.init(style: style, reuseIdentifier: reuseIdentifier)
        defer { self.data = data }
       setupInterface()
    }
    
    private func setupInterface(){

        backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(lblTitle)
        contentView.addSubview(image)
        contentView.addSubview(sep)
        accessoryType = .disclosureIndicator
        
        image.snp.makeConstraints { make in
            make.width.equalTo(20)
            make.height.equalTo(27)
            make.leading.equalToSuperview().offset(8)
            make.centerY.equalToSuperview()
        }
        
        lblTitle.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(12)
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
