//
//  Created by Shady
//  All rights reserved.
//  

import UIKit

class DescriptionTableViewCell: UITableViewCell {

    private var label: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 14)
        l.textAlignment = .left
        l.numberOfLines = 0
        return l
    }()
    
    convenience init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, text:String) {
        self.init(style: style, reuseIdentifier: reuseIdentifier)
        setupInterface(text)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupInterface(_ text: String) {
        label.text = text
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
        }
    }
}
