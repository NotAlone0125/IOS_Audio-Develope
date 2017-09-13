//
//  ViewController.swift
//  Audio_Test04
//
//  Created by 杨昱航 on 2017/9/4.
//  Copyright © 2017年 杨昱航. All rights reserved.
//

import UIKit


import AVFoundation
import AudioToolbox

class ViewController: UIViewController,AVAudioPlayerDelegate {

    var audioPlayer = AVAudioPlayer.init()
    var timer = Timer.init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func audioPlay(_ sender: Any) {
        let playMusicPath = Bundle.main.path(forResource: "D.Mao - Stay With Me", ofType: "mp3")
        
        if (playMusicPath != nil) {
            try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        }
        
        let musicUrl = URL.init(fileURLWithPath: playMusicPath!)
        
        audioPlayer = try! AVAudioPlayer.init(contentsOf: musicUrl)
        
        audioPlayer.delegate = self
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.monitor), userInfo: nil, repeats: true)
        timer.fire()
        
        audioPlayer.play()
    }
    
    var peakvalue = String.init()
    
    func monitor() {
        //通道个数
        let channels = audioPlayer.numberOfChannels
        //音频时间
        let duration = audioPlayer.duration
        
        //更新状态
        audioPlayer.updateMeters()
        
        peakvalue = String.init(format: "%f,%f\n channels == %lu duration == %lu \n currentTime == %f", audioPlayer.peakPower(forChannel: 0),audioPlayer.peakPower(forChannel: 1),channels, duration,audioPlayer.currentTime)
        self.audioInfoTextView.text = peakvalue

        
        self.audioProgress.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
    }

    @IBAction func audioPause(_ sender: Any) {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
        }else{
            audioPlayer.play()
        }
    }
    
    @IBAction func audioStop(_ sender: Any) {
        self.audioTime.value = 0.0
        self.audioProgress.progress = 0.0
        audioPlayer.stop()
    }
    
    @IBAction func audioSwitch(_ sender: Any) {
        let _switch:UISwitch = sender as! UISwitch
        
        audioPlayer.volume = NSNumber.init(value: _switch.isOn).floatValue
    }
    
    @IBAction func audioCys(_ sender: Any) {
        audioPlayer.numberOfLoops = Int(self.cyc.value)
    }
    
    @IBAction func audioVol(_ sender: Any) {
        audioPlayer.volume = self.audioVol.value
    }
    
    @IBAction func audioPlayAtTime(_ sender: Any) {
        audioPlayer.stop()
        audioPlayer.currentTime = TimeInterval(self.audioTime.value * Float(audioPlayer.duration))
        audioPlayer.play()
    }
    
    @IBOutlet weak var audioTime: UISlider!
    
    @IBOutlet weak var audioInfoTextView: UITextView!

    @IBOutlet weak var cyc: UIStepper!
    
    @IBOutlet weak var audioVol: UISlider!
    
    @IBOutlet weak var audioProgress: UIProgressView!
    
    //AVAudioPlayerDelegate
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("完成播放")
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        print("解码错误")
    }
    
    
    
    
    
    
    

}

