//
//  InfiniteInnerViewController.swift
//  ios-infinite-view-demo
//
//  Created by Eiji Kushida on 2017/05/29.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

final class InfiniteInnerViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    var pageIndex = 0
    var filePath = ""
    fileprivate var isHidden = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupImageView(filePath: filePath)
    }

    fileprivate func setup() {
        setupImageView(filePath: filePath)
    }

    fileprivate func setupImageView(filePath: String) {
        imageView.image = UIImage(named: filePath)
    }
}
