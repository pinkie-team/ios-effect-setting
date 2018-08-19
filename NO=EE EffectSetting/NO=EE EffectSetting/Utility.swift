//
//  Utility.swift
//  NO=EE EffectSetting
//
//  Created by 岩見建汰 on 2018/08/16.
//  Copyright © 2018年 Kenta. All rights reserved.
//

import Foundation
import PopupDialog

func ShowStandardAlert(title: String, msg: String, vc: UIViewController, completion: (() -> Void)?) {
    let button = DefaultButton(title: "OK", dismissOnTap: true) {}
    let popup = PopupDialog(title: title, message: msg) {
        if let tmpCompletion = completion {
            tmpCompletion()
        }
    }
    popup.transitionStyle = .zoomIn
    popup.addButtons([button])
    vc.present(popup, animated: true, completion: nil)
}
