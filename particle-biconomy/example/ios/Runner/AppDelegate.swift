import Flutter
import ParticleAuthService
import ParticleConnect
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        if ParticleAuthService.handleUrl(url) {
            return true
        } else if ParticleConnect.handleUrl(url) {
            return true
        } else {
            return super.application(app, open: url, options: options)
        }
    }
}
