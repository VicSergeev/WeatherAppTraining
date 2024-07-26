//
//  InstanceFromNibProtocol.swift
//  WeatherApp
//
//  Created by Victor on 25.07.2024.
//

import UIKit

protocol InstanceFromNibProtocol {
    associatedtype InstanceFromNibType: UIView
    static func instanceFromNib() -> InstanceFromNibType
}

extension InstanceFromNibProtocol {
    static func instanceFromNib() -> InstanceFromNibType {
        
        let nibName = InstanceFromNibType.className
        let nib = UINib(nibName: nibName, bundle: nil)
        
        return (nib.instantiate(withOwner: self, options: nil).first as? InstanceFromNibType) ?? InstanceFromNibType()
    }
}
