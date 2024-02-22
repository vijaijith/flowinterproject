import FungibleToken from 0x05
import abc from 0x05

transaction() {

    let userVault: &abc.Vault{FungibleToken.Balance, FungibleToken.Provider, FungibleToken.Receiver, abc.CollectionPublic}?
    let account: AuthAccount

    prepare(acct: AuthAccount) {


        self.userVault = acct.getCapability(/public/Vault)
            .borrow<&abc.Vault{FungibleToken.Balance, FungibleToken.Provider, FungibleToken.Receiver, abc.CollectionPublic}>()

        self.account = acct
    }

    execute {
        if self.userVault == nil {

            let emptyVault <- abc.createEmptyVault()
            self.account.save(<-emptyVault, to: /storage/VaultStorage)
            self.account.link<&abc.Vault{FungibleToken.Balance, FungibleToken.Provider, FungibleToken.Receiver, abc.CollectionPublic}>(/public/Vault, target: /storage/VaultStorage)
            log("Empty vault created and linked")
        } else {
            log("Vault already exists and is properly linked")
        }
    }
}
