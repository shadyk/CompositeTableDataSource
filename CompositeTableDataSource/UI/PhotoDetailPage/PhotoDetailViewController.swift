//
//  Created by Shady
//  All rights reserved.
//  

import Foundation
import UIKit

class PhotoDetailViewController: UIViewController, UIScrollViewDelegate {
    
    private var imgPath: String? = nil
    
    private var imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .white
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    convenience init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, imgPath:String ) {
        self.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        defer { self.imgPath = imgPath}
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupNav() {
        navigationController?.isNavigationBarHidden = false
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupInterface()
        loadImage(imgPath  ?? "demo")
    }
    
    private func setupInterface(){
        view.backgroundColor = .white
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalToSuperview().inset(UIEdgeInsets(top: 60, left: 15, bottom: 15, right: 15))
        }
        setupNav()
    
    }
    
    func loadImage(_ imgPath: String){
        let url = URL(string: "https://images.unsplash.com/photo-1481349518771-20055b2a7b24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1878&q=80")
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(
            with: url,
//            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .scaleFactor(UIScreen.main.scale),
//                .transition(.fade(1)),
                .cacheOriginalImage
            ])
//        {
//            result in
//            switch result {
//            case .success(let value):
//                print("Task done for: \(value.source.url?.absoluteString ?? "")")
//            case .failure(let error):
//                print("Job failed: \(error.localizedDescription)")
//            }
//        }
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        scrollView.scrollsToTop = true
        return imageView
    }
}
