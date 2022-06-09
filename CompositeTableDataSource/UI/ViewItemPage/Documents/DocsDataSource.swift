//
//  Created by Shady
//  All rights reserved.
//  

import UIKit

class DocsDataSource: NSObject, UITableViewDataSource, UITableViewDelegate{
    private var data: [DocsViewModel]
    private var didSelectDoc: ((String?) -> Void)? = nil
    
    init(data: [DocsViewModel],didSelectDoc: ((String?) -> Void)?){
        self.data = data
        self.didSelectDoc = didSelectDoc
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return SectionHeaderView(title: "Documents")
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return SECTION_HEADER_HEIGHT
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = data[indexPath.row]
        let cell = DocsTableCell(style: .default, reuseIdentifier: "DocsTableCell", data: data)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = data[indexPath.row]
        self.didSelectDoc?(data.value)
    }
}
