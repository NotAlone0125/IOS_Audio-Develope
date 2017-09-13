//
//  ViewController.swift
//  Audio_Test03
//
//  Created by 杨昱航 on 2017/8/30.
//  Copyright © 2017年 杨昱航. All rights reserved.
//

import UIKit


import MediaPlayer
import AssetsLibrary

//音频参数
/*
 采样率：每秒钟取样的数目(常见44100，表示每秒采样器可以得到44100个采样点,单位是赫兹，采样频率越高，可以描绘的声波频率越高)，音频采样率是指录音设备在一秒钟内对声音信号的采样次数，采样频率越高声音的还原就越真实越自然。
 量化精度：量化精度是指可以将模拟信号分成多少个等级,量化精度越高，音乐的声压振幅越接近原音乐.在数字音频技术里取得采样值后，要对数据进行量化。量化，就是把各个时刻的采样值用计算机能识别的二进制来表示。量化后的数值与原来的采样值是有误差的，这个数值就是量化精度。量化精度越高，量化值与采样值之间的误差就越小，声音听起来就越逼真，越细腻。量化精度的单位是Bit.CD标准的量化精度是16Bit，DVD标准的量化精度是24Bit。
 比特率：比特率是指每秒传送的比特(bit)数。单位为 bps(Bit Per Second)，比特率越高，传送数据速度越快。声音中的比特率是指将模拟声音信号转换成数字声音信号后，单位时间内的二进制数据量，是间接衡量音频质量的一个指标。 视频中的比特率（码率）原理与声音中的相同，都是指由模拟信号转换为数字信号后，单位时间内的二进制数据量。
 */

//音频编解码、封装格式
/*
 常见编码方式：pcm,aac,mp3,ogg,Windows media audio
 常见封装格式：wav,m4a,mp3,ogg,wma
 以上一一对应
 */

class ViewController: UIViewController,MPMediaPickerControllerDelegate {
    //Audio控制类播放音乐（MPMediaPickerController,MPMusicPlayerController）
    //取 播
    
    var musicVC = MPMediaPickerController.init()
    var musicPlayVC = MPMusicPlayerController.init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        musicVC = MPMediaPickerController.init(mediaTypes: .anyAudio)
        musicVC.delegate = self
        musicVC.prompt = "请选择一首歌曲"
        self.present(musicVC, animated: true, completion: nil)
    }

    //MPMediaPickerControllerDelegate
    func mediaPicker(_ mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        //实现播放逻辑
        musicPlayVC.setQueue(with: mediaItemCollection)
        musicPlayVC.play()
    }
    
    func mediaPickerDidCancel(_ mediaPicker: MPMediaPickerController) {
        print("取消选择")
        mediaPicker.dismiss(animated: true, completion: nil)
    }

}

