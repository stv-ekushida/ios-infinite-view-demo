//
//  UIStoryboard+Ex.swift
//  ios-infinite-view-demo
//
//  Created by Eiji Kushida on 2017/05/29.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

extension UIStoryboard {

    static func getViewController<T: UIViewController>(_ storyboardName: String, identifier: String) -> T? {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: identifier) as? T
    }
}
