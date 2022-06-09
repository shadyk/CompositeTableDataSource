//
//  Created by Shady
//  All rights reserved.
//  

import Foundation

typealias AdDetailCompletion = (AdViewModel) -> Void

class RemoteAdLoader: AdLoader {
 
    private let url  = "https://my-url/endpoint"

    func getAdDetails(id: String,success: @escaping AdDetailCompletion, fail: @escaping ErrorHandler) {
        let url = url + (id)
        HttpRequester().get(url: url, remoteObject: RemoteAd.self) { remoteAd in
            success(remoteAd.toAdViewModel)
        } fail: { fail($0) }
    }
}
