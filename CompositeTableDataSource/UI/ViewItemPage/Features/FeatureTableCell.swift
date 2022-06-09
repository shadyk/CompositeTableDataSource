//
//  Created by Shady
//  All rights reserved.
//  

import UIKit

class FeatureTableCell: UITableViewCell {
    
    private var data: FeatureViewModel?
    private var collectionVC: FeatureCollectionViewController?

    
    convenience init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, data: FeatureViewModel) {
        self.init(style: style, reuseIdentifier: reuseIdentifier)
        self.data = data
       setupInterface()
    }
    
    private func setupInterface(){
 

        collectionVC = FeatureCollectionViewController(data: data!)
        backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(collectionVC!.view)
        collectionVC!.data = data
        collectionVC!.view.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
