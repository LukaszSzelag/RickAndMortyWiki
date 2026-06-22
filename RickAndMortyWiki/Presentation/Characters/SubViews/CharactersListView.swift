//
//  CharactersListView.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 18/06/2026.
//

import SwiftUI

struct CharactersListView: View {
    
    var viewModel: CharactersViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            header
            listContent
        }
        .task {
            await viewModel.loadInitialPage()
        }
    }
    
    @ViewBuilder
    private var header: some View {
        Text("All characters")
            .font(.title3)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.bottom, .horizontal])
        RoundedRectangle(cornerRadius: 12)
            .fill(.appTeal)
            .frame(height: 3)
            .shadow(color: .appGreen, radius: 3)
            .padding(.horizontal, 12)
    }
    
    @ViewBuilder
    private var listContent: some View {
        switch viewModel.viewState {
        case .idle, .loading:
            ProgressView()
        case .empty:
            VStack {
                ContentUnavailableView {
                    Label("No characters found.", systemImage: "person")
                } description: {
                    Text("Could not find characters")
                } actions: {
                    Button {
                        Task {
                            await viewModel.refresh()
                        }
                    } label: {
                        Text("Try again")
                            .foregroundStyle(.primary)
                            .padding(.vertical, 8)
                            .padding(.horizontal)
                            .background {
                                Capsule()
                                    .fill(.appTeal)
                                    .shadow(color: .appGreen, radius: 3)
                            }
                    }
                    .buttonStyle(.plain)
                }
            }
        case .loaded:
            GeometryReader { proxy in
                let listMaxY = proxy.frame(in: .global).maxY
                
                List(viewModel.characters) { character in
                    NavigationLink(destination: Text(character.name)) {
                        CharactersListRowView(character: character, isFavorite: viewModel.checkIfFavorite(characterID: character.id))
                            .visualEffect { content, proxy in
                                content
                                    .scaleEffect(scale(for: proxy, screenHeight: listMaxY))
                            }
                            .task {
                                await viewModel.loadNextPage(currentCharacter: character)
                            }
                            .swipeActions {
                                Button {
                                    Task {
                                        await viewModel.toggleFavorite(characterID: character.id)
                                    }
                                } label: {
                                    Image(systemName: viewModel.checkIfFavorite(characterID: character.id) ? "heart" : "heart.fill")
                                        .foregroundStyle(.red)
                                }
                                .tint(.red)
                            }
                    }
                }
                .listStyle(.plain)
                .foregroundStyle(.primary)
            }
        case .error(let errorDescription):
            Text("Error: \(errorDescription)")
        }
    }
}

#Preview {
    let dependencies = AppDependencies.production()
    let characterRepository = dependencies.characterRepository
    let favoritesRepository = dependencies.favoritesRepository
    
    NavigationStack {
        CharactersListView(viewModel: .init(characterRepository: characterRepository, favoritesRepository: favoritesRepository))
            .preferredColorScheme(.dark)
    }
}

func scale(for proxy: GeometryProxy, screenHeight: CGFloat) -> CGFloat {
    
    let frame = proxy.frame(in: .scrollView)

    let minY = frame.minY
    let maxY = frame.maxY

    if minY < 0 {
        return max(0.8, 1 + minY / 500)
    } else if maxY > screenHeight {
        return max(0.8, 1 + (screenHeight - maxY) / 500)
    } else {
        return 1
    }
}
