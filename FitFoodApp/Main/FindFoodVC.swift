//
//  FindFoodVC.swift
//  FitFoodApp
//
//  Created by Александр Грачев on 22.12.2021.
//

import UIKit

final class FindFoodVC: UIViewController {
    
    var selectedFood = FoodItem(name: "",
                                kcal: "",
                                carbs: "",
                                protein: "",
                                fat: "")
    
    
    @IBOutlet weak var foodSearchBar: UISearchBar!
    @IBOutlet weak var foodTableView: UITableView!
    
    private var items: [FoodItem] = []
    private var filteredItems: [FoodItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        FirestoreManager.shared.getFoodItems { [weak self] items in
            guard let self = self else { return }
            self.items = items
            self.filteredItems = items
            DispatchQueue.main.async {
                self.foodTableView.reloadData()
            }
        }
        filteredItems = items
        foodTableView.delegate = self
        foodTableView.dataSource = self
        foodSearchBar.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? FoodInfoVC {
            vc.foodInfo = selectedFood
        }
    }
    
    @IBAction func backFromList(_ sender: Any) {
        performSegue(withIdentifier: "goBackFromFoodList", sender: nil)
    }
}

extension FindFoodVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCellID") as! FoodTableViewCell
        cell.foodNameLabel.text = filteredItems[indexPath.row].name
        cell.foodKcalLabel.text = filteredItems[indexPath.row].kcal + " kcal"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedFood = items[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showFoodInfo", sender: nil)
    }
}

extension FindFoodVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredItems = []
        
        if searchText == "" {
            filteredItems = items
        }
        
        for food in items {
            if food.name.uppercased().contains(searchText.uppercased()) {
                filteredItems.append(food)
            }
        }
        
        self.foodTableView.reloadData()
    }
}
