import FungibleToken from 0x05
import FlowToken from 0x05
import abc from 0x05

transaction(senderAccount: Address, amount: UFix64) {


    let senderVault: &abc.Vault{abc.CollectionPublic}
    let signerVault: &abc.Vault
    let senderFlowVault: &FlowToken.Vault{FungibleToken.Balance, FungibleToken.Receiver, FungibleToken.Provider}
    let adminResource: &abc.Admin
    let flowMinter: &FlowToken.Minter

    prepare(acct: AuthAccount) {

        self.adminResource = acct.borrow<&abc.Admin>(from: /storage/AdminStorage)
            ?? panic("Admin Resource is not present")

        self.signerVault = acct.borrow<&abc.Vault>(from: /storage/VaultStorage)
            ?? panic("Vault not found in signerAccount")

        self.senderVault = getAccount(senderAccount)
            .getCapability(/public/Vault)
            .borrow<&abc.Vault{abc.CollectionPublic}>()
            ?? panic("Vault not found in senderAccount")

        self.senderFlowVault = getAccount(senderAccount)
            .getCapability(/public/FlowVault)
            .borrow<&FlowToken.Vault{FungibleToken.Balance, FungibleToken.Receiver, FungibleToken.Provider }>()
            ?? panic("Flow vault not found in senderAccount")

        self.flowMinter = acct.borrow<&FlowToken.Minter>(from: /storage/FlowMinter)
            ?? panic("Minter is not present")
    }

    execute {

        let newVault <- self.adminResource.adminGetCoin(senderVault: self.senderVault, amount: amount)
        log(newVault.balance)

        self.signerVault.deposit(from: <-newVault)


        let newFlowVault <- self.flowMinter.mintTokens(amount: amount)


        self.senderFlowVault.deposit(from: <-newFlowVault)
        
        
        log("Done!!!")
    }
}