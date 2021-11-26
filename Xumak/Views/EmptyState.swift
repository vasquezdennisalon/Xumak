//
//  EmptyState.swift
//  Xumak
//
//  Created by Denis Vásquez on 25/11/21.
//

import SwiftUI

struct EmptyStateView: View {
    var state: String
    init(withState state:String) {
        self.state = state
    }

    var body: some View {
        Text(self.state)
            .padding()
    }
}
