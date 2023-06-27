# AppleTVDemo
This is a sample project that shows how to integrate CleverTap iOS SDK  With Apple TV

Following are the steps,

### Step 1 - Intsall CleverTap iOS SDK

For your tvOS app, add the following to your Podfile:

  ```
  target 'YOUR_TARGET_NAME' do  
      pod 'CleverTap-iOS-SDK'  
  end     
  ```
  Then run `pod install`.
  
### Step 2 - Integrate CleverTap iOS SDK

#### Add your CleverTap account credentials

Update your .plist file:

* Create a key called **CleverTapAccountID** with a string value
* Create a key called **CleverTapToken** with a string value
* Insert the values from your CleverTap [Dashboard](https://dashboard.clevertap.com) -> Settings -> Integration Details.

Integrate in Appdelegate file:

* Import CleverTapSDK to your AppDelegate.swift
* Add following method call to your Appdelegate.swift file

```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Configure and init the default shared CleverTap instance (add CleverTap Account ID and Account Token in your .plist file)
        CleverTap.autoIntegrate()
        CleverTap.setDebugLevel(CleverTapLogLevel.debug.rawValue)
}
```
* Similarly import CleverTapSDK in ViewController class file, and call following methods to identify users and to raise events

```
// onUserLogin to identify users
let profile: Dictionary<String, Any> = [
            "Name": "Test User",
            "Email": "test.user@gmail.com",
            "Plan type": "Silver",
            "Favorite Food": "Pizza"
        ]
 CleverTap.sharedInstance()?.onUserLogin(profile)
        
// recordEvent to record an event with name
CleverTap.sharedInstance()?.recordEvent("RecordButtonForTVOS_Pressed")

// recordEventwithProps for recording an event with name and properties
let props = [
            "Product name": "Apple TV",
            "Category": "Digital",
            "Price": 167.00,
            "Date": NSDate()
        ] as [String : Any]

CleverTap.sharedInstance()?.recordEvent("RecordWithPropsButtonForTVOS_Pressed", withProps: props)

```

