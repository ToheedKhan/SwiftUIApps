//
//  InsetMapView.swift
//  Africa
//
//  Created by Toheed Jahan Khan on 12/01/24.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
  // MARK: - PROPERTIES
  /*
   @State property wrapper to this region variable.
   It's a mandatory requirement.
   
   If we want to create a map view with swift UI.
   The reasoning behind it is that maps are using bindings to keep track of any changes that may occur
   in maps region such as route tracking, panning, spinning or zooming in or out.
   Next, when we declare a region, then we must provide at least two additional pieces of information
   about how the map should work.
   The first information is a map coordinate that contains the data of the latitude and longitude.
   In our case, this precise location is the center of the Africa continent.
   
   Then the second information that this map must know is the zoom level.
   Then smaller is the value of span, then higher is the zoom level.
   In our case, the span values are quite big.
   Therefore, the map is zoomed out up to the point where we can see the whole Africa continent.
   */
  @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))

  // MARK: - BODY
    var body: some View {
        /*
         Since the map's region could be changed any time, Therefore, we must use bindings to keep track of
         any changes using the @State property wrapper.
         */
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink(destination: MapView()) {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundColor(Color.white)
                            .imageScale(.large)
                        
                        Text("Locations")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    } //: HSTACK
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(
                        Color.black.opacity(0.4)
                            .cornerRadius(8)
                    )
                } //: NAVIGATION
                .padding(12)
                , alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(12)
    }
}


// MARK: - PREVIEW

struct InsetMapView_Previews: PreviewProvider {
  static var previews: some View {
    InsetMapView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
