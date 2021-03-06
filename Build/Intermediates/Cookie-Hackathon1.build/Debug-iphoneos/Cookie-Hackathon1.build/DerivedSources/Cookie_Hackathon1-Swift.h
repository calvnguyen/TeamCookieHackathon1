// Generated by Apple Swift version 3.0.2 (swiftlang-800.0.63 clang-800.0.42.1)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if defined(__has_attribute) && __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import ObjectiveC;
@import Foundation;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIWindow;
@class UIApplication;

SWIFT_CLASS("_TtC17Cookie_Hackathon111AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow * _Nullable window;
- (BOOL)application:(UIApplication * _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> * _Nullable)launchOptions;
- (void)applicationWillResignActive:(UIApplication * _Nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * _Nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * _Nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * _Nonnull)application;
- (void)applicationWillTerminate:(UIApplication * _Nonnull)application;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class ResultModal;

SWIFT_CLASS("_TtC17Cookie_Hackathon115DatabaseManager")
@interface DatabaseManager : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, strong) DatabaseManager * _Nonnull singleton;)
+ (DatabaseManager * _Nonnull)singleton;
+ (void)setSingleton:(DatabaseManager * _Nonnull)value;
@property (nonatomic, readonly, copy) NSString * _Nonnull defaultFormate;
@property (nonatomic, readonly, copy) NSString * _Nonnull surveyAnswerFolderName;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@property (nonatomic, readonly, copy) NSURL * _Nonnull documentDirectory;
- (BOOL)createFolderWithFoldername:(NSString * _Nonnull)foldername;
- (NSURL * _Nullable)folderPathWithFoldername:(NSString * _Nonnull)foldername;
- (NSArray<NSString *> * _Nonnull)getSurveyFileList;
- (BOOL)removeFileWithFileName:(NSString * _Nonnull)fileName;
- (NSString * _Nonnull)currentUTCDateInString;
- (void)writeObjectWithObject:(ResultModal * _Nonnull)object name:(NSString * _Nonnull)name;
- (ResultModal * _Nullable)readObjectWithName:(NSString * _Nonnull)name;
@end

@class UITableView;
@class UISearchBar;
@class UITableViewCell;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC17Cookie_Hackathon19RecordsVC")
@interface RecordsVC : UIViewController <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource, UIBarPositioningDelegate, UISearchBarDelegate>
@property (nonatomic, strong) IBOutlet UITableView * _Null_unspecified tableview;
@property (nonatomic, strong) IBOutlet UISearchBar * _Null_unspecified searchBar;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull files;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull cellString;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull filtered;
@property (nonatomic) BOOL searchActive;
- (void)viewDidLoad;
- (void)searchBarTextDidBeginEditing:(UISearchBar * _Nonnull)searchBar;
- (void)searchBarTextDidEndEditing:(UISearchBar * _Nonnull)searchBar;
- (void)searchBarCancelButtonClicked:(UISearchBar * _Nonnull)searchBar;
- (void)searchBarSearchButtonClicked:(UISearchBar * _Nonnull)searchBar;
- (void)searchBar:(UISearchBar * _Nonnull)searchBar textDidChange:(NSString * _Nonnull)searchText;
- (void)didReceiveMemoryWarning;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)tableView:(UITableView * _Nonnull)tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (void)tableView:(UITableView * _Nonnull)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class NSDictionary;

