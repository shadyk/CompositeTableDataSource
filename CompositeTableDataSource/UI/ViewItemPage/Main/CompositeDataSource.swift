//
//  Created by Shady
//  All rights reserved.
//  

import UIKit

typealias DataSource = UITableViewDataSource & UITableViewDelegate

class CompositeDataSource: NSObject, UITableViewDataSource, UITableViewDelegate{
    
    private var dataSources: [DataSource]
    init(dataSources: [DataSource]){
        self.dataSources = dataSources
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        var ctr = 0
        dataSources.forEach{
            ctr += $0.numberOfSections?(in: tableView) ?? 1
        }
        return ctr
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let ds = getDatasource(for: section, in: tableView)
        return ds.tableView?(tableView, viewForHeaderInSection: section)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let ds = getDatasource(for: section, in: tableView)
        return ds.tableView(tableView, numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ds = getDatasource(for: indexPath.section, in: tableView)
        return ds.tableView(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let ds = getDatasource(for: indexPath.section, in: tableView)
        return ds.tableView?(tableView, heightForRowAt: indexPath) ?? UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let ds = getDatasource(for: section, in: tableView)
        return ds.tableView?(tableView, heightForHeaderInSection: section) ?? UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ds = getDatasource(for: indexPath.section, in: tableView)
        ds.tableView?(tableView, didSelectRowAt: indexPath)
    }
    
    private func getDatasource(for section:Int, in tableView:UITableView) -> DataSource{
        var sectionCtr = 0
        for ds in dataSources{
            sectionCtr += ds.numberOfSections?(in: tableView) ?? 1
            if section < sectionCtr{
                return ds
            }
        }
        fatalError("couldnt find datasource")
    }
}
