

import UIKit
import CoreMotion

class ViewController: UIViewController {
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var distanceResultLabel: UILabel!
    
    @IBOutlet var ShowRecordsBtn: UIButton!
    @IBOutlet var SaveRecordButton: UIButton!
    
    @IBOutlet var upArrowImg: UIImageView!
    @IBOutlet var ConvertButton: UIButton!
    @IBOutlet var FingerImage: UIImageView!
    @IBOutlet var InstructionLabel: UILabel!
    var startTime = Date()
    var time: Double = 0.0
    var acceleration: Double = 0.0
    var startAcceleration: Double = 0.0
 
    var velocity: Double = 0.0
    var distance: Double = 0.0
    var numberOfReadings: Double = 0.0
//    let myBlue = UIColor (red:53/255.0, green:169/255.0, blue:255/255.0, alpha:1.0)
    let myRed = UIColor (red:208/255.0, green:2/255.0, blue:27/255.0, alpha:1.0)
    var badreadingcount: Double = 1.0 // TESTING
    
    var isInch : Bool = true
    
    var myTimer: Timer!
    var isOnFlick : Bool = true
    var isMeasured : Bool = false
// Saving record
    var sessionName : String = ""
    var sessionValue : String = ""
    
  
    @IBOutlet weak var appNameLabel: UIButton!
    
    var motionManager: CMMotionManager?

    
    @IBAction func resestHomePressed(_ sender: UIButton) {
        distanceResultLabel.isHidden = true
        ConvertButton.isHidden = true
        isMeasured = false
        resetVariables()
    }
    
    func startTimer (){
        if isOnFlick == true {
            isOnFlick = false;
            upArrowImg.isHidden = false;
        }
        else{
            isOnFlick = true;
            upArrowImg.isHidden = true;
        }
    }
    @IBAction func startButtonPressedDown(_ sender: UIButton) {
        
  //      self.FingerImage.isHidden = false;
  //      self.InstructionLabel.isHidden = false;
        
        myTimer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
        
        sender.backgroundColor = myRed
        startStopButton.setTitle("Release to Stop", for: .normal)
        
        distanceResultLabel.isHidden = true
        ConvertButton.isHidden = true;
        upArrowImg.isHidden = false;
        
        resetVariables()
     //   var firstReading: Double = 7777777.77
     //   var buttonStartTime = Date()
        var thisVelocity: Double = 0.0
        var thisAcceleration: Double = 0.0
//        print("startime: \(startTime)")
        motionManager = CMMotionManager()
        if let manager = motionManager {
            let myQ = OperationQueue()
            //manager.deviceMotionUpdateInterval = 0.01
            manager.deviceMotionUpdateInterval = 0.001
            
            manager.startDeviceMotionUpdates(to: myQ) {
                (data:CMDeviceMotion?, error: Error?) in
                if let myData = data {
                    thisAcceleration = myData.userAcceleration.x * 9.8 // converting to m/s2
                    if thisAcceleration > 0.004 || self.numberOfReadings > 0 {
                        if self.numberOfReadings == 0 {
                            self.startTime = Date()
                        }
                        self.acceleration = thisAcceleration
                        self.numberOfReadings += 1.0
               //         print("number of readings as it happens \(self.numberOfReadings)")
                        if self.acceleration < 0 {
                            self.acceleration *= -1.0
                        }
               //         print("acceleration-x", self.acceleration)
                        thisVelocity = (self.acceleration * 0.01) + thisVelocity // (accel  * time) + vel 0 = vel 1
                        self.velocity += thisVelocity
               //         print("total velocity from readings\(self.velocity)")
                    } else {
                        self.badreadingcount += 1.0
                    }
                }
            }
        }
    }
    
    func saveRecord(record : String)
    {
        let currentDateTime = Date()
        print("\(currentDateTime)  \(record) saved.")
        
    }
    
    @IBAction func stopButtonPressedUp(_ sender: UIButton) {
        
        myTimer.invalidate()
        myTimer = nil;
        
        
        startStopButton.setTitle("Press to Start", for: .normal)
        sender.backgroundColor = UIColor.black
        distanceResultLabel.backgroundColor = UIColor.black
        distanceResultLabel.isHidden = false
        motionManager?.stopDeviceMotionUpdates()
        time = Double(Date().timeIntervalSince(startTime))
//        print("time difference: \(time)")
        calculateDistance()
        if distance > 0 {
            let distanceStr:String =  String(round(1000*distance*39.37)/1000) + " Inch"
            distanceResultLabel.text = distanceStr
            sessionValue = distanceStr
            isMeasured = true;
        
        } else {
            
            distanceResultLabel.text = "Try Again :)"
        }
        
        distanceResultLabel.isHidden = false
        ConvertButton.isHidden = false;
        upArrowImg.isHidden = false;
        
    }
    
    @IBAction func ConvertTapped(_ sender: Any) {
        if isInch == true
        {
            let distanceStr:String =  String(round(1000*distance)/1000) + " Metre"
            distanceResultLabel.text = distanceStr
            ConvertButton.setTitle("Convert to Inch", for: UIControlState.normal);
            isInch = false;
            sessionValue = distanceStr
        }
        else{
            let distanceStr:String =  String(round(1000*distance*39.37)/1000) + " Inch"
            distanceResultLabel.text = distanceStr
            ConvertButton.setTitle("Convert to Metre", for: UIControlState.normal);
            isInch = true;
            sessionValue = distanceStr
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidLoaded")
        
        ShowRecordsBtn.layer.cornerRadius = 5.0
        
        SaveRecordButton.layer.cornerRadius = 5.0
        
        appNameLabel.setTitle("Measure Ninja", for: .normal)
        appNameLabel.backgroundColor = UIColor.black
        distanceResultLabel.isHidden = true
        ConvertButton.isHidden = true;
        isMeasured = false;
        if isInch {
            ConvertButton.setTitle("Convert to Metre", for: UIControlState.normal);
        }
        
    }
    
    func resetVariables() {
        velocity = 0.0
        distance = 0.0
        acceleration = 0.0
        time = 0.0
        startTime = Date()
        numberOfReadings = 0.0
    }
    
    func degrees(radians: Double) -> Double {
        return 180 / Double.pi * radians
    }
    
    func calculateDistance() {
 //       print("number of readings \(numberOfReadings)")
        velocity = velocity / numberOfReadings
        print("converted velocity \(velocity)")
        let rawDistance = velocity * time // converting to in/s2
        distance = rawDistance.squareRoot()
//        distance = rawDistance;
//        print("calculated dist \(distance) inches")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//// SAVING /////////////////
    func promptUserToEnterSessionName(title: String, message: String) {
        
        
        //1. Create the alert controller.
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField(configurationHandler: { (textField) -> Void in
            textField.text = ""
        })
        
        //3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { (action) -> Void in
            let textField = alert.textFields![0] as UITextField

            self.sessionName = textField.text!
            
            if self.sessionName.characters.count == 0{
                return;
            }
            
            let object = ResultModal(fromDictionary: [:])
            let key = DatabaseManager.singleton.currentUTCDateInString()
            object.key = key;
            object.answer = self.distanceResultLabel.text
            object.session = textField.text ?? ""
            DatabaseManager.singleton.writeObject(object: object, name: object.key)
            
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func SaveRecordTapped(_ sender: Any) {

        if isMeasured
        {
            promptUserToEnterSessionName(title: "Save Measurement Description", message: "Please enter the text")
            
        }
    }

    @IBAction func ShowRecordTapped(_ sender: Any) {

    }
}

