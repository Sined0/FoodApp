//
//  extension.swift
//  MovieApp
//
//  Created by Denis Orlenko on 03.03.2023.
//

import Foundation
import UIKit

extension SectionRecipte {
     var itemArray: [BookOfRecipte] {
         let set = mySaveRecipte as? Set<BookOfRecipte> ?? []
         return set.sorted{
             $0.title! < $1.title!
         }
    }
}

extension UIApplication {
    func addTapGestureRecognizer() {
        guard let window = (connectedScenes.first as? UIWindowScene)?.windows.first else { return }
        let tapGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapGesture.requiresExclusiveTouchType = false
        tapGesture.cancelsTouchesInView = false
        tapGesture.delegate = self
        window.addGestureRecognizer(tapGesture)
    }
}

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true // set to `false` if you don't want to detect tap during other gestures
    }
}
