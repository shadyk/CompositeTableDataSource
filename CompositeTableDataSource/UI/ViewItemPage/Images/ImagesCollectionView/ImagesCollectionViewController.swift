//
//  Created by Shady
//  All rights reserved.
//  

import UIKit


class ImagesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let identifier = "ImageCollectionCell"
    var controller: ImageCollectionController?
    var images: ImagesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        collectionView.allowsSelection = true
        collectionView.allowsMultipleSelection = false
        view.backgroundColor = .clear
        collectionView.register(ImageCollectionCell.self, forCellWithReuseIdentifier: identifier )
        collectionView.reloadData()
    }
    
    convenience init(collectionViewLayout layout: UICollectionViewLayout, controller: ImageCollectionController) {
        self.init(collectionViewLayout: layout)
        self.controller = controller
    }
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ImageCollectionCell
        let vm = images?.getThumbnailPath(id: "", image: "")
        cell.imgPath = vm
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        controller?.didSelectString?(images?.images?[indexPath.row])
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images?.images?.count ?? 1
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: 280)
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1)
        controller?.didScrollTo?(page + 1)
    }
}



