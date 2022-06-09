//
//  Created by Shady
//  All rights reserved.
//  

import UIKit

class ViewItemViewController: UIViewController{
    
    private var loader: AdLoader?
    private var controller: ViewItemPageController?
    
    private lazy var tableView: UITableView = {
        let t = UITableView(frame: .zero, style: .grouped)
        t.backgroundColor = .white
        t.rowHeight = UITableView.automaticDimension
        t.estimatedRowHeight = 1
        t.separatorStyle = .none
        t.showsVerticalScrollIndicator = false
        return t
    }()
    
    var ds : (DataSource)? {
        didSet{
            tableView.dataSource = ds
            tableView.delegate = ds
            tableView.reloadData()
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
        
    convenience init(id: String, loader: AdLoader?, controller: ViewItemPageController){
        self.init()
        self.loader = loader
        self.controller = controller
        loadAd(id)
        setupInterface()
    }
    
    private func loadAd(_ id : String){
        guard loader != nil else {
            self.ds = self.controller?.didLoad(viewModel: AdViewModel())
            return
        }
        loader?.getAdDetails(id: id, success: { [weak self] viewModel in
            guard let self = self else {return}
            self.ds = self.controller?.didLoad(viewModel: viewModel)
        }, fail: { msg in
            self.showAlert(message: msg)
        })
    }
    
    private func setupInterface(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ViewItemViewController{
    func showAlert(title: String = "", message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: title, style: .default, handler: { (action) in
            alert.dismiss(animated: true)
        }))
        present(alert, animated: true, completion: nil)
    }
}

