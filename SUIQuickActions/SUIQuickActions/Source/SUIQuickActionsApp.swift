//
//  SUIQuickActionsApp.swift
//  SUIQuickActions
//
//  Created by sreekanth reddy iragam on 11/29/21.
//

import SwiftUI

var shortcutItemToProcess: UIApplicationShortcutItem?
let quickActionSettings = QuickActionSettings()

@main
struct SUIQuickActionsApp: App {
    @Environment(\.scenePhase) var scenePhase
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.green]
        /// during App initialization we can set the colors of nav bar for the entire App
    }
    var body: some Scene {
        WindowGroup {
                  QuickListView().environmentObject(quickActionSettings)
              }
              .onChange(of: scenePhase) { (newPhase) in
                  switch newPhase {
                  case .active :
                      print("App in active")
                      print("shortcutItemToProcess.. \(shortcutItemToProcess?.type)")
                      guard let name = shortcutItemToProcess?.type else {
                          return
                      }
                      switch name {
                      case "Call":
                          print("call is selected")
                          quickActionSettings.quickAction = .details(name: name)
                      case "Chat":
                          print("chat is selected")
                          quickActionSettings.quickAction = .details(name: name)
                      case "Status":
                          print("status is selected")
                          quickActionSettings.quickAction = .details(name: name)
                      case "Contact":
                          print("contct is selected")
                          quickActionSettings.quickAction = .details(name: name)
                      default:
                          print("default ")
                      }
                  case .inactive:
                      // inactive
                      print("App is inactive")
                  case .background:
                      print("App in Back ground")
                      addQuickActions()
                  @unknown default:
                      print("default")
                  }
              }
    }
    
    func addQuickActions() {
          UIApplication.shared.shortcutItems = [
              UIApplicationShortcutItem(type: "Call", localizedTitle: "Call"),
              UIApplicationShortcutItem(type: "Chat", localizedTitle: "Chat"),
              UIApplicationShortcutItem(type: "Status", localizedTitle: "Status"),
              UIApplicationShortcutItem(type: "Contacts", localizedTitle: "Contacts"),
          ]
      }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        if let shortcutItem = options.shortcutItem {
            shortcutItemToProcess = shortcutItem
        }
        
        let sceneConfiguration = UISceneConfiguration(name: "Custom Configuration", sessionRole: connectingSceneSession.role)
        sceneConfiguration.delegateClass = CustomSceneDelegate.self
        
        return sceneConfiguration
    }
}

class CustomSceneDelegate: UIResponder, UIWindowSceneDelegate {
    func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        shortcutItemToProcess = shortcutItem
    }
}
