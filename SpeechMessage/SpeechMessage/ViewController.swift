//
//  ViewController.swift
//  SpeechMessage
//
//  Created by Justin on 2017/10/20.
//  Copyright © 2017年 Justin. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController, AVSpeechSynthesizerDelegate {

    let synth = AVSpeechSynthesizer() //TTS对象
    let audioSession = AVAudioSession.sharedInstance() //语音引擎
    var sex = "zh_CN"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        synth.delegate = self
    }
    @IBAction func playerSexButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            sex = "zh-CN"
        } else {
            sex = "zh_CN"
        }
    }
    @IBAction func playButton(_ sender: UIButton) {
        
        let message = "欢迎来到 VIIVA"
        speechMessage(message: message)
    }
    
    // 按按钮开始语音
    func speechMessage(message:String){
        if !message.isEmpty {
            do {
                // 设置语音环境，保证能朗读出声音（特别是刚做过语音识别，这句话必加，不然没声音）
                try audioSession.setCategory(AVAudioSessionCategoryAmbient)
            }catch let error as NSError{
                print(error.code)
            }
            //需要转的文本
            let utterance = AVSpeechUtterance.init(string: message)
            //设置语言，这里是中文(男声:language:"zh_CN",女声:language:"zh_CN")
            utterance.voice = AVSpeechSynthesisVoice.init(language: sex)
            //设置声音大小
            utterance.volume = 1
            //设置音频
            utterance.pitchMultiplier = 1.1
            //开始朗读
            synth.speak(utterance)
        }
    }
    
    //按按钮结束语音
    func StopSpeech() {
        // 立即中断语音
        synth.stopSpeaking(at: AVSpeechBoundary.immediate)
        // synth.stopSpeaking(at: AVSpeechBoundary.word)也能结束语音，但遇到中断上一个语音，立即朗读另一个文本就做不到。
    }
    
    // 语音结束之后要做的事（代理方法）
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        // code
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

