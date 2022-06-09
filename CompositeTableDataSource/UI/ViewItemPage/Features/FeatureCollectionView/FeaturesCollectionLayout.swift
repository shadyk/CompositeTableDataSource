//
//  Created by Shady
//  All rights reserved.
//  

import UIKit
class FeaturesCollectionLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        scrollDirection = .vertical
        minimumLineSpacing = 5
        minimumInteritemSpacing = 5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
