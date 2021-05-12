//
//  RepoModel.swift
//  
//
//  Created by Joseph Hinkle on 5/12/21.
//

struct RepoModel: InternalModel {
    let name: String
    let httpsURL: String
    let sshURL: String
    let isPrivate: Bool
}