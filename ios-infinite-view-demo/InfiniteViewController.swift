//
//  InfiniteViewController.swift
//  ios-infinite-view-demo
//
//  Created by Eiji Kushida on 2017/05/29.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

class InfiniteViewController: UIViewController {

    fileprivate var pageViewController:UIPageViewController!
    fileprivate var imageFiles = ["000.jpeg","001.jpeg","002.jpeg","003.jpeg","004.jpeg"]
    fileprivate var pageIndex = 0
    fileprivate var dataSource = PageViewDataProvider()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func scrollToPage(_ pageIndex: Int) {
        if let currentViewController = dataSource.viewControllerAtIndex(pageIndex) {

            if let pageViewController = pageViewController {
                pageViewController.setViewControllers([currentViewController],
                                                      direction: .forward,
                                                      animated: false,
                                                      completion: nil)
            }
        }
    }

    fileprivate func setup() {

        setupNavigationBar()
        setupDataSource(imageFiles: imageFiles)
        setupPageView()
    }

    fileprivate func setupNavigationBar() {
        self.navigationController?.hidesBarsOnTap = true
    }

    fileprivate func setupDataSource(imageFiles: [String]) {
        dataSource.setupImageFile(imageFiles: imageFiles)
    }

    fileprivate func setupPageView() {
        if let startingViewController = dataSource.viewControllerAtIndex(0) {

            pageViewController = UIPageViewController(transitionStyle: .scroll,
                                                      navigationOrientation: .horizontal,
                                                      options: [UIPageViewControllerOptionInterPageSpacingKey : 20])

            if let pageViewController = pageViewController {

                pageViewController.view.backgroundColor = UIColor(hex: 0xc6c6c6)
                pageViewController.dataSource = dataSource
                pageViewController.delegate = self
                pageViewController.setViewControllers([startingViewController],
                                                      direction: .forward,
                                                      animated: false,
                                                      completion: {done in})
                pageViewController.view.frame = self.view.frame
                addChildViewController(pageViewController)
                self.view.addSubview(pageViewController.view)
            }
        }
    }
}

//MARK : - UIPageViewControllerDelegate
extension InfiniteViewController: UIPageViewControllerDelegate {

    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {

        if let vc = pageViewController.viewControllers?.first as? InfiniteInnerViewController {
            print(vc.pageIndex)
        }
    }
}
