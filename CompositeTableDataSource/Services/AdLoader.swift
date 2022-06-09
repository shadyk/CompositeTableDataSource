//
//  Created by Shady
//  All rights reserved.
//  

import Foundation

protocol AdLoader{
    func getAdDetails(id: String,success: @escaping AdDetailCompletion, fail: @escaping ErrorHandler)
}


protocol AdImageLoader{
    func loadImage()
}
