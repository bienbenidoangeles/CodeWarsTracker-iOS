//
//  ThemePreviewsViewController.swift
//  CodeWarsTracker
//
//  Created by Bienbenido Angeles on 9/25/21.
//

import UIKit

class ThemePreviewsViewController: HighlightedViewController {
    
    private let themePreviewsView = ThemePreviewsView()

    override func loadView() {
        view = themePreviewsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegatesAndDatasources()
        pickerViewSelectsRow()
    }
    
    private func delegatesAndDatasources(){
        themePreviewsView.pickerView.dataSource = self
        themePreviewsView.pickerView.delegate = self
    }
    
    private func pickerViewSelectsRow(){
        let savedTheme = UserDefaultsManager.loadTheme()
        let row = PursuitTheme.allCases.firstIndex(of: savedTheme) ?? 0
        themePreviewsView.pickerView.selectRow(row, inComponent: 0, animated: true)
    }

}

extension ThemePreviewsViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return PursuitTheme.allCases.count
    }
}

extension ThemePreviewsViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return PursuitTheme.allCases[row].settingNames
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedTheme = PursuitTheme.allCases[row]
        UIView.animate(withDuration: 0.5) {
            ThemeManager.shared.setTheme(selectedTheme)
        }
        
        UserDefaultsManager.saveTheme(theme: selectedTheme)
    }
}
