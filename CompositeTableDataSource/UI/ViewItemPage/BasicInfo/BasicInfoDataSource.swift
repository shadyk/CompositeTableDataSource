//
//  Created by Shady
//  All rights reserved.
//  

import UIKit

class BasicInfoDataSource: NSObject, UITableViewDataSource, UITableViewDelegate{
    private var basicInfo: BasicInfoViewModel
    
    init(basicInfo: BasicInfoViewModel){
        self.basicInfo = basicInfo
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bv = BasicInfoView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 200), basicInfo: basicInfo)
        let cell = UITableViewCell()
        cell.contentView.addSubview(bv)
        cell.selectionStyle = .none
        bv.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}
