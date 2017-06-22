//
//  FirstViewController.swift
//  Mock
//
//  Created by Michelle NW on 6/15/17.
//
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: Properties
    
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var colorPicker: UIPickerView!
    @IBOutlet weak var pickerView: UIView!
    @IBOutlet weak var numpadDoneButton: UIBarButtonItem!
    
    let colors = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple"]
    let codeLength = 4
    
    var selectedColor: String?
    var userData: UserData?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegates
        codeTextField.delegate = self
        nameTextField.delegate = self
        colorPicker.delegate = self
        colorPicker.dataSource = self
        
        // Make border for color
        colorLabel.layer.borderWidth = 1.0
        
        // Make changing border color for code and name
        codeTextField.layer.cornerRadius = 4.5
        codeTextField.layer.borderWidth = 0.5
        codeTextField.layer.borderColor = UIColor.lightGray.cgColor
        nameTextField.layer.cornerRadius = 4.5
        nameTextField.layer.borderWidth = 0.5
        nameTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        // Disable picker
        pickerView.isHidden = true
        
        // Hide numpad Done button
        numpadDoneButton.isEnabled = false
        numpadDoneButton.tintColor = UIColor.clear
        
        // Enable the Submit button only if input is valid.
        updateSubmitButtonState()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        pickerView.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == codeTextField {
            numpadDoneButton.isEnabled = true
            numpadDoneButton.tintColor = self.view.tintColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (codeTextField.text ?? "").characters.count == 4 {
            codeTextField.layer.borderColor = UIColor.green.cgColor
        } else {
            codeTextField.layer.borderColor = UIColor.lightGray.cgColor
        }
        if !(nameTextField.text ?? "").isEmpty {
            nameTextField.layer.borderColor = UIColor.green.cgColor
        } else {
            nameTextField.layer.borderColor = UIColor.lightGray.cgColor
        }
        numpadDoneButton.isEnabled = false
        numpadDoneButton.tintColor = UIColor.clear
        updateSubmitButtonState()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField === codeTextField {
            guard let text = codeTextField.text else {return true}
            let newLength = text.characters.count + string.characters.count - range.length
            return newLength <= codeLength
        }
        return true
    }
    
    // MARK: PickerDelegate
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row]
    }
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedColor = colors[row]
    }
    
    //MARK: Actions
    
    @IBAction func selectColor(_ sender: UITapGestureRecognizer) {
        codeTextField.resignFirstResponder()
        nameTextField.resignFirstResponder()
        
        self.tabBarController?.tabBar.isHidden = true
        pickerView.isHidden = false
    }
    
    @IBAction func finishSelectColor(_ sender: UIButton) {
        pickerView.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
        
        colorLabel.text = selectedColor ?? "Select Color"
        updateSubmitButtonState()
    }
    
    @IBAction func finishUsingNumpad(_ sender: UIBarButtonItem) {
        codeTextField.resignFirstResponder()
        numpadDoneButton.isEnabled = false
        numpadDoneButton.tintColor = UIColor.clear
    }
    
    @IBAction func submitData(_ sender: UIButton) {
        let data = UserData.init(color: colorLabel.text ?? "", code: codeTextField.text ?? "", name: nameTextField.text ?? "")
        
        if data != nil {
            GlobalData.sharedData.data.append(data!)
        }
        
        colorLabel.text = "Select Color"
        codeTextField.text = ""
        nameTextField.text = ""
        codeTextField.layer.borderColor = UIColor.lightGray.cgColor
        nameTextField.layer.borderColor = UIColor.lightGray.cgColor
        updateSubmitButtonState()
    }
    
    // MARK: Private Methods
    
    private func updateSubmitButtonState() {
        // Disable the Save button if the text field is empty.
        let color = colorLabel.text
        let code = codeTextField.text ?? ""
        let name = nameTextField.text ?? ""
        
        if color != "Select Color" && code.characters.count == codeLength && !name.isEmpty {
            submitButton.isEnabled = true
            submitButton.alpha = 1.0
        }
        else {
            submitButton.isEnabled = false
            submitButton.alpha = 0.4
        }
    }

}

