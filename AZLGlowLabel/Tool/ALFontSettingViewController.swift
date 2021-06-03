//
//  ALFontSettingViewController.swift
//  AZLGlowLabel
//
//  Created by lizihong on 2021/6/1.
//

import UIKit

class ALFontSettingViewController: UIViewController {

    @IBOutlet weak var borderColorButton: UIButton!
    @IBOutlet weak var borderWidthSlider: UISlider!
    @IBOutlet weak var fillColorButton: UIButton!
    
    @IBOutlet weak var fontNameButton: UIButton!
    
    @IBOutlet weak var fontSizeSlider: UISlider!
    
    @IBOutlet weak var glowColorButton: UIButton!
    
    @IBOutlet weak var glowSizeSlider: UISlider!
    
    
    @IBOutlet weak var innerGlowSizeSlider: UISlider!
    @IBOutlet weak var innerGlowColorButton: UIButton!
    
    var settingModel = AZLGlowSettingModel()
    
    public var settingDidChangeBlock:((AZLGlowSettingModel) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.borderColorButton.backgroundColor = self.settingModel.textBorderColor
        self.borderWidthSlider.value = Float(self.settingModel.textBorderWidth)
        self.fillColorButton.backgroundColor = self.settingModel.textFillColor
        
        self.fontNameButton.setTitle(self.settingModel.fontName, for: .normal)
        self.fontSizeSlider.value = Float(self.settingModel.fontSize)
        
        self.glowColorButton.backgroundColor = self.settingModel.glowColor
        self.glowSizeSlider.value = Float(self.settingModel.glowSize)
        
        self.innerGlowColorButton.backgroundColor = self.settingModel.innerGlowColor
        self.innerGlowSizeSlider.value = Float(self.settingModel.innerGlowSize)
    }
    
    func settingDidChange() {
        self.settingDidChangeBlock?(self.settingModel)
    }

    @IBAction func borderSliderValueDidChange(_ sender: Any) {
        self.settingModel.textBorderWidth = CGFloat(self.borderWidthSlider.value)
        
        self.settingDidChange()
    }
    
    @IBAction func borderColorDidTap(_ sender: Any) {
        let controller = ALDebugThemePickColorViewController()
        controller.modalPresentationStyle = .overFullScreen
        controller.color = self.borderColorButton.backgroundColor!
        controller.colorName = "边缘色"
        controller.completeBlock = { [weak self] (color) in
            self?.borderColorButton.backgroundColor = color
            self?.settingModel.textBorderColor = color
            self?.settingDidChange()
        }
        self.present(controller, animated: false, completion: nil)
    }
    
    @IBAction func fillColorDidTap(_ sender: Any) {
        let controller = ALDebugThemePickColorViewController()
        controller.modalPresentationStyle = .overFullScreen
        controller.color = self.fillColorButton.backgroundColor!
        controller.colorName = "填充色"
        controller.completeBlock = { [weak self] (color) in
            self?.fillColorButton.backgroundColor = color
            self?.settingModel.textFillColor = color
            self?.settingDidChange()
        }
        self.present(controller, animated: false, completion: nil)
    }
    
    @IBAction func fontNameDidTap(_ sender: Any) {
        let actionVC = UIAlertController.init(title: "选择字体", message: nil, preferredStyle: .actionSheet)
        for name in UIFont.familyNames {
            actionVC.addAction(UIAlertAction.init(title: name, style: .default, handler: { (action) in
                self.settingModel.fontName = name
                self.fontNameButton.setTitle(name, for: .normal)
                self.settingDidChange()
            }))
        }
        actionVC.addAction(UIAlertAction.init(title: "取消", style: .cancel, handler: { (action) in
            
        }))
        self.present(actionVC, animated: true, completion: nil)
    }
    
    @IBAction func fontSizeDidChange(_ sender: Any) {
        self.settingModel.fontSize = CGFloat(self.fontSizeSlider.value)
        self.settingDidChange()
    }
    
    @IBAction func glowColorDidTap(_ sender: Any) {
        let controller = ALDebugThemePickColorViewController()
        controller.modalPresentationStyle = .overFullScreen
        controller.color = self.glowColorButton.backgroundColor!
        controller.colorName = "发亮色"
        controller.completeBlock = { [weak self] (color) in
            self?.glowColorButton.backgroundColor = color
            self?.settingModel.glowColor = color
            self?.settingDidChange()
        }
        self.present(controller, animated: false, completion: nil)
    }
    
    @IBAction func glowSizeDidChange(_ sender: Any) {
        self.settingModel.glowSize = CGFloat(self.glowSizeSlider.value)
        self.settingDidChange()
    }
    
    @IBAction func innerGlowColorDidTap(_ sender: Any) {
        let controller = ALDebugThemePickColorViewController()
        controller.modalPresentationStyle = .overFullScreen
        controller.color = self.innerGlowColorButton.backgroundColor!
        controller.colorName = "发亮色2"
        controller.completeBlock = { [weak self] (color) in
            self?.innerGlowColorButton.backgroundColor = color
            self?.settingModel.innerGlowColor = color
            self?.settingDidChange()
        }
        self.present(controller, animated: false, completion: nil)
    }
    
    @IBAction func innerGlowSizeDidChange(_ sender: Any) {
        self.settingModel.innerGlowSize = CGFloat(self.innerGlowSizeSlider.value)
        self.settingDidChange()
    }
    
}
