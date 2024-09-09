//
//  MeasurementTableViewController.swift
//  hyeolgiwanseong
//
//  Created by Heowan on 9/9/24.
//

import UIKit

class MeasurementTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
    
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 0
    }

   
}
