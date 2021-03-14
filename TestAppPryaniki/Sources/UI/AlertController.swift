//
//  AlertController.swift
//  TestAppPryaniki
//
//  Created by User on 11.03.2021.
//

import UIKit

class AlertController{
    
    static public func getAlert(title: String, message: String,
                                cancelButton: Bool,
                                complession: @escaping ()->()?)-> UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { _ in complession()}
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(ok)
        if cancelButton{ alert.addAction(cancel)}
        return alert
    }
}
