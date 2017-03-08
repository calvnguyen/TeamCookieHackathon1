// lokeshkumawat22@yahoo.com
// +91-9024548411
// Skype : lokeshkumawat27

import UIKit
import CoreMotion

@available(iOS 10.0, *)
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
    var forAverageAcceleration: Double = 0.0
    var averageAccelerationFinal: Double = 0.0
    var Final: Double = 0.0
//    let myBlue = UIColor (red:53/255.0, green:169/255.0, blue:255/255.0, alpha:1.0)
    let myRed = UIColor (red:208/255.0, green:2/255.0, blue:27/255.0, alpha:1.0)
    var badreadingcount: Double = 1.0 // TESTING
    
    var isInch : Bool = false
    
    var myTimer: Timer!
    var isOnFlick : Bool = true
    var isMeasured : Bool = false
// Saving record
    var sessionName : String = ""
    var sessionValue : String = ""
    
    // Distance Valiable Set
    var lkDistance : NSString = ""
    @IBOutlet var lblLKDistance: UILabel!
    var isStarted : Bool = false
    
    @IBOutlet weak var appNameLabel: UIButton!
    
    var motionManager: CMMotionManager?
    var motionManagerNew: CMMotionManager?
    var timerNew = Timer()
    
    
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
    func doGyroUpdate() {
        let rate = motionManagerNew?.gyroData?.rotationRate.z
        let rate1 = motionManagerNew?.gyroData?.rotationRate.x
        let rate2 = motionManagerNew?.gyroData?.rotationRate.y
        if (fabs(rate!) > 0.2) {
            
        }
        print("self.distance.x ", floor(rate1!))
        print("self.distance.y ", floor(rate2!))

        if (floor(rate2!) > 0.2) {
            self.distance = self.distance + rate2!;
            print("self.distance ", self.distance)
            print("self.distance.z ", floor(rate!))
            print("self.distance.x ", floor(rate1!))
            print("self.distance.y ", floor(rate2!))

        }
        if (fabs(rate2!) > 0.2) {
            
        }


    }
    @IBAction func startButtonPressedDown(_ sender: UIButton) {
        isStarted = true
  //      self.FingerImage.isHidden = false;
  //      self.InstructionLabel.isHidden = false;
        
        myTimer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
        motionManagerNew?.startGyroUpdates()

        sender.backgroundColor = myRed
        startStopButton.setTitle("Release to Stop", for: .normal)
        
        distanceResultLabel.isHidden = true
        ConvertButton.isHidden = true;
        upArrowImg.isHidden = false;
     
       distance = 0.0
        
        
        resetVariables()
     //   var firstReading: Double = 7777777.77
     //   var buttonStartTime = Date()
        let thisVelocity: Double = 0.0
        var thisAcceleration: Double = 0.0
        print("startime: \(startTime)")
        motionManager = CMMotionManager()
       
        var dataLk = CMDeviceMotion()

        if let manager = motionManager {
            let myQ = OperationQueue()
            //manager.deviceMotionUpdateInterval = 0.01
            manager.deviceMotionUpdateInterval = 0.01
               print("myQ",myQ)
       //updates every time motion is changed
            manager.startDeviceMotionUpdates(to: myQ) {
             
                (data:CMDeviceMotion?, error: Error?) in
                if let myData = data {
                    //print("myData",myData)
                    thisAcceleration = myData.userAcceleration.x*9.81
                  print("thisAcceleration",myData.userAcceleration.x)
              
                    if(thisAcceleration < 0) {
                        self.forAverageAcceleration = self.forAverageAcceleration - thisAcceleration;
                    }else {
                        self.forAverageAcceleration += thisAcceleration;

                    }
                    if (thisAcceleration > 0) {
                    }
                    

                    //print("forAverageAcceleration-x", self.forAverageAcceleration)
                    
                        if self.numberOfReadings == 0
                        {
                            self.startTime = Date()
                           
                            }
                        else
                        {
                           
                         self.acceleration = thisAcceleration
                            if self.acceleration < 0.01
                            {
                        
                                self.acceleration = 0.0
                                self.forAverageAcceleration = 0;
                                
                                print("forAverageAcceleration-x", self.forAverageAcceleration)
                            }
                       

                        }
                        
                 
                    self.numberOfReadings += 1.0

                   
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
        isStarted = false
        myTimer.invalidate()
        myTimer = nil;
        //motionManager?.stopGyroUpdates()
        motionManagerNew?.stopGyroUpdates()

        startStopButton.setTitle("Press to Start", for: .normal)
        sender.backgroundColor = UIColor.black
        distanceResultLabel.backgroundColor = UIColor.black
        distanceResultLabel.isHidden = false
        motionManager?.stopDeviceMotionUpdates()
        time = Double(Date().timeIntervalSince(startTime))
       print("time difference..............: \(time)")
        calculateDistance()
        print("distance",distance)
      
        
        
        print("----------------------")
        self.averageAccelerationFinal = self.forAverageAcceleration/numberOfReadings
        print("forAverageAcceleration-x", self.averageAccelerationFinal)
        print("numberOfReadings-x", self.numberOfReadings)
        print("time-xx", self.time)
        
     
        // let distanceStr:String =  String(round(1000*distance*39.37)/1000) + " Inch"
        let distanceStr:String =  String(round((100*0.5*self.averageAccelerationFinal*(time*time))/2.54)) + " Inch"
            distanceResultLabel.text = distanceStr
            sessionValue = distanceStr
            isMeasured = true;
        
        distanceResultLabel.isHidden = false
        ConvertButton.isHidden = false;
        upArrowImg.isHidden = false;
        
        print("distanceStr-x",distanceStr)
        if distance == 0.0 {
            distance = ((100*0.5*self.averageAccelerationFinal*(time*time))/2.54)/39.37
        }
        isInch = false
        self.setLkCalculatedValue()
    }
    
    @IBAction func ConvertTapped(_ sender: Any) {
        if isInch == true
        {
            //let distanceStr:String =  String(round(1000*distance)/1000) + " Metre"
            let distanceLK = NSString(format: "%0.2f", distance) as String;

            let distanceStr:String =  distanceLK + " Metre"
            distanceResultLabel.text = distanceStr
            ConvertButton.setTitle("Convert to Inch", for: UIControlState.normal);
            isInch = false;
            sessionValue = distanceStr
        }
        else{
            //let distanceStr:String =  String(round(1000*distance*39.37)/1000) + " Inch"
            let distanceLK = NSString(format: "%0.2f", round(distance*39.37)) as String;
            let distanceStr:String =  distanceLK + " Inch"
            distanceResultLabel.text = distanceStr
            ConvertButton.setTitle("Convert to Metre", for: UIControlState.normal);
            isInch = true;
            sessionValue = distanceStr
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidLoaded")
//        motionManagerNew = CMMotionManager()
//        motionManagerNew?.startGyroUpdates()
//        timerNew = Timer.scheduledTimer(timeInterval: 1/30.0, target: self, selector: #selector(doGyroUpdate), userInfo: nil, repeats: true)

        
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
        
        
        // Distance Find from CoreMotion 
        
        let lkview = LKDistanceViewController();
        lkview.view.frame = CGRect(x: 10, y: 10, width: 100, height: 100);
        self.view.addSubview(lkview.view)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.methodOfReceivedNotification(notification:)), name:NSNotification.Name(rawValue: "LKDistanceViewController"), object: nil)

    }
    func methodOfReceivedNotification(notification: NSNotification){
        //do stuff
        let notifaction = notification.userInfo! as NSDictionary
        let newLKDistance = (notifaction["distance"] as? String)! as NSString;

        /*
         *  distance
         *
         *  Discussion:
         *      Estimated distance in meters traveled by the user while walking and
         *      running. Value is nil unsupported platforms.
         */
        if self.lkDistance.length > 1 {
            let calculate = (newLKDistance.floatValue - self.lkDistance.floatValue)
            if (calculate < 0) {
                distance =  distance - Double(calculate)
            }else {
                distance =  distance + Double(calculate)
            }
        }
        self.lkDistance = newLKDistance as NSString;
        //self.lblLKDistance.text = NSString(format: "Distance : %0.1f", distance) as String
        self.lblLKDistance.text = ""

    }
    func setLkCalculatedValue(){
        if isInch == true
        {
            let distanceLK = NSString(format: "%0.2f", distance) as String;
            
            let distanceStr:String =  distanceLK + " Metre"
            distanceResultLabel.text = distanceStr
            sessionValue = distanceStr
        }
        else{
            let distanceLK = NSString(format: "%0.2f", round(distance*39.37)) as String;
            let distanceStr:String =  distanceLK + " Inch"
            distanceResultLabel.text = distanceStr
            sessionValue = distanceStr
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
        print(velocity)
        
        velocity = velocity / numberOfReadings
        print("converted velocity \(velocity)")
        let rawDistance = velocity * time // converting to in/s2
        distance = rawDistance
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

