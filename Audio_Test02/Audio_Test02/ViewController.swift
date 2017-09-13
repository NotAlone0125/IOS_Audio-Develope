//
//  ViewController.swift
//  Audio_Test02
//
//  Created by 杨昱航 on 2017/8/29.
//  Copyright © 2017年 杨昱航. All rights reserved.
//

import UIKit


import AudioToolbox
//播放系统声音Audio SystemSound
/*
 播放震动效果：只能在ios设备使用，模拟器和ipad无法使用
 播放系统音乐效果：静音时无效
 播放提示音乐效果：无论是否静音均有提示声音效果
 */

class ViewController: UIViewController {

    //震动
    @IBAction func SystemSound01(_ sender: Any) {
        
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)

    }
    
    
    //系统声音（支持pcm编码（.caf(ios设备铃声文件格式),.wav,.arf,.m4a））
    @IBAction func SystemSound02(_ sender: Any) {
        let audioPath = Bundle.main.path(forResource: "Select", ofType: "caf")
        let systemSoundUrl  = URL.init(fileURLWithPath: audioPath!)
        //创建ID
        var systemSound_ID:SystemSoundID = SystemSoundID.init()
        AudioServicesCreateSystemSoundID(systemSoundUrl as CFURL, &systemSound_ID)
        
        //播放系统声音
        AudioServicesPlaySystemSound(systemSound_ID)
        
        //播放完成回调
        AudioServicesPlaySystemSoundWithCompletion(systemSound_ID) {
            //移除和释放
            print("complete")
            AudioServicesRemoveSystemSoundCompletion(systemSound_ID)
            AudioServicesDisposeSystemSoundID(systemSound_ID)
        }
    }

    //提示音
    @IBAction func SystemSound03(_ sender: Any) {
        //系统声音带震动，静音时提示音无效，但是可以震动
        let audioPath = Bundle.main.path(forResource: "Select", ofType: "caf")
        let systemSoundUrl  = URL.init(fileURLWithPath: audioPath!)
        //创建ID
        var systemSound_ID:SystemSoundID = SystemSoundID.init()
        AudioServicesCreateSystemSoundID(systemSoundUrl as CFURL, &systemSound_ID)
        
        //播放系统声音带震动的
        AudioServicesPlayAlertSound(systemSound_ID)//
        
        //播放完成回调带震动的
        AudioServicesPlayAlertSoundWithCompletion(systemSound_ID, {
            //移除和释放
            print("complete")
            AudioServicesRemoveSystemSoundCompletion(systemSound_ID)
            AudioServicesDisposeSystemSoundID(systemSound_ID)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
}
