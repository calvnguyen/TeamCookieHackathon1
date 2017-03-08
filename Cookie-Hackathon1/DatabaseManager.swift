//
//  DatabaseManager.swift
//  Probe
//
//  Created by Calvin Nguyen on 01/28/17.
//  Copyright © 2017 Calvin Nguyen. All rights reserved.
//

import Foundation

let rootClass = "roorClass"

class DatabaseManager: NSObject {
    
    static var singleton = DatabaseManager()
//    let defaultFormate = "yyyy-MM-dd'T'HH:mm:ss"
    let defaultFormate = "yyyy-MM-dd'T'HH:mm:ss"
    
    let surveyAnswerFolderName = "data"
    
    /*let realm = try! Realm()
    lazy var categories: Results<EntitySurvey> = { self.realm.objects(EntitySurvey.self) }()
    
    override init() {
        super.init()
        print("DATABASE : \(Realm.Configuration.defaultConfiguration.fileURL)")
    }
    
    func writeSurveyRoot(object : EntitySurveyRoot) {
        
        try! realm.write() {
            self.realm.add(object)
        }
    }*/

    //------------------------------------------------------
    
    //MARK: Initialisation 
    
    override init() {
        super.init()
        
        //crete folder
        print("document : \(documentDirectory)")
        _ = createFolder(foldername: surveyAnswerFolderName)
        
    }
    
    //------------------------------------------------------
    
    //MARK: Directories
    
    var documentDirectory : URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func createFolder(foldername : String) -> Bool {
        
        let folderPath = documentDirectory.appendingPathComponent(foldername)
        let manageger = FileManager.default
        if !manageger.fileExists(atPath: folderPath.absoluteString) {
            do {
                try manageger.createDirectory(at: folderPath, withIntermediateDirectories: false, attributes: nil)
                return true
            } catch let error as NSError {
                debugPrint(error.localizedDescription)
                return false
                
            }
        } else {
            return false
        }
    }
    
    func folderPath(foldername : String) -> URL? {
        
        let folderPath = documentDirectory.appendingPathComponent(foldername)
        let manageger = FileManager.default
        if !manageger.fileExists(atPath: folderPath.absoluteString) {
            return folderPath
        } else {
            return nil
        }
    }
    
    func getSurveyFileList() -> [String] {
        
        let folderPath = documentDirectory.appendingPathComponent(surveyAnswerFolderName)
        let manageger = FileManager.default
        let enumerator = manageger.enumerator(atPath: folderPath.path)
       
        var result : [String] = []
        while let fileName = enumerator?.nextObject() {
            result.append(fileName as! String)
        }
        return result
    }
    
    func removeFile(fileName : String) -> Bool {
        
        let folderPath = documentDirectory.appendingPathComponent(surveyAnswerFolderName).appendingPathComponent(fileName)
        let manageger = FileManager.default
        if !manageger.fileExists(atPath: folderPath.absoluteString) {
            do {
                try manageger.removeItem(at: folderPath)
                return true
            } catch let error {
                debugPrint(error.localizedDescription)
                return false
            }
        }
        return false
    }
    
    //------------------------------------------------------
    
    //MARK: Date and Time
    
    func currentUTCDateInString() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd  hh:mm:ss a"
        //dateFormatter.timeZone = TimeZone(identifier: "UTC")
        dateFormatter.locale = Locale.init(identifier: "en_GB")
//        dateFormatter.dateStyle = .full
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
//        dateFormatter.timeStyle = .short

        
        return dateFormatter.string(from: Date())
    }
    
    //------------------------------------------------------
    
    //MARK: operation
    
    func writeObject(object : ResultModal, name : String) {
        let filePath = folderPath(foldername: surveyAnswerFolderName)?.appendingPathComponent(name)
        if filePath != nil {
            let result = NSKeyedArchiver .archiveRootObject(object, toFile: filePath!.path)
            debugPrint("writeObject result = \(result)");
        }
    }
    //------------------------------------------------------
    
    func readObject(name : String) -> ResultModal? {
        
        let filePath = folderPath(foldername: surveyAnswerFolderName)?.appendingPathComponent(name)
        if filePath != nil {
            let result = NSKeyedUnarchiver.unarchiveObject(withFile: filePath!.path)
            if result != nil {
                return result as? ResultModal
            } else {
                return nil
            }
        }
        return nil
    }
    
    //------------------------------------------------------
}
