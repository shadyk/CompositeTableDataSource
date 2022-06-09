//
//  Created by Shady
//  All rights reserved.
//  

import UIKit

class ImagesDataSource: NSObject, UITableViewDataSource, UITableViewDelegate{
    private var image: ImagesViewModel
    private var didSelectImage: ((String?) -> Void)? = nil
    init(image: ImagesViewModel, didSelectImage: ((String?) -> Void)?){
        self.image = image
        self.didSelectImage = didSelectImage
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = ImagesTableCell(style: .default, reuseIdentifier: "ImagesTableCell", image: image, didSelectImage: didSelectImage )
        return cell
    }

}
