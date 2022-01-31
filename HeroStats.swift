//
//  HeroStats.swift
//  TechZadacha
//
//  Created by Tilek on 24/1/22.
//

import Foundation
import UIKit

struct HeroStats: Decodable {
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let legs: Int
    let img: String
}


