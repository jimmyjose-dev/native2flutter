import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    GeneratedPluginRegistrant.register(with: self)

      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
              
      let deviceChannel = FlutterMethodChannel(name: "com.native2flutter", binaryMessenger:controller.binaryMessenger)
    
      prepareMethodHandler(channel: deviceChannel)
      

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    
    private func prepareMethodHandler(channel: FlutterMethodChannel) {
            
        channel.setMethodCallHandler({
                (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in

                if call.method == "invoke_native_method" {

                    channel.invokeMethod("invoke_flutter", arguments: "Hello from iOS native app")
                }
                else {
                    result(FlutterMethodNotImplemented)
                    return
                }
                
            })
        }
}
