//
//  Created by Shady
//  All rights reserved.
//  

import Foundation

struct AdViewModel{
    var images: ImagesViewModel?
    var basicInfo: BasicInfoViewModel?
    var featureViewModel: FeatureViewModel?
    var detailViewModels: [DetailViewModel]?
    var docsViewModels: [DocsViewModel]?
    var description: String?
}

extension RemoteAd{
    var toAdViewModel: AdViewModel{
        let info = BasicInfoViewModel(title: self.title ?? "",
                                      price: self.price ?? "",
                                      date: self.dateTime ?? "",
                                      address: self.address ?? "",
                                      id: self.id ?? "",
                                      views: self.visits ?? "")
        var imgVM : ImagesViewModel? = nil
        var featureVM : FeatureViewModel? = nil
        
        let details: [DetailViewModel]? = self.attributes?.map{ (k,v) in
             DetailViewModel(title: k, value: v)
        }
        
        if images != nil{
            imgVM = ImagesViewModel(images: images!)
        }
        
        if features != nil{
            featureVM = FeatureViewModel(features: self.features)
        }
        
        let docs: [DocsViewModel]? = self.documents?.map{ (k,v) in
             DocsViewModel(title: k, value: v)
        }
        
        return AdViewModel(images: imgVM,
                           basicInfo: info,
                           featureViewModel:featureVM,
                           detailViewModels: details,
                           docsViewModels: docs,
                           description: description
        )
    }
}
