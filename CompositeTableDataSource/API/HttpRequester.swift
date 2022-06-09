//
//  Created by Shady
//  All rights reserved.
//  

import Foundation

enum APIError: Error {
    case httpError(_ response: String)
}
typealias RemoteCompeltion<T: Decodable> = (T) -> Void
typealias ErrorHandler = (String) -> Void

class HttpRequester {
    private let email = "candidate"
    private let password = "yx6Xz62y"
    
    
    func get<T: Decodable>(url: String, remoteObject: T.Type, success: @escaping RemoteCompeltion<T>, fail: @escaping ErrorHandler) {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        let authData = (email + ":" + password).data(using: .utf8)!.base64EncodedString()
        request.addValue("Basic \(authData)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if error != nil {
                    fail(String(describing: error))
                }
                else if (response as! HTTPURLResponse).statusCode != 200 {
                    fail("Status code : \((response as! HTTPURLResponse).statusCode)")
                }
                else if let data = data {
                    do {
                        let decoded = try JSONDecoder().decode(remoteObject, from: data)
                        success(decoded)
                    } catch {
                        fail("Unable to Decode Response \(error)")
                    }
                }
            }
        }.resume()
    }
}
