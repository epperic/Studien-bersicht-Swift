//
//  CollectionViewModel.swift
//  Studienuebersicht
//
//  Created by Eric Epp on 25.05.21.
//

import Foundation

class CollectionViewModel : ObservableObject{
    @Published var module: [ModulViewModel] = []
    @Published var splitsemestermodule: [[ModulViewModel]] = []
    
    func splitSemesters(){
        splitsemestermodule = Array(Dictionary(grouping: module){$0.Semester}.values)
        splitsemestermodule.sort(by: {$0[0].Semester < $1[0].Semester })
    }
    
    public func calcECTS() -> Int {
        var collectedECTS = 0
        module.forEach {
            if $0.Note != 0.0 {
                collectedECTS += $0.ECTS
            }
        }
        return collectedECTS
    }
    
    public func calcAvgNote(modulliste: [ModulViewModel]) -> Double {
        var sum : Double = 0
        var count = 0
        modulliste.forEach{
            if $0.Note != 0.0 {
                sum += $0.Note
                count += 1
            }
        }
        return sum/Double(count)
    }
}
