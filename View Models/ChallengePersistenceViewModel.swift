//
//  ChallengePersistenceViewModel.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/2/24.
//

import Foundation

class ChallengePersistenceViewModel: ObservableObject {
    @Published var challengeData: [String: ChallengePersistentData] = [:] {
        didSet {
            save()
        }
    }
    
    init() {
        load()
    }
    
    func retrieveChallenge(_ challenge: Challenge) -> ChallengePersistentData {
        challengeData[challenge.feature] ?? ChallengePersistentData(challenge, unlockedHints: 0)
    }
    
    func getArchiveURL() -> URL {
        let plistName = "challengedata.json"
        
        return URL.documentsDirectory.appendingPathComponent(plistName)
    }
    
    func nuke() {
        challengeData = [:]
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        
        let jsonEncoder = JSONEncoder()
        let encodedChallengeData = try? jsonEncoder.encode(challengeData)
        
        try? encodedChallengeData?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let jsonDecoder = JSONDecoder()
        
        if let retrievedChallengeData = try? Data(contentsOf: archiveURL),
           let decodedChallengeData = try? jsonDecoder.decode([String: ChallengePersistentData].self,
                                                              from: retrievedChallengeData) {
            self.challengeData = decodedChallengeData
        }
    }
}
