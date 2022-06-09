//
//  Created by Shady
//  All rights reserved.
//  

import Foundation

struct RemoteAd {
    
    var title: String?
    var price: String?
    var address: String?
    var dateTime: String?
    var visits: String?
    var id: String?
    var images: [String]?
    var attributes: [String: String]?
    var features: [String]?
    var documents: [String: String]?
    var description: String?
    
}

extension RemoteAd: Decodable{
    
    enum CodingKeys: String, CodingKey {
        case dateTime = "posted-date-time"
    }
    
}
