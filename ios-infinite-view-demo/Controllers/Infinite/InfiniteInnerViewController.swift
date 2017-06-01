//
//  InfiniteInnerViewController.swift
//  ios-infinite-view-demo
//
//  Created by Eiji Kushida on 2017/05/29.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

private extension Selector {
    static let singleTap = #selector(InfiniteInnerViewController.singleTap(_:))
}

final class InfiniteInnerViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var pageIndex = 0
    var filePath = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addEventListener()
    }

    fileprivate func setup() {
        setupImageView(filePath: filePath)
    }

    fileprivate func setupImageView(filePath: String) {
        imageView.image = UIImage(named: filePath)
    }

    fileprivate func addEventListener() {

        let singleTapGesture = UITapGestureRecognizer(target: self,
                                                      action:.singleTap)
        singleTapGesture.numberOfTapsRequired = 1
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(singleTapGesture)
    }

    func singleTap(_ gesture: UITapGestureRecognizer) -> Void {
        print(#function, pageIndex)
    }
}
