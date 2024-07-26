//
//  ConditionTableViewCell.swift
//  WeatherApp
//
//  Created by Victor on 22.07.2024.
//

import UIKit
import SnapKit

// MARK: - top cell that loads XIB view
final class CurrentConditionTableViewCell: BaseTableViewCell {
    
    
    lazy private var currentConditionView: CurrentConditionView = {
        CurrentConditionView.instanceFromNib()
    }()
    
    override func setupViews(){
        contentView.addSubview(currentConditionView)

        currentConditionView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
//            make.height.equalTo(120)
//            make.top.greaterThanOrEqualTo(80)
//            make.bottom.lessThanOrEqualToSuperview().offset(90)
        }
    }
}
