//
//  ViewController.swift
//  2.3_UIKit_start
//
//  Created by Nikita Verkhoturov on 07.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var switchLablel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        sliderSetup()
        mainLabelSutup()
      
        
    }
    
    // MARK: - IB Ations
    @IBAction func segmentedControlAction() {
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .blue
        default:
            mainLabel.text = "The third segment is selected"
            mainLabel.textColor = .yellow
        }
    }
    
    @IBAction func sliderAction() {
        mainLabel.text = slider.value.formatted()
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(CGFloat(slider.value))
        mainLabel.textColor = .black
    }
    
    
    @IBAction func doneButtonPressed() {
        guard let inputText = textField.text, !inputText.isEmpty else {
           showAlert(withTitle: "Text field is empty", andMessadge: "Enter your name")
            return
        }
        if let _ = Double(inputText) {
            showAlert(withTitle: "Wrong format", andMessadge: "Enter your name")
            return
        }
        mainLabel.text = inputText
    }
    
    
    @IBAction func datePickerAction() {
        mainLabel.text = datePicker.date.formatted(date: .long, time: .omitted)
    }
     
    
    @IBAction func switchAction(_ sender: UISwitch) {
        datePicker.isHidden = !sender.isOn
        switchLablel.text = sender.isOn ? "Hide DatePicker" : "Show DatePicker"
    }
    
    // MARK: - Privete Methods
    private func mainLabelSutup() {
        mainLabel.text = slider.value.formatted()
        mainLabel.font = UIFont.systemFont(ofSize: 35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        
        
    }
     
    private func sliderSetup() {
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
    }
    
}
// MARK: - UIAlertController
extension ViewController {
    private func showAlert(withTitle title: String, andMessadge message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.textField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

 
