//
//  UIView+Extensions.swift
//  RefreshableScrollView
//
//  Created by Mathijs Bernson on 03/03/2022.
//

import UIKit

extension UIView {
  func embedToEdges(_ view: UIView) {
    addSubview(view)
    view.translatesAutoresizingMaskIntoConstraints = false
    addConstraints([
      leadingAnchor.constraint(equalTo: view.leadingAnchor),
      trailingAnchor.constraint(equalTo: view.trailingAnchor),
      topAnchor.constraint(equalTo: view.topAnchor),
      bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
  }

  func embedToSafeArea(_ view: UIView) {
    addSubview(view)
    view.translatesAutoresizingMaskIntoConstraints = false
    addConstraints([
      view.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      view.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      view.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
    ])
  }
}

