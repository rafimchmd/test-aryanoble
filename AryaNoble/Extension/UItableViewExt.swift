//
//  UItableViewExt.swift
//  AryaNoble
//
//  Created by Rafi Mochamad Fahreza on 25/10/22.
//

import Foundation
import UIKit

extension UITableView {
    func setupBackground() {
        let bgView = UIView()
        bgView.backgroundColor = .white
        self.backgroundView = bgView
    }
}