SWIFT_CLASS("_TtC17Cookie_Hackathon111ResultModal")
@interface ResultModal : NSObject <NSCoding>
@property (nonatomic, copy) NSString * _Null_unspecified answer;
@property (nonatomic, copy) NSString * _Null_unspecified key;
@property (nonatomic, copy) NSString * _Null_unspecified session;
/**
  <ul>
    <li>
      Instantiate the instance using the passed dictionary values to set the properties values
    </li>
  </ul>
*/
- (nonnull instancetype)initFromDictionary:(NSDictionary * _Nonnull)dictionary OBJC_DESIGNATED_INITIALIZER;
/**
  <ul>
    <li>
      Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
    </li>
  </ul>
*/
- (NSDictionary * _Nonnull)toDictionary;
/**
  <ul>
    <li>
      NSCoding required initializer.
    </li>
    <li>
      Fills the data from the passed decoder
    </li>
  </ul>
*/
- (nonnull instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
/**
  <ul>
    <li>
      NSCoding required method.
    </li>
    <li>
      Encodes mode properties into the decoder
    </li>
  </ul>
*/
- (void)encodeWithCoder:(NSCoder * _Nonnull)aCoder;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end

@class UIButton;
@class UIImageView;
@class UILabel;
@class UIColor;
@class NSTimer;
@class NSString;
@class CMMotionManager;
@class NSNotification;

SWIFT_CLASS("_TtC17Cookie_Hackathon114ViewController")
@interface ViewController : UIViewController
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified startStopButton;
@property (nonatomic, weak) IBOutlet UILabel * _Null_unspecified distanceResultLabel;
@property (nonatomic, strong) IBOutlet UIButton * _Null_unspecified ShowRecordsBtn;
@property (nonatomic, strong) IBOutlet UIButton * _Null_unspecified SaveRecordButton;
@property (nonatomic, strong) IBOutlet UIImageView * _Null_unspecified upArrowImg;
@property (nonatomic, strong) IBOutlet UIButton * _Null_unspecified ConvertButton;
@property (nonatomic, strong) IBOutlet UIImageView * _Null_unspecified FingerImage;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified InstructionLabel;
@property (nonatomic, copy) NSDate * _Nonnull startTime;
@property (nonatomic) double time;
@property (nonatomic) double acceleration;
@property (nonatomic) double startAcceleration;
@property (nonatomic) double velocity;
@property (nonatomic) double distance;
@property (nonatomic) double numberOfReadings;
@property (nonatomic) double forAverageAcceleration;
@property (nonatomic) double averageAccelerationFinal;
@property (nonatomic) double Final;
@property (nonatomic, readonly, strong) UIColor * _Nonnull myRed;
@property (nonatomic) double badreadingcount;
@property (nonatomic) BOOL isInch;
@property (nonatomic, strong) NSTimer * _Null_unspecified myTimer;
@property (nonatomic) BOOL isOnFlick;
@property (nonatomic) BOOL isMeasured;
@property (nonatomic, copy) NSString * _Nonnull sessionName;
@property (nonatomic, copy) NSString * _Nonnull sessionValue;
@property (nonatomic, strong) NSString * _Nonnull lkDistance;
@property (nonatomic, strong) IBOutlet UILabel * _Null_unspecified lblLKDistance;
@property (nonatomic) BOOL isStarted;
@property (nonatomic, weak) IBOutlet UIButton * _Null_unspecified appNameLabel;
@property (nonatomic, strong) CMMotionManager * _Nullable motionManager;
@property (nonatomic, strong) CMMotionManager * _Nullable motionManagerNew;
@property (nonatomic, strong) NSTimer * _Nonnull timerNew;
- (IBAction)resestHomePressed:(UIButton * _Nonnull)sender;
- (void)startTimer;
- (void)doGyroUpdate;
- (IBAction)startButtonPressedDown:(UIButton * _Nonnull)sender;
- (void)saveRecordWithRecord:(NSString * _Nonnull)record;
- (IBAction)stopButtonPressedUp:(UIButton * _Nonnull)sender;
- (IBAction)ConvertTapped:(id _Nonnull)sender;
- (void)viewDidLoad;
- (void)methodOfReceivedNotificationWithNotification:(NSNotification * _Nonnull)notification;
- (void)setLkCalculatedValue;
- (void)resetVariables;
- (double)degreesWithRadians:(double)radians;
- (void)calculateDistance;
- (void)didReceiveMemoryWarning;
/**
  / SAVING /////////////////
*/
- (void)promptUserToEnterSessionNameWithTitle:(NSString * _Nonnull)title message:(NSString * _Nonnull)message;
- (IBAction)SaveRecordTapped:(id _Nonnull)sender;
- (IBAction)ShowRecordTapped:(id _Nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop
