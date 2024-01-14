//
//  MapView.swift
//  Africa
//
//  Created by Toheed Jahan Khan on 11/01/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: - PROPERTIES
    
    @State private var region: MKCoordinateRegion = {
    var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
    var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
    var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
    
    return mapRegion
  }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    //MARK: - BODY

    var body: some View {
        // MARK: - 1. Basic Map
//        Map(coordinateRegion: $region)
        
        // MARK: - 2. ADVANCED MAP
        /*
         When we add an annotation to our map, then we have to provide some kind of content as well.
         Mapping.
         As for map annotations, Apple's Mapkit framework provides us multiple options that we can choose from.
         */
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            // (A) PIN: OLD STYLE (always static)
            MapPin(coordinate: item.location, tint: .accentColor)
        }) //: MAP
    }
}

//MARK: PREVIEW

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView().previewDevice("iPhone 12 Pro")
    }
}
