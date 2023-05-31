//
//  DiaryViewModel.swift
//  Gato
//
//  Created by user on 2023/05/31.
//

import Foundation
import Combine

import Foundation
import Combine

class DiaryViewModel: ObservableObject {
    @Published var entries: [DiaryEntry] = []

    func addEntry(date: Date, content: String) {
        let newEntry = DiaryEntry(date: date, content: content)
        entries.append(newEntry)
    }

    func deleteEntry(at index: Int) {
        entries.remove(at: index)
    }
}
