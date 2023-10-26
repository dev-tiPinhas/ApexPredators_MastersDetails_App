//
//  ContentView.swift
//  ApexPredators_MastersDetails_App
//
//  Created by Tiago Pinheiro on 24/10/2023.
//

import SwiftUI

struct ContentView: View {
    let apController = PredatorController()
    // Sort
    @State var sortAlphabetical = false
    
    // Filter
    @State var currentFilter = "All"
    @State var currentFilterMovie = "None"
    
    // Search
    @State var searchText = ""
    @State var SearchIsActive = false
    
    var body: some View {
        // Filter by Type
        apController.filterBy(type: currentFilter)
        
        // Filter by movie
        apController.filterBy(movie: currentFilterMovie)
        
        if sortAlphabetical {
            apController.sortbyAlphabetical()
        } else {
            apController.sortByMovieAppearence()
        }
        
        return NavigationView {
            List {
                ForEach(searchResults) { predator in
                    NavigationLink(destination: PredatorDetail(predator: predator)) {
                        PredatorRow(predator: predator)
                    }
                }
            }
            .navigationTitle("Apex Predators")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        withAnimation {
                            sortAlphabetical.toggle()
                        }
                    } label : {
                        sortAlphabetical
                            ? Image(systemName: "film")
                                .foregroundStyle(.white)
                            : Image(systemName: "textformat")
                                .foregroundStyle(.white)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $currentFilter.animation()) {
                            ForEach(apController.typeFilters, id: \.self) { type in
                                HStack {
                                    Text(type)
                                    
                                    Spacer()
                                    
                                    Image(systemName: apController.typeIcon(for: type))
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundStyle(.white)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $currentFilterMovie.animation()) {
                            ForEach(apController.typeFilterByMovies, id: \.self) { type in
                                Text(type)
                            }
                        }
                    } label: {
                        Image(systemName: "play.square.stack")
                            .foregroundStyle(.white)
                    }
                }
            }
        }
        .searchable(text: $searchText, isPresented: $SearchIsActive, prompt: "Search")
    }
    
    var searchResults: [ApexPredator] {
        if searchText.isEmpty {
            return apController.apexPredators
        } else {
            return apController.apexPredators.filter { $0.name.contains(searchText) }
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
