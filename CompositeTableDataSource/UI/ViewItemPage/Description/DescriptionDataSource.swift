//
//  Created by Shady
//  All rights reserved.
//  

import UIKit

class DescriptionDataSource: NSObject, UITableViewDataSource, UITableViewDelegate{
    private var data: String
    
    init(data: String){
        self.data = data
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return SectionHeaderView(title: "Beschreibung")
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return SECTION_HEADER_HEIGHT
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = DescriptionTableViewCell(style: .default, reuseIdentifier: "TableCell",text: data)
    return cell
}

}
