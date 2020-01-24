//
//  SceneDelegate.swift
//  getoff
//
//  Created by Steven Popovich on 1/24/20.
//  Copyright © 2020 Steven Popovich. All rights reserved.
//

import UIKit
import SwiftUI
import CoreLocation

struct DerivedSubwayData {
    let stationName: String
    let coordinate: CLLocationCoordinate2D
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate, CLLocationManagerDelegate {

    var window: UIWindow?

    var locationManager: CLLocationManager?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()

        var urlRequest = URLRequest(url: URL(string: "https://data.cityofnewyork.us/api/views/kk4q-3rt2/rows.json?accessType=DOWNLOAD")!)

        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")

        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in

            guard let data = data else { return }
            let subwayData = try? JSONDecoder().decode(SubwayData.self, from: data)

            guard let strongSubwayData = subwayData else { return }

            print(strongSubwayData.data[0][10])// Name is 10, location is 11
            print(strongSubwayData.data[0][11])// Name is 10, location is 11
            print(strongSubwayData.data)
            print(strongSubwayData.data[0].count)

            let subwayDerivedData = self.transformSubwayDataToUsefulStuff(strongSubwayData)

            
        }
        task.resume()
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            print(locationManager?.location)
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print(location)
        }
    }

    private func transformSubwayDataToUsefulStuff(_ subwayData: SubwayData) -> [DerivedSubwayData]  {
        subwayData.data.map {
            let pointString = $0[11]
            let stationName = $0[10]

            if case .string(let stationNameValue) = stationName {
                if case .string(let pointValue) = pointString {
                    let splitThing = pointValue.split(separator: " ")
                    print(splitThing)
                    let lat = CGFloat(Double(splitThing[1].suffix(splitThing[1].count - 2))!)
                    let lng = CGFloat(Double(splitThing[2].prefix(while: { $0 != ")" }))!)

                    return DerivedSubwayData(stationName: stationNameValue, coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(lng)))

                } else { fatalError() }

            } else { fatalError() }
        }
    }
}

