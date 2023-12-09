//
//  ReserveTab.swift
//  The5amClub
//
//  Created by Rhymetech on 23/12/22.
//

import SwiftUI
import CoreLocation

// MARK: - Reserve Tab View

struct ReserveTab: View {
    @EnvironmentObject var sessionVM: SessionViewModelImpl
    
    @StateObject private var mapVM = MapViewModelImpl()
    
    @State private var locationManager = CLLocationManager()
    @State private var showBottomSheet = false
    @State private var selectedPlace: Place?
    
    var body: some View {
        ZStack {
            // map view
            MapView(mapVM: mapVM)
                .ignoresSafeArea(.all, edges: .all)

            VStack {
                VStack(spacing: 0) {
                    // search bar
                    SearchBar(searchText: $mapVM.searchText)
                    
                    // search results
                    if !mapVM.places.isEmpty && !mapVM.searchText.isBlank {
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 0) {
                                ForEach(mapVM.places) { place in
                                    SearchResultView(place: place)
                                        .onTapGesture {
                                            mapVM.selectPlace(place: place)
                                            selectedPlace = place
                                            showBottomSheet = true
                                        }

                                    if (mapVM.places.last != nil) == true {
                                        Divider()
                                    }
                                }
                            }
                            .background()
                        }
                    }
                }
                .padding()

                Spacer()

                VStack(spacing: 16) {
                    // location focus button
                    Button {
                        // focus location
                        mapVM.focusLocation()
                    } label: {
                        Image(systemName: StaticImage.location)
                            .font(.title2)
                            .padding(10)
                            .foregroundColor(.blue)
                            .background(Color(StaticColor.black), in: Circle())
                    }

                    // maptype button
                    Button {
                        // update maptype
                        mapVM.updateMapType()
                    } label: {
                        Image(systemName: mapVM.mapType == .standard ? StaticImage.network : StaticImage.map)
                            .font(.title2)
                            .padding(10)
                            .foregroundColor(.blue)
                            .background(Color(StaticColor.black), in: Circle())
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()

                if showBottomSheet {
                    ReserveBottomSheet(showBottomSheet: $showBottomSheet, place: selectedPlace)
                }
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .onAppear {
            // setup location manager
            locationManager.delegate = mapVM
            locationManager.requestWhenInUseAuthorization()
        }
        .alert(StaticText.permissionDenied, isPresented: $mapVM.permissionDenied) {
            Button(StaticText.goToSettings, role: .cancel) {
                // redirect to app settings
                if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(settingsUrl)
                }
            }
        } message: {
            // error message
            Text(StaticText.enablePermission)
        }
        .onChange(of: mapVM.searchText) { newValue in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                if newValue == mapVM.searchText {
                    mapVM.searchQuery()
                }
            }
        }
    }
}

struct ReserveTab_Previews: PreviewProvider {
    static var previews: some View {
        ReserveTab()
            .environmentObject(SessionViewModelImpl())
    }
}
