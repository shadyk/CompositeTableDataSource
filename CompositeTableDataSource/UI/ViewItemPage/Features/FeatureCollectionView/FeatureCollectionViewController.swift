//
//  Created by Shady
//  All rights reserved.
//  

import UIKit


class FeatureCollectionViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    private let layout = FeaturesCollectionLayout()
     private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

    private let identifier = "FeatureCollectionCell"
    var data: FeatureViewModel?
    var updateHeight: ((Int) -> Void)?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateFlowLayout()
    }
    
    private func updateFlowLayout() {
         let height = collectionView.collectionViewLayout.collectionViewContentSize.height
        collectionView.snp.makeConstraints { make in
            make.height.equalTo(height)
        }
     }
    
    convenience init( data: FeatureViewModel){
        self.init()
        defer { self.data = data }
        collectionView.collectionViewLayout = layout
        setupInterface()
    }

    private func setupInterface() {
        view.backgroundColor = .clear
        view.addSubview(collectionView)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        collectionView.register(FeatureCollectionCell.self, forCellWithReuseIdentifier: identifier )
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    convenience init(collectionViewLayout layout: UICollectionViewLayout) {
//        self.init(collectionViewLayout: layout)
//    }
    
//    override init(collectionViewLayout layout: UICollectionViewLayout) {
//        super.init(collectionViewLayout: layout)
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! FeatureCollectionCell
        cell.data = data?.features?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.features?.count ?? 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          let width = collectionView.bounds.width
          let numberOfItemsPerRow: CGFloat = 2
        let spacing: CGFloat = 5.0 //minimumInteritemSpacing
          let availableWidth = width - spacing * (numberOfItemsPerRow + 1)
          let itemDimension = floor(availableWidth / numberOfItemsPerRow)
          return CGSize(width: itemDimension, height: 30)
      }
}

