//
//  TabOneDetailsViewController.swift
//  Mock
//
//  Created by Michelle NW on 6/19/17.
//
//

import UIKit

class TabOneDetailsViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UILabel!
    @IBOutlet weak var codeTextField: UILabel!
    @IBOutlet weak var colorTextField: UILabel!
    
    var name: String?
    var code: String?
    var color: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.text = "Name: " + (name ?? "")
        codeTextField.text = "Code: " + (code ?? "")
        colorTextField.text = "Color: " + (color ?? "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
