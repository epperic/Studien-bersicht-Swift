//
//  HomeView.swift
//  Studienuebersicht
//
//  Created by Eric Epp on 19.05.21.
//

import SwiftUI

struct HomeView: View {
    var body: some View{
        NavigationView{
            ZStack{
                Image("Stundenplan")
                    .resizable()
            }.navigationTitle("Stundenplan")
            
        }
    }
}
