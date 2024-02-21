import FungibleToken from 0x05
import abc from 0x05

pub fun main(account: Address) {

    let publicVault: &abc.Vault{FungibleToken.Balance, FungibleToken.Receiver, abc.CollectionPublic}? =
        getAccount(account).getCapability(/public/Vault)
            .borrow<&abc.Vault{FungibleToken.Balance, FungibleToken.Receiver, abc.CollectionPublic}>()

    if (publicVault == nil) {

        let newVault <- abc.createEmptyVault()
        getAuthAccount(account).save(<-newVault, to: /storage/VaultStorage)
        getAuthAccount(account).link<&abc.Vault{FungibleToken.Balance, FungibleToken.Receiver, abc.CollectionPublic}>(
            /public/Vault,
            target: /storage/VaultStorage
        )
        log("Empty vault created")
        

        let retrievedVault: &abc.Vault{FungibleToken.Balance}? =
            getAccount(account).getCapability(/public/Vault)
                .borrow<&abc.Vault{FungibleToken.Balance}>()
        log(retrievedVault?.balance)
    } else {
        log("Vault already exists and is properly linked")
        
        let checkVault: &abc.Vault{FungibleToken.Balance, FungibleToken.Receiver, abc.CollectionPublic} =
            getAccount(account).getCapability(/public/Vault)
                .borrow<&abc.Vault{FungibleToken.Balance, FungibleToken.Receiver, abc.CollectionPublic}>()
                ?? panic("Vault capability not found")
        

        if abc.vaults.contains(checkVault.uuid) {
            log(publicVault?.balance)
            log("This is a AlpToken vault")
        } else {
            log("This is not a AlpToken vault")
        }
    }
}