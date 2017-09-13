//
//  ViewController.swift
//  Audio_Test01
//
//  Created by 杨昱航 on 2017/8/29.
//  Copyright © 2017年 杨昱航. All rights reserved.
//

import UIKit


import MediaPlayer//VC
import AudioUnit//底层
import OpenAL//3D
import AVFoundation//全能型
import AudioToolbox//编解码

class ViewController: UIViewController {

    //Audio架构
    /*
     高层:AVAudioPlayer,Audio QueueServices,Extended Audio File Service,OpenAL
     中层:Audio Converter Services,Audio File Services,Andui Unit Services,Audio Processing Grap Services,Core Audio Clock Services
     高层:I/O Kit,Audio HAL,Host Time Services,Core MIDI
     */
    
    //简单获取一个音频文件的信息
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //路径
        let audioPath = Bundle.main.path(forResource: "chengdu", ofType: "mp3")
        let audioUrl = NSURL.fileURL(withPath: audioPath!)
        
        //打开
        var audioFile:AudioFileID?
        
        AudioFileOpenURL(audioUrl as CFURL, .readWritePermission, 0, &audioFile)
        
        //读取
        var dictionarySize:UInt32 = 0
        var isWrite:UInt32 = 0
        
        AudioFileGetPropertyInfo(audioFile!, kAudioFilePropertyInfoDictionary, &dictionarySize, &isWrite)

        var piDict:CFDictionary?
        
        AudioFileGetProperty(audioFile!, kAudioFilePropertyInfoDictionary, &dictionarySize, &piDict)
        
        let audioDic:[AnyHashable:Any] = piDict as! [AnyHashable : Any]
        
        for (key,value) in audioDic {
            print("key--\(key),value\(value)")
        }
        
        
        
        AudioFileClose(audioFile!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}













