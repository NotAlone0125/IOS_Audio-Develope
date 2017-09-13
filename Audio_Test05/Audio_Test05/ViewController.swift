//
//  ViewController.swift
//  Audio_Test05
//
//  Created by 杨昱航 on 2017/9/4.
//  Copyright © 2017年 杨昱航. All rights reserved.
//

import UIKit


//AVFoundation语言识别(ios 7)
//AVSpeechSynthesizer(语音合成控制器)
//AVSpeechUtterance(语音合成单元，语音，语速，语调等等)
import AVFoundation

class ViewController: UIViewController,AVSpeechSynthesizerDelegate {

    var speechSynthesizer = AVSpeechSynthesizer.init()
    var speechUtterance = AVSpeechUtterance.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        speechSynthesizer.delegate = self
        
        speechUtterance = AVSpeechUtterance.init(string: "Welcome to 秦风云讯")
        speechUtterance.rate = 1.0
        
        speechSynthesizer.speak(speechUtterance)
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        print("开始语音处理")
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        print("语音处理结束")
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

