//
//  AppTextField.swift
//  Form
//
//  Created by Benny Davidovitz on 07/11/2016.
//  Copyright © 2016 xcoder.solutions. All rights reserved.
//

import UIKit

class AppTextField: UITextField {
    
    var showWarning : Bool{
        set /*(newValue)*/{
            self.rightViewMode = newValue ? .always : .never
        }
        get{
            return rightViewMode == .always
        }
    }
    

    fileprivate func addToolBar(){
        
        let screenWidth = UIScreen.main.bounds.width
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 44)) //44 is recommended height for UIToolBar
        
        let title = self.returnKeyType == .done ? "Done" : "Next"
        
        
        let nextButton = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(AppTextField.nextAction))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.items = [spaceButton,nextButton]
        
        self.inputAccessoryView = toolBar
    }
    
    func nextAction(){
        sendActions(for: .editingDidEndOnExit)
    }
    
    fileprivate func initialize(){
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bug"))
        self.rightView = imageView
        self.showWarning = false

        
        //font = UIFont(name: "Georgia", size: 16)
        textColor = .purple
        
        clearsOnBeginEditing = false
        clearButtonMode = .whileEditing
        spellCheckingType = .no
        autocorrectionType = .no
        
        switch self.keyboardType {
        case .phonePad, .numberPad:
            addToolBar()
        default:
            return
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
}

class PasswordTextField : AppTextField{
    fileprivate override func initialize() {
        super.initialize()
        
        isSecureTextEntry = true
        textColor = .black
        clearButtonMode = .never
    }
}

class BirthdateTextField : AppTextField{
    
    var date : Date?
    
    fileprivate override func initialize() {
        super.initialize()
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .white
        datePicker.maximumDate = Date()
        datePicker.date = Calendar.current.date(byAdding: .year, value: -18, to: Date()) ?? Date()
        
        datePicker.addTarget(self, action: #selector(BirthdateTextField.datePickerAction(_:)), for: .valueChanged)
        
        self.inputView = datePicker
        
        addToolBar()
    }
    
    func datePickerAction(_ sender : UIDatePicker){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        //dateFormatter.dateStyle = .medium
        //dateFormatter.timeStyle = .none
        self.text = dateFormatter.string(from: sender.date)
        
        self.date = sender.date
        
    }
    
    
}

class GenderTextField : AppTextField, UIPickerViewDataSource, UIPickerViewDelegate{
    
    var gender : Gender?
    
    enum Gender : Int {
        case male
        case female
        
        static let count = 2
        
        func title() -> String{
            switch self {
            case .female:
                return "Female"
            case .male:
                return "Male"
            }
        }
    }
    
    fileprivate override func initialize() {
        super.initialize()
        
        addToolBar()
        
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .white
        pickerView.delegate = self
        pickerView.dataSource = self
        
        self.inputView = pickerView
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Gender.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Gender(rawValue: row)?.title()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let g = Gender(rawValue: row)
        self.text = g?.title()
        self.gender = g
    }
}



















