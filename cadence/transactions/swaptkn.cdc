import SwapToken from 0x05

transaction(amount: UFix64) {


    let signer: AuthAccount

    prepare(acct: AuthAccount) {
        self.signer = acct
    }

    execute {

        SwapToken.swapTokens(signer: self.signer, swapAmount: amount)
        log("Swap done")
    }
}