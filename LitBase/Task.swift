//
//  Task.swift
//  LitDatabase
//
//  Created by Sandro Dinklang on 5/21/21.

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Task: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var subtitle: String
    var people: Int
    var completed: Bool
    @ServerTimestamp var creationTime: Timestamp?
}

// List that with dummy information
let homeTasks = [
    Task(title: "First",
         subtitle: "School",
         people: 4,
         completed: true),
    Task(title: "Second",
         subtitle: "Work",
         people: 3,
         completed: false),
    Task(title: "Third",
         subtitle: "Friends",
         people: 6,
         completed: true),
    Task(title: "Fourth",
         subtitle: "Study session",
         people: 1,
         completed: false)
]
