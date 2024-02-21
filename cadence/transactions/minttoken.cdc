import FungibleToken from 0x05
import  abc from 0x05

transaction(receiver: Address, amount: UFix64) {

    prepare(signer: AuthAccount) {

        let minter = signer.borrow<&abc.Minter>(from: /storage/MinterStorage)
            ?? panic("You are not the stackToken minter")


        let receiverVault = getAccount(receiver)
            .getCapability<&abc.Vault{FungibleToken.Receiver}>(/public/Vault)
            .borrow()
            ?? panic("Error: Check your stackToken Vault status")


        let mintedTokens <- minter.mintToken(amount: amount)


        receiverVault.deposit(from: <-mintedTokens)
    }

    execute {
        log("stackToken minted and deposited successfully")
        log("Tokens minted and deposited: ".concat(amount.toString()))
    }
}