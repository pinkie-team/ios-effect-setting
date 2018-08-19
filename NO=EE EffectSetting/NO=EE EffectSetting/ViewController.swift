//
//  ViewController.swift
//  NO=EE EffectSetting
//
//  Created by 岩見建汰 on 2018/08/16.
//  Copyright © 2018年 Kenta. All rights reserved.
//

import UIKit
import TinyConstraints
import Alamofire
import PopupDialog

class ViewController: UIViewController {

    @IBOutlet weak var hamonButton: UIButton!
    @IBOutlet weak var onomatoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hamonButton.setTitle("波紋", for: .normal)
        hamonButton.setTitleColor(UIColor.white, for: .normal)
        hamonButton.backgroundColor = UIColor.hex(Color.main.rawValue, alpha: 1.0)
        hamonButton.layer.cornerRadius = 15.0
        hamonButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        hamonButton.tag = 1
        
        onomatoButton.setTitle("オノマトペ", for: .normal)
        onomatoButton.setTitleColor(UIColor.white, for: .normal)
        onomatoButton.backgroundColor = UIColor.hex(Color.main.rawValue, alpha: 1.0)
        onomatoButton.layer.cornerRadius = 15.0
        onomatoButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        onomatoButton.tag = 2
        
        hamonButton.centerX(to: self.view)
        hamonButton.centerY(to: self.view, offset: -50)
        hamonButton.width(self.view.frame.width*0.8)
        hamonButton.height(50)
        onomatoButton.topToBottom(of: hamonButton, offset: 50)
        onomatoButton.centerX(to: self.view)
        onomatoButton.width(self.view.frame.width*0.8)
        onomatoButton.height(50)
    }
    
    func tapButton(sender: UIButton) {
        let url = "http://127.0.0.1:5000/effect/" + String(sender.tag)
        Alamofire.request(url, method: .get).responseJSON { (response) in
            let button = DefaultButton(title: "OK", dismissOnTap: true) {}
            let popup = PopupDialog(title: "成功", message: "エフェクトを変更しました") {}
            popup.transitionStyle = .zoomIn
            popup.addButtons([button])
            self.present(popup, animated: true, completion: nil)

            print(response)
            print("************** Call Done **************")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

