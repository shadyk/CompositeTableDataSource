//
//  Created by Shady
//  All rights reserved.
//  

import UIKit

class DetailsDataSource: NSObject, UITableViewDataSource, UITableViewDelegate{
    private var details: [DetailViewModel]
    
    init(details: [DetailViewModel]){
        self.details = details
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return SectionHeaderView(title: "Details")
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return SECTION_HEADER_HEIGHT
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return details.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = details[indexPath.row]
        let cell = DetailsTableCell(style: .default, reuseIdentifier: "TableCell", data: data)
        return cell
    }
}
