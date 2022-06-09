//
//  Created by Shady
//  All rights reserved.
//  

import Foundation

protocol ViewItemPageController {
    func didLoad(viewModel: AdViewModel) -> DataSource
    func didSelectImage(image: String?)
    func didSelectDocument(pdf: String?)
}

class DefaultViewItemController: ViewItemPageController{
    func didLoad(viewModel: AdViewModel) -> DataSource {
        return setupDataSource(viewModel)
    }
    
    private func setupDataSource(_ viewModel: AdViewModel) -> DataSource{
        var dataSources: [(DataSource)] = []
        if let img  = viewModel.images{
            dataSources.append(ImagesDataSource(image: img, didSelectImage: didSelectImage))
        }
        if let info  = viewModel.basicInfo{
            dataSources.append(BasicInfoDataSource(basicInfo: info))
        }
        if let details  = viewModel.detailViewModels{
            dataSources.append(DetailsDataSource(details: details))
        }
        if let feature  = viewModel.featureViewModel{
            dataSources.append(FeaturesDataSource(features: feature))
        }
        if let docs = viewModel.docsViewModels{
            dataSources.append(DocsDataSource(data: docs, didSelectDoc: didSelectDocument))
        }
        if let desc  = viewModel.description{
            dataSources.append(DescriptionDataSource(data: desc))
        }
        return CompositeDataSource(dataSources: dataSources)
    }
    
    func didSelectImage(image:String?){
        Composer.mainNav.pushViewController(Composer.photoDetailViewController(img: image ?? ""), animated: true)
    }
    
    func didSelectDocument(pdf: String?) {
        Composer.mainNav.pushViewController(Composer.pdfViewContoller(pdf: pdf ?? ""), animated: true)
    }
}




class DummyViewItemController: ViewItemPageController{
    func didLoad(viewModel: AdViewModel) -> DataSource {
        return setupDataSource(viewModel)
    }
    
    private func setupDataSource(_ viewModel: AdViewModel) -> DataSource{
        
        let basicInfo =  BasicInfoViewModel(title: "Product Name", price: "$11,111", date: "11/11/2222", address: "street, City, Country", id: "11234555", views: "22")
        let details = [DetailViewModel(title: "Detail 1 title", value: "Detail 1 Value"),DetailViewModel(title: "Detail 2 title", value: "Detail 2 value")]
        let features = FeatureViewModel(features: ["feature1","feature2","feature3","feature4","feature5","feature6","feature7","feature8","feature9","feature10","feature11","feature12"])
        let images = ImagesViewModel(images: ["demo", "demo", "demo"])
        let docs = [DocsViewModel(title: "Pdf  1 title", value: "/path"),DocsViewModel(title: "Pdf  2 title", value: "/path")]
         let t = """
    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.        Why do we use it?        It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
    """
        
        return CompositeDataSource(dataSources: [
            ImagesDataSource(image: images, didSelectImage: didSelectImage),
            BasicInfoDataSource(basicInfo: basicInfo),
            DetailsDataSource(details:details ),
            FeaturesDataSource(features: features),
            DocsDataSource(data: docs, didSelectDoc: didSelectDocument),
            DescriptionDataSource(data: t)
        ])
    }
    
    func didSelectImage(image:String?){
        Composer.mainNav.pushViewController(Composer.photoDetailViewController(img: image ?? ""), animated: true)
    }
    
    func didSelectDocument(pdf: String?) {
        Composer.mainNav.pushViewController(Composer.pdfViewContoller(pdf: pdf ?? ""), animated: true)
    }
    
    
}
