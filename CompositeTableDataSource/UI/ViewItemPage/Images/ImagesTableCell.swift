//
//  Created by Shady
//  All rights reserved.
//  

import UIKit

class ImagesTableCell: UITableViewCell {
    
    private var images: ImagesViewModel?

    private var collectionVC: ImagesCollectionViewController?
    private var didSelectImage: ((String?) -> Void)? = nil
    private var btnShare: UIButton = {
        let b = UIButton(type: .custom)
        b.frame.size = CGSize(width: 44, height: 44)
        b.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        return b
    }()

    private var lblPages: PaddingLabel = {
        let l = PaddingLabel()
        l.font = .systemFont(ofSize: 12)
        l.textColor = .customWhite()
        l.textAlignment = .center
        l.padding(5, 5, 5, 5)
        l.layer.cornerRadius = 3
        l.layer.backgroundColor = UIColor.transparentBlack().cgColor
        return l
    }()

    
    convenience init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, image: ImagesViewModel, didSelectImage: ((String?) -> Void)?) {
        self.init(style: style, reuseIdentifier: reuseIdentifier)
        self.images = image
        self.didSelectImage = didSelectImage
       setupInterface()
    }
    
    private func didScrollTo(page: Int?){
        guard let current = page, let total = images?.images?.count else{
            lblPages.isHidden = true
            print("error in didscrollto")
            return
        }
        setupPages(current: current, total: total)
    }
    
    private func setupInterface(){
        let ctrl = ImageCollectionController(didSelectString: didSelectImage, didScrollTo: didScrollTo)

        collectionVC = ImagesCollectionViewController(collectionViewLayout: ImagesCollectionLayout(),controller: ctrl)

        backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(collectionVC!.view)
        contentView.addSubview(btnShare)
        contentView.addSubview(lblPages)
        collectionVC!.images = images
        collectionVC!.view.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
        collectionVC!.collectionView.reloadData()
        btnShare.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(UIEdgeInsets(top: 12, left: 0, bottom: 0, right: 12))
        }
        lblPages.snp.makeConstraints { make in
            make.bottom.trailing.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 12))
        }
        didScrollTo(page: 1)
    }
    
    private func setupPages(current:Int, total :Int){
        lblPages.text = "\(current) / \(total)"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
