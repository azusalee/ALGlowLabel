//
//  ViewController.swift
//  AZLGlowLabel
//
//  Created by lizihong on 2021/6/1.
//

import UIKit

class ViewController: UIViewController {

    
    let fontSettingController = ALFontSettingViewController()
    var glowLabel:AZLGlowLabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.black
        
        
        self.fontSettingController.view.frame = CGRect.init(x: 0, y: self.view.bounds.height-440, width: self.view.bounds.width, height: 440)
        self.fontSettingController.view.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        self.addChild(self.fontSettingController)
        self.view.addSubview(self.fontSettingController.view)
        
        self.fontSettingController.settingDidChangeBlock = { [weak self] (settingModel) in
            self?.glowLabel?.updateUI(settingModel: settingModel)
        }
        
        let glowLabel = AZLGlowLabel.init(frame: CGRect.init(origin: CGPoint.init(x: 50, y: 50), size: CGSize.init(width: 300, height: 300)))

        glowLabel.numberOfLines = 0
        glowLabel.text = "xixi hahabapiuyow?"
        self.glowLabel = glowLabel
        
        self.view.addSubview(glowLabel)
        
    }

    @IBAction func changeTextDidTap(_ sender: Any) {
        let controller = ALTextEditViewController()
        controller.text = self.glowLabel?.text ?? ""
        controller.resultBlock = { [weak self] (text) in
            self?.glowLabel?.text = text
        }
        
        self.present(controller, animated: true, completion: nil)
    }
    
}

