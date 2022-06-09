//
//  Created by Shady
//  All rights reserved.
//  

import UIKit
let SECTION_HEADER_HEIGHT = 68.0
class Composer{
    static var mainNav: UINavigationController = {
        let nav = UINavigationController()
        nav.isNavigationBarHidden = true
        return nav
    }()
    
    
    static func viewItemPage( id:String, loader: AdLoader?, controller: ViewItemPageController) -> ViewItemViewController{
        let vc = ViewItemViewController(id: id, loader: loader, controller: controller)
        return vc
    }
    
    static func pdfViewContoller(pdf:String) -> PDFViewController{
        let vc = PDFViewController(nibName: nil, bundle: nil, pdf: pdf)
        return vc
    }
    
    static func photoDetailViewController(img:String) -> PhotoDetailViewController{
        let vc = PhotoDetailViewController(nibName: nil, bundle: nil, imgPath: img)
        return vc
    }

}

extension UINavigationController{
    func setRootVC(_ vc: UIViewController){
        self.viewControllers = [vc]
    }
}
