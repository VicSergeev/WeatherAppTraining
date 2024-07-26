//
//  CurrentConditionView.swift
//  WeatherApp
//
//  Created by Victor on 24.07.2024.
//

import UIKit

final class CurrentConditionView: UIView, InstanceFromNibProtocol {
    typealias InstanceFromNibType = CurrentConditionView
    
    @IBOutlet weak var currentConditionIconImage: UIImageView!
    @IBOutlet weak var currentTempLabel: UILabel!
    
    
}

