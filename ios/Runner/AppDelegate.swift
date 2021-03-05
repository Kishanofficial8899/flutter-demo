import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
[GeneratedPluginRegistrant registerWithRegistry:self];
[GMSServices provideAPIKey:@"AIzaSyBaaGHC-4fkB9oMGzTcyDRI7_rlAuCxvwQ"];
