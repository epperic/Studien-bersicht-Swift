//
//  FirebaseAPI.swift
//  Studienuebersicht
//
//  Created by Eric Epp on 05.06.21.
//

import Foundation
import FirebaseFirestore

class FirebaseAPI{
    
    let dbCollection = Firestore.firestore().collection("modul")
    
    func fetchData(completion: @escaping (Swift.Result<[ModulViewModel], Error>) -> Void){
        dbCollection.getDocuments() { (querySnapshot, err) in
            if let err = err {
                completion(Swift.Result.failure(err))
            } else {
                var items: [ModulViewModel] = []
                for document in querySnapshot!.documents {
                    let data = document.data()
                    items.append(ModulViewModel(Id: document.documentID.description, Modulname: data["name"] as! String, Professor: data["professor"] as! String, ECTS: data["ects"] as! Int, Note: data["note"] as! Double, Semester: data["semester"] as! Int))
                }
                completion(Swift.Result.success(items.sorted(by: {$0.Semester < $1.Semester })))
            }
        }
    }
    func saveData(apiObj: FirestoreModel, completion: @escaping (Swift.Result<String, Error>) -> Void){
        let collection = Firestore.firestore().collection("modul")
        if apiObj.documentID == "" {
            collection.addDocument(data: apiObj.dictionary){
                err in
                if let err = err {
                    completion(Swift.Result.failure(err))
                } else {
                    completion(Swift.Result.success("Document successfully added!"))
                }
            }
        } else {
            collection.document(apiObj.documentID!).setData(apiObj.dictionary) {
                err in
                if let err = err {
                    completion(Swift.Result.failure(err))
                } else {
                    completion(Swift.Result.success("Document successfully overwritten!"))
                }
            }
        }
    }
    
    func deleteData(documentID: String, completion: @escaping (Swift.Result<String, Error>) -> Void){
        let collection = Firestore.firestore().collection("modul")
        collection.document(documentID).delete() {
            err in
            if let err = err {
                completion(Swift.Result.failure(err))
            } else {
                completion(Swift.Result.success("Document successfully deleted!"))
            }
        }
    }
}
