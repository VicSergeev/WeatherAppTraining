//
//  ListItemTableViewCell.swift
//  WeatherApp
//
//  Created by Victor on 16.07.2024.
//

import UIKit
import SnapKit

// MARK: - tableView list cells

final class ListItemCell: BaseTableViewCell {
    
    // MARK: - UILabels
    lazy var dayLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        label.text = "Cell"
        label.textColor = .brown
        return label
    }()
    
    lazy var temperatureLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .blue
        label.text = "+25"
        return label
    }()
    
    // MARK: - UIStackViews
    lazy var mainStack: UIStackView = {
        var stack = UIStackView()
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 25
        stack.axis = .vertical
        return stack
    }()
    
    // MARK: - UIImages
    lazy var icon: UIImageView = {
        var icon = UIImageView()
        icon.contentMode = .scaleAspectFill
        var image = UIImage(systemName: "sun.rain")
        icon.image = image
        return icon
    }()
    
    
    // MARK: - BaseCell required method setupViews
    override func setupViews() {
        // MARK: - add views on mainView
        self.addSubview(dayLabel)
        self.addSubview(mainStack)
        
        // MARK: - add items into stacks
        mainStack.addArrangedSubview(icon)
        mainStack.addArrangedSubview(temperatureLabel)
        
        // MARK: - setup constraints
        dayLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(12)
        }
        
        mainStack.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.size.height.equalTo(56)
        }
    }
}
