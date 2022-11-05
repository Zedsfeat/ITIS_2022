//
//  SelfConfiguringCell.swift
//  homework8
//
//  Created by zedsbook on 04.11.2022.
//

import Foundation
import UIKit

protocol SelfConfiguringCell {
    static var reuseId: String { get }
}
