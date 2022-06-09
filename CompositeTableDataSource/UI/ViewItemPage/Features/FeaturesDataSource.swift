//
//  Created by Shady
//  All rights reserved.
//  

import UIKit

class FeaturesDataSource: NSObject, UITableViewDataSource, UITableViewDelegate{
    private var features: FeatureViewModel
    
    init(features: FeatureViewModel){
        self.features = features
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return SectionHeaderView(title: "Features")
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return SECTION_HEADER_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FeatureTableCell(style: .default, reuseIdentifier: "FeatureTableCell", data: features)

        return cell
    }
}
