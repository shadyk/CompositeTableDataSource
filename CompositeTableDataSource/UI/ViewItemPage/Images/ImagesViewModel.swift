//
//  Created by Shady
//  All rights reserved.
//  

import Foundation

struct ImagesViewModel{
    var images: [String]?
    
    func getThumbnailPath(id: String, image:String) -> String {  return "https://imgurl/\(id)/a/\(image)/$_1.JPG"
    }
    func getFullPath(id: String, image:String) -> String {  return "https://imgurl\(id)/a/\(image)/$_2.JPG"
    }
    
}
