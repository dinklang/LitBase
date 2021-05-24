//
//  ViewModel.swift
//  LitDatabase
//
//  Created by Sandro Dinklang on 5/22/21.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var taskRepository = TaskRepository()
    @Published var blueButtonViewModels = [BlueButtonViewModel]()
    
    private var toCancel = Set<AnyCancellable>()
    
    init() {
        taskRepository.$tasks.map { tasks in
            tasks.map { task in
                BlueButtonViewModel(task: task)
            }
        }
        .assign(to: \.blueButtonViewModels, on: self)
        .store(in: &toCancel)
        
    }
    
    // Adds task to the repository
    func addTask(task: Task) {
        taskRepository.addTask(task)
    }

}
