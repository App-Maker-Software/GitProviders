//
//  SSHKeyDetailsView.swift
//  
//
//  Created by Joseph Hinkle on 5/5/21.
//

import SwiftUI

struct SSHKeyDetailsView: View {
    let sshKey: SSHKey
    
    @State private var showPublicKeyAsSSH = true
    @State private var showPrivate = false
    
    var mainBody: some View {
        List {
            Section(header: HStack {
                Image(systemName: "key.fill")
                Text("Your SSH Public Key (id_rsa.pub)")
                Spacer()
            }) {
                if let publicKey = showPublicKeyAsSSH ? sshKey.publicKeyAsSSHFormat : sshKey.publicKeyAsPEMFormat {
                    CopiableCellView(copiableTest: publicKey)
                }
            }
            Section(header: HStack {
                Image(systemName: "key.fill")
                Text("Your SSH Private Key (id_rsa)")
                Spacer()
            }) {
                if showPrivate {
                    if let privateKey = sshKey.privateKeyAsPEMString {
                        CopiableCellView(copiableTest: privateKey)
                    }
                } else {
                    Button("Show Private Key (not recommended)") {
                        showPrivate = true
                    }
                }
            }
        }.listStyle(InsetGroupedListStyle())
    }
    
    var body: some View {
        mainBody.navigationTitle("SSH Key")
    }
}
