//
//  CollectionViewModel.swift
//  Studienuebersicht
//
//  Created by Eric Epp on 25.05.21.
//

import Foundation

class CollectionViewModel : ObservableObject{
    @Published var module: [ModulViewModel] = []
}
