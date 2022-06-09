//
//  Created by Shady
//  All rights reserved.
//  

import UIKit
class ImagesCollectionLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        scrollDirection = .horizontal        
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
