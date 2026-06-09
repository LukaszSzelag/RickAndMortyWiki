//
//  CharacterDetailsView.swift
//  RickAndMortyWiki
//
//  Created by Łukasz Szeląg on 05/06/2026.
//

import SwiftUI

struct CharacterDetailsView: View {
    private let dependencies: AppDependencies
    @State private var viewModel: CharacterDetailsViewModel
    
    init(dependencies: AppDependencies, character: Character) {
        self.dependencies = dependencies
        self._viewModel = State(initialValue: CharacterDetailsViewModel(favoriteCharactersRepository: dependencies.favoriteCharactersRepository, character: character))
    }
    
    var body: some View {
        ZStack {
            Color.primaryBackground.ignoresSafeArea()
            List {
                Section {
                    characterCard
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                        .padding(.horizontal)
                }
                
                Section("character.episodes") {
                    ForEach(viewModel.character.episodeIDs, id: \.self) { id in
                        NavigationLink(
                            destination: EpisodeDetailsView(dependencies: dependencies, episodeID: id)
                        ) {
                            Text("common.episode \(id)")
                        }
                    }
                    .listRowBackground(Color.primaryBackground)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle(viewModel.character.name)
        .task {
            await viewModel.loadFavoriteState()
        }
        .onAppear {
            Task {
                await viewModel.loadFavoriteState()
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    Task {
                        await viewModel.toggleFavorite()
                    }
                } label: {
                    Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                        .imageScale(.large)
                        .foregroundStyle(.red)
                        .symbolEffect(.bounce, value: viewModel.isFavorite)
                }
            }
        }
    }
    
    @ViewBuilder
    private var characterImage: some View {
        AsyncImage(url: viewModel.character.imageURL) { phase in
            switch phase {
            case .empty:
                ZStack {
                    Rectangle()
                        .fill(.secondaryBackground)
                    ProgressView()
                }
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure:
                ZStack {
                    Rectangle()
                        .fill(.secondaryBackground)
                    Image(systemName: "person.crop.circle.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.secondary)
                }
            @unknown default:
                EmptyView()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 300)
        .clipped()
    }
    
    @ViewBuilder
    private var characterCard: some View {
        VStack(spacing: 0) {
            characterImage
            
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("character.species")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                        InfoBadge(text: viewModel.character.species, style: .secondary.opacity(0.7))
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("character.status")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                        InfoBadge(text: viewModel.character.status.displayTitle, style: viewModel.character.status.displayStyle.opacity(0.7))
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("character.gender")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                        InfoBadge(text: viewModel.character.gender.displayTitle, style: viewModel.character.gender.displayStyle.opacity(0.7))
                    }
                    Spacer()
                    
                }
                
                VStack(alignment: .leading) {
                    Text("character.origin")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    Text(viewModel.character.originName)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .minimumScaleFactor(0.8)
                }
                
                VStack(alignment: .leading) {
                    Text("character.location")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    Text(viewModel.character.locationName)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .minimumScaleFactor(0.8)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
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

#Preview("CharacterDetailsView - Dark Mode") {
    let dependencies = AppDependencies.mockSuccess()
    NavigationStack {
        CharacterDetailsView(dependencies: dependencies, character: .mockRick)
            .preferredColorScheme(.dark)
    }
}

#Preview("CharacterDetailsView - Lght Mode") {
    let dependencies = AppDependencies.mockSuccess()
    NavigationStack {
        CharacterDetailsView(dependencies: dependencies, character: .mockRick)
            .preferredColorScheme(.light)
    }
}
