//
//  TabThreeTableViewController.swift
//  Mock
//
//  Created by Michelle NW on 6/20/17.
//
//

import UIKit

class TabThreeTableViewController: UITableViewController {
    
    var expandedRows = Set<IndexPath>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return GlobalData.sharedData.data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "TabThreeTableViewCell"
        
        let cell: TabThreeTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! TabThreeTableViewCell
        
        cell.nameLabel.text = GlobalData.sharedData.data[indexPath.row].name
        cell.colorLabel.text = "Color: " + GlobalData.sharedData.data[indexPath.row].color
        cell.codeLabel.text = "Code: " + GlobalData.sharedData.data[indexPath.row].code
        cell.isExpanded = self.expandedRows.contains(indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !expandedRows.isEmpty && !expandedRows.contains(indexPath) {
            guard let cell = tableView.cellForRow(at: expandedRows.popFirst()!) as? TabThreeTableViewCell else {
                return
            }
            
            cell.isExpanded = false
        }
        
        guard let cell = tableView.cellForRow(at: indexPath) as? TabThreeTableViewCell else {
            return
        }
        
        if cell.isExpanded {
            self.expandedRows.remove(indexPath)
        } else {
            self.expandedRows.insert(indexPath)
        }
        
        cell.isExpanded = !cell.isExpanded
        tableView.beginUpdates()
        tableView.endUpdates()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
