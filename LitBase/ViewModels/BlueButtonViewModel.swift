//
//  SecondViewModel.swift
//  LitDatabase
//
//  Created by Sandro Dinklang on 5/23/21.
//

import Foundation
import Combine

class BlueButtonViewModel: ObservableObject, Identifiable {
    @Published var taskRepository = TaskRepository()
    @Published var task: Task
    
    var id = ""
    
    private var toCancel = Set<AnyCancellable>()
    
    init(task: Task) {
        self.task = task
    
        $task
            .compactMap { task in
                task.id
            }
            .assign(to: \.id, on: self)
            .store(in: &toCancel)
        
        // This updates task.
        $task
            .dropFirst()
            .debounce(for: 0.8, scheduler: RunLoop.main)  // Update Task 0.8 seconds after editing
            .sink { task in
                self.taskRepository.updateTask(task)
            }
            .store(in: &toCancel)
    }
}
