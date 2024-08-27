//
//  ViewController.swift
//  WeatherApp
//
//  Created by Victor on 16.07.2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    var tableView = UITableView()
    
//    lazy var bgImage: UIImageView = {
//        let image = UIImageView(image: UIImage(resource: .bg))
//        image.alpha = 0.5
//        return image
//    }()
    
    struct Cells {
        static let listItemCell = "ListItemTableViewCell"
        static let topCell = "CurrentConditionTableViewCell"
        static let lowerTopCell = "TotalConditionsTableViewCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfig()
        view.backgroundColor = .red
    }
}


// MARK: - Configuring TableView
private extension MainViewController {
    
    func tableViewConfig() {
        
        view.addSubview(tableView)
        setTableViewDelegates()
//        view.addSubview(bgImage)
        tableView.register(ListItemCell.self, forCellReuseIdentifier: Cells.listItemCell)
        tableView.register(CurrentConditionTableViewCell.self, forCellReuseIdentifier: Cells.topCell)
        tableView.register(TotalConditionsTableViewCell.self, forCellReuseIdentifier: Cells.lowerTopCell)
        
        // это базовый сепаратор
        tableView.separatorStyle = .none
        
        tableView.rowHeight = 120
        tableView.pin(to: view)
        tableView.contentInset = UIEdgeInsets.zero
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - Creating and configuring sections
extension MainViewController {
    enum TableViewSection: Int, CaseIterable {
        case top, lowerTop, mid, list
    }
}

// MARK: - DataSource&Delegate
// because of setTableViewDelegates()
extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    // MARK: - DataSource
    
    // MARK: - Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        TableViewSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 130
        case 1:
            return 140
        case 2:
            return 100
        default:
            return 90
        }
    }
    
    // MARK: - Section title
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        guard let sections = TableViewSection(rawValue: section) else {
//            return ""
//        }
//        
//        switch sections {
//        case .top:
//            return nil
//        case .mid:
//            return nil
//        case .list:
//            return "😎"
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 34.0 // Высота заголовка секции
//    }
    
    // MARK: - Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = TableViewSection(rawValue: section) else {
            return 0
        }
        
        switch sections {
        case .top:
            return 1
        case .lowerTop:
            return 1
        case .list:
            return 10
        case .mid:
            return 1
        }
    }
    
    // MARK: - Delegate
    // это метод, который вызывается системой, когда требуется отобразить ячейку
    // для конкретной строки таблицы
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let sections = TableViewSection(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        
        switch sections {
        case .top:
            let topCell = tableView.dequeueReusableCell(withIdentifier: Cells.topCell, for: indexPath) as! CurrentConditionTableViewCell
            topCell.backgroundColor = .clear
            return topCell
        case .lowerTop:
            // MARK: - CollectionView Cells
            let lowerTopCell = tableView.dequeueReusableCell(withIdentifier: Cells.lowerTopCell, for: indexPath) as! TotalConditionsTableViewCell
            lowerTopCell.backgroundColor = .red
            return lowerTopCell
        case .mid:
            let cell = UITableViewCell()
            cell.backgroundColor = .cyan
            return cell
        case .list:
            let listCell = tableView.dequeueReusableCell(withIdentifier: Cells.listItemCell, for: indexPath) as! ListItemCell
            return listCell
        }
    }
    
}
