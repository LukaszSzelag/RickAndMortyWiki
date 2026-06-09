//
//  CharactersListView.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 04/06/2026.
//

import SwiftUI

struct CharactersListView: View {
    private let dependencies: AppDependencies
    
    @State private var viewModel: CharactersListViewModel
    
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
        self._viewModel = State(
            initialValue: CharactersListViewModel(
                characterRepository: dependencies.characterRepository,
                favoriteCharactersRepository: dependencies.favoriteCharactersRepository
            )
        )
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.primaryBackground.ignoresSafeArea()
                content
            }
            .task {
                await viewModel.loadInitialPageIfNeeded()
            }
            .searchable(text: $viewModel.searchText)
            .onSubmit(of: .search) {
                Task {
                    await viewModel.search()
                }
            }
            .refreshable {
                await viewModel.refresh()
            }
            .onChange(of: viewModel.searchText) { oldValue, newValue in
                Task {
                    await viewModel.searchTextChanged(from: oldValue, to: newValue)
                }
            }
            .onAppear {
                Task {
                    await viewModel.refreshFavorites()
                }
            }
            .navigationTitle("characters.title")
            .toolbar {
                if #available(iOS 26.0, *) {
                    ToolbarItem(placement: .topBarLeading) {
                        Logo()
                    }
                    .sharedBackgroundVisibility(.hidden)
                } else {
                    ToolbarItem(placement: .topBarLeading) {
                        Logo()
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .idle, .loading:
            ProgressView("characters.progress_view_message")
        case .empty:
            ContentUnavailableView {
                Label("characters.empty.title", systemImage: "magnifyingglass")
            } description: {
                Text("characters.empty.description")
            }
        case .loaded:
            List(viewModel.displayedCharacters) { character in
                NavigationLink(destination: CharacterDetailsView(dependencies: dependencies, character: character)) {
                    CharactersListRowView(character: character, isFavorite: viewModel.isFavorite(character))
                }
                .listRowBackground(Color.primaryBackground)
                .task {
                    await viewModel.loadNextPageIfNeeded(currentCharacter: character)
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                    Button {
                        Task {
                            await viewModel.toggleFavorite(id: character.id)
                        }
                    } label: {
                        Image(systemName: viewModel.isFavorite(character) ? "heart.slash" : "heart.fill")
                    }
                    .tint(.red)
                }
            }
            .listStyle(.plain)
            
        case .error(let error):
            ContentUnavailableView {
                Label("characters.error.title", systemImage: "exclamationmark.triangle")
            } description: {
                Text(LocalizedStringKey(error))
            } actions: {
                Button {
                    Task {
                        await viewModel.refresh()
                    }
                } label: {
                    Text("common.try_again")
                        .font(.headline)
                        .padding(8)
                }
                .buttonStyle(.borderedProminent)
                .tint(.appTint)
            }
        }
    }
}

#Preview("CharactersListView - Mock - Success") {
    let dependencies = AppDependencies.mockSuccess()
    CharactersListView(dependencies: dependencies)
}

#Preview("CharactersListView - Mock - Empty") {
    let dependencies = AppDependencies.mockEmpty()
    CharactersListView(dependencies: dependencies)
}

#Preview("CharactersListView - Mock - Failure") {
    let dependencies = AppDependencies.mockFailure()
    CharactersListView(dependencies: dependencies)
}
