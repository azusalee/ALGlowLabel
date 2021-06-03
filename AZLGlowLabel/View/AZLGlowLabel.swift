//
//  AZLGlowLabel.swift
//  AZLGlowLabel
//
//  Created by lizihong on 2021/6/1.
//

import UIKit

public class AZLGlowSettingModel: NSObject {
    public var fontName:String = "Arial"
    public var fontSize:CGFloat = 60
    
    public var textBorderWidth:CGFloat = 1
    public var textBorderColor:UIColor = .white
    
    public var textFillColor:UIColor = .white
    
    public var glowSize:CGFloat = 0
    public var glowColor:UIColor = .white
    
    public var innerGlowSize:CGFloat = 0
    public var innerGlowColor:UIColor = UIColor.white
}

public class AZLGlowLabel: UILabel {
    
    private var settingModel:AZLGlowSettingModel = AZLGlowSettingModel()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.updateUI(settingModel: self.settingModel)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        self.updateUI(settingModel: self.settingModel)
    }
    
    public func updateUI(settingModel:AZLGlowSettingModel) {
        self.settingModel = settingModel
        self.font = UIFont.init(name: settingModel.fontName, size: settingModel.fontSize)
        self.setNeedsDisplay()
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        let ctx = UIGraphicsGetCurrentContext()
        
        //UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
        
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
        ctx?.setTextDrawingMode(.fill)
        self.textColor = self.settingModel.textFillColor
        self.drawText(in: rect)
        let textImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        ctx?.clear(rect)
        if self.settingModel.glowSize > 0 {
            ctx?.setShadow(offset: .zero, blur: self.settingModel.glowSize, color: self.settingModel.glowColor.cgColor)
        }
        textImage?.draw(at: rect.origin)
        
        ctx?.setLineWidth(self.settingModel.textBorderWidth)
        ctx?.setLineJoin(.round)
        ctx?.setTextDrawingMode(.stroke)
        self.textColor = self.settingModel.textBorderColor
        self.drawText(in: rect)

//        
        if self.settingModel.innerGlowSize > 0 {
            UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
            let ctx2 = UIGraphicsGetCurrentContext()
            ctx2?.saveGState()
            ctx2?.setFillColor(UIColor.black.cgColor)
            ctx2?.fill(rect)
            ctx2?.translateBy(x: 0, y: rect.size.height)
            ctx2?.scaleBy(x: 1, y: -1)
            if let cgImage = textImage?.cgImage {
                ctx2?.clip(to: rect, mask: cgImage)
            }
            ctx2?.clear(rect)
            ctx2?.restoreGState()
            
            let invertImage = UIGraphicsGetImageFromCurrentImageContext()
            ctx2?.clear(rect)
            
            ctx2?.saveGState()
            ctx2?.setFillColor(self.settingModel.innerGlowColor.cgColor)
            ctx2?.setShadow(offset: .zero, blur: self.settingModel.innerGlowSize, color: self.settingModel.innerGlowColor.cgColor)
            invertImage?.draw(at: rect.origin)
            ctx2?.translateBy(x: 0, y: rect.size.height)
            ctx2?.scaleBy(x: 1, y: -1)
            if let cgImage = invertImage?.cgImage {
                ctx2?.clip(to: rect, mask: cgImage)
            }
            ctx2?.clear(rect)
            ctx2?.restoreGState()
            
            let innerImage = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            innerImage?.draw(at: rect.origin)
            
        }
    }
    

}
