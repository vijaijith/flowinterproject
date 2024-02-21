import FungibleToken from 0x05
import FlowToken from 0x05

transaction(receiver: Address, amount: UFix64) {

    prepare(signer: AuthAccount) {

        let minter = signer.borrow<&FlowToken.Minter>(from: /storage/FlowMinter)
            ?? panic("You are not the stackToken minter")
        

        let receiverVault = getAccount(receiver)
            .getCapability<&FlowToken.Vault{FungibleToken.Receiver}>(/public/FlowVault)
            .borrow()
            ?? panic("Error: Check your FlowToken Vault status")
        

        let mintedTokens <- minter.mintTokens(amount: amount)


        receiverVault.deposit(from: <-mintedTokens)
    }

    execute {
        log("stackToken minted and deposited successfully")
        log("Tokens minted and deposited: ".concat(amount.toString()))
    }
}