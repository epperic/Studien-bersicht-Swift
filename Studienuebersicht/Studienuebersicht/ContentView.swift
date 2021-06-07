//
//  ContentView.swift
//  Studienuebersicht
//
//  Created by Eric Epp on 19.05.21.
//

import SwiftUI

struct ContentView: View {
    
    var collectionViewModel = CollectionViewModel()
    
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            SemesterView()
                .environmentObject(collectionViewModel)
                .tabItem {
                    Image(systemName: "list.number")
                    Text("Semester")
                }
            LeistungenView()
                .environmentObject(collectionViewModel)
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Leistungen")
                }
            ToDoView()
                .environmentObject(collectionViewModel)
                .tabItem {
                    Image(systemName: "text.badge.plus")
                    Text("To-Do")
                }
        }.onAppear{
            loadData()
        }
    }
    
    func loadData(){
        let api = FirebaseAPI()
        api.fetchData(completion: {
            switch $0 {
            case let .success(items):
                collectionViewModel.module = items
                splitsemesters()
            case let .failure(error): debugPrint(error)
            }
        })
    }
    
    private func splitsemesters(){
        collectionViewModel.splitSemesters()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
