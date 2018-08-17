//
//  RecordSoundsViewController
//  testAppEDT
//
//  Created by Andres, Alex K. on 8/14/18.
//  Copyright © 2018 Andres, Alex K. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController {
    @IBOutlet weak var stopRecordButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var labelOutlet: UILabel!
    var audioRecorder: AVAudioRecorder!
    
    //lifecycle - this executes 1st
    override func viewDidLoad() {
        super.viewDidLoad()
        print("didload")
        stopRecordButton.isEnabled = false

        // Do any additional setup after loading the view, typically from a nib.
        // no views on screen yet
        //disable stop recording here
    }
    
    //lifecycle - this executes 2nd
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //about to be on screen, but not yet
        print("willappear")
    }

    @IBAction func recordAction(_ sender: Any) {
        //disable record button, it is already playing
        labelOutlet.text = "Tap to stop record"
        recordButton.isEnabled = false
        stopRecordButton.isEnabled = true
        
        //record to a file
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        print("file: \(filePath)")
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopRecordingAction(_ sender: Any) {
        stopRecordButton.isEnabled = false
        recordButton.isEnabled = true
        labelOutlet.text = "Tap to record"
        
        //stop recording
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
}

