//
//  EpisodeDetailsView.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 07/06/2026.
//

import SwiftUI

struct EpisodeDetailsView: View {
    @State private var viewModel: EpisodeDetailsViewModel
    
    init(dependencies: AppDependencies, episodeID: Int) {
        self._viewModel = State(
            initialValue: EpisodeDetailsViewModel(
                characterRepository: dependencies.characterRepository,
                episodeRepository: dependencies.episodeRepository,
                favoriteCharactersRepository: dependencies.favoriteCharactersRepository,
                episodeID: episodeID
            )
        )
    }
    
    var body: some View {
        ZStack {
            Color.primaryBackground.ignoresSafeArea()
            content
        }
        .task {
            await viewModel.loadWhenAppeared()
        }
        .onAppear {
            Task {
                await viewModel.retry()
            }
        }
        .navigationTitle("episode.title \(viewModel.episodeID)")
    }
    
    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .idle, .loading:
            ProgressView("episode.progress_view_message")
        case .loaded(let episode, let characters):
            List {
                Section {
                    episodeHeader(episode)
                        .listRowBackground(Color.primaryBackground)
                        .listRowSeparator(.hidden)
                }
                Section("episode.cast") {
                    ForEach(characters) { character in
                        HStack {
                            if viewModel.isFavorite(character) {
                                Image(systemName: "heart.circle.fill")
                                    .font(.headline)
                                    .foregroundStyle(.red)
                            }
                            Text(character.name)
                                .font(.headline)
                                .foregroundStyle(.primary)
                        }
                    }
                    .listRowBackground(Color.primaryBackground)
                }
            }
            .listStyle(.plain)
        case .error(let error):
            ContentUnavailableView {
                Label("episode.error.title", systemImage: "exclamationmark.triangle")
            } description: {
                Text(LocalizedStringKey(error))
            } actions: {
                Button {
                    Task {
                        await viewModel.retry()
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
    
    private func episodeHeader(_ episode: Episode) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading) {
                Text("episode.name")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                Text(episode.name)
                    .font(.title)
                    .fontWeight(.bold)
            }
            VStack(alignment: .leading) {
                Text("episode.code")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                Text(episode.episodeCode)
                    .font(.headline)
                    .foregroundStyle(.primary)
            }
            Label(episode.airDate, systemImage: "calendar")
                .foregroundStyle(.primary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(LinearGradient(colors: [.secondaryBackground.opacity(0.9), .secondaryBackground], startPoint: .topLeading, endPoint: .bottomTrailing))
                .shadow(color: .appGreen, radius: 3, y: 2)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.appTeal.opacity(0.5), lineWidth: 2)
        }
    }
}

#Preview("EpisodeDetailsView - Success - Dark Mode") {
    let dependencies = AppDependencies.mockSuccess()
    EpisodeDetailsView(dependencies: dependencies, episodeID: 1)
        .preferredColorScheme(.dark)
}

#Preview("EpisodeDetailsView - Success - Light Mode") {
    let dependencies = AppDependencies.mockSuccess()
    EpisodeDetailsView(dependencies: dependencies, episodeID: 1)
        .preferredColorScheme(.dark)
}

#Preview("EpisodeDetailsView - Error") {
    let dependencies = AppDependencies.mockFailure()
    EpisodeDetailsView(dependencies: dependencies, episodeID: 1)
}
