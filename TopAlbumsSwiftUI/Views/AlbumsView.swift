//
//  AlbumsView.swift
//  TopAlbumsSwiftUI
//
//  Created by Scott Carter on 7/26/20.
//  Copyright © 2020 Scott Carter. All rights reserved.
//

import SwiftUI

struct AlbumsView: View {

    @ObservedObject var viewModel: AlbumsViewModel

    init(viewModel: AlbumsViewModel) {
        self.viewModel = viewModel

        UINavigationBar.appearance().backgroundColor = UIColor.systemBackground
        UITableView.appearance().backgroundColor = UIColor.systemBackground
    }

    var body: some View {
        NavigationView {
            List {
                if viewModel.dataSource.isEmpty {
                    emptySection
                } else {
                    albumRows
                }
            }
                .listStyle(GroupedListStyle()) // Empty list shows only 1 row
                .navigationBarTitle("Top Albums")
        }

    }
}

private extension AlbumsView {
    var emptySection: some View {
        Text("No results")
            .foregroundColor(.gray)
    }
    
    var albumRows: some View {
        ForEach(viewModel.dataSource, content: AlbumsRowView.init(viewModel:))
    }
}

struct AlbumsView_Previews: PreviewProvider {
    static var previews: some View {
        Text("No current preview")
    }
}
