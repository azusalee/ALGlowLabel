//
//  ALTextEditViewController.swift
//  AZLGlowLabel
//
//  Created by lizihong on 2021/6/2.
//

import UIKit

class ALTextEditViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    var text:String = ""
    
    var resultBlock:((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView.text = self.text
        // Do any additional setup after loading the view.
        self.textView.becomeFirstResponder()
    }

    @IBAction func cancelDidTap(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func confirmDidTap(_ sender: Any) {
        self.resultBlock?(self.textView.text)
        self.dismiss(animated: true, completion: nil)
    }
    
}
