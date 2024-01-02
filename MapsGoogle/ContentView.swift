//
//  ContentView.swift
//  MapsGoogle
//
//  Created by tom montgomery on 8/20/23.
//

import SwiftUI

// GOOGLE MAPS
// 1- info.plist > add LSApplicationQueriesSchemes (now Queried URL Schemes)
// a type of Launch Service Key.  Provides support for launching apps, matching doc types
// 2- Add Row >> Item 0 = comgooglemaps



struct ContentView: View {
    var body: some View {
        Button("Open Maps") {
            let latitude = 7.065
            let longitude = 124.6
            
            // starts with comgooglemaps instead of HTTPS
            let url = URL(string: "comgooglemaps://?saddr=&daddr=\(latitude),\(longitude)&directionsmode=driving")
            
            if UIApplication.shared.canOpenURL(url!) {
                UIApplication.shared.open(url!, options: [:], completionHandler: nil)
            } else {
                // user does not have google maps installed
                let newUrl = URL(string: "https://www.google.co.in/maps/dir/??saddr=\(latitude),\(longitude)&directionsmode=driving")
                print("Opening newURL")
                let superNewUrl = URL(string: "https://www.google.com/maps/place/QUINCE+COFFEE+HOUSE/@39.7390323,-104.9038455")
                if UIApplication.shared.canOpenURL(superNewUrl!) {
                    UIApplication.shared.open(superNewUrl!, options: [:], completionHandler: nil)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
