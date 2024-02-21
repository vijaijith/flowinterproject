import FungibleToken from 0x05
import FlowToken from 0x05

transaction(receiverAccount: Address, amount: UFix64) {


    let signerVault: &FlowToken.Vault
    let receiverVault: &FlowToken.Vault{FungibleToken.Receiver}

    prepare(acct: AuthAccount) {

        self.signerVault = acct.borrow<&FlowToken.Vault>(from: /storage/FlowVault)
            ?? panic("Vault not found in senderAccount")

        self.receiverVault = getAccount(receiverAccount)
            .getCapability(/public/FlowVault)
            .borrow<&FlowToken.Vault{FungibleToken.Receiver}>()
            ?? panic("Vault not found in receiverAccount")
    }

    execute {

        self.receiverVault.deposit(from: <-self.signerVault.withdraw(amount: amount))
        log("Tokens transferred")
    }
}