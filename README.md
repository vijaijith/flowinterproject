# Flow Fungible Token Project Hub

Welcome to the Flow Fungible Token Project's central repository. This initiative is dedicated to crafting a detailed Fungible Token smart contract on the Flow blockchain ecosystem. The repository is organized into various sections, featuring a rich collection of scripts and transactions tailored for an array of token-related activities and management procedures.

## Principal Contract Deployment

### Contract: FlowToken
- Introduces an owner-managed minting mechanism.
- Employs a Vault resource to oversee token balances.
- Provides an extensive array of transactions and scripts for comprehensive token oversight.

#### Insight into the Code:
- Highlights the secure deposit functionality within the Vault resource to ensure safe token transfers and eliminate the risk of double-spending.

### Essential Transactions and Scripts

#### Transactions:
- **MINT:** Authorizes the creation of tokens for specified beneficiaries.
- **SETUP:** Facilitates the initial configuration of a user's vault within their account storage.
- **TRANSFER:** Allows for the seamless movement of tokens across different accounts.

#### Scripts:
- **READ BALANCE:** Extracts the balance of tokens from a user’s vault.
- **SETUP VALIDATION:** Verifies the correct configuration of a vault.
- **TOTAL SUPPLY CHECK:** Calculates the total tokens in circulation.

### Enhancements to Transactions and Scripts
- Refines the SETUP transaction to correct vaults that were incorrectly configured.
- Upgrades the READ BALANCE script to accommodate vaults with unique configurations.

### Distinctive Features
- Implements resource identifiers to ascertain token types.
- Deploys resource capabilities to authenticate the legitimacy of vaults.

## Enhancement of Contract and Transactions

### Administrative Functions
- Enables administrators to extract tokens from user vaults and replace them with an equivalent amount of $FLOW tokens.

### Addition of New Transaction
- **Admin Withdraw and Deposit:** A specialized transaction reserved for administrative token operations.

## Sophisticated Scripting

### Scripts
- **BALANCE SUMMARY:** Provides a consolidated view of a user’s $FLOW and custom token balances.
- **VAULT OVERVIEW:** Delivers a comprehensive examination of all recognized Fungible Token vaults within a user’s storage.

## Integration with Swap Contract

### Swap Contract
- Permits the conversion of $FLOW tokens into custom tokens, with conversion rates influenced by the period since the last exchange.

### Mechanics of the Swap
- Employs a distinctive identity resource along with the user’s $FLOW vault reference to authenticate the user’s identity and guarantee secure token exchanges.

## Conclusion of the Project
The repository showcases an elaborate implementation of a Fungible Token contract on the Flow blockchain, methodically detailing functionalities for minting tokens, setting up vaults, transferring tokens, and conducting swaps. It aims to provide clear guidance and streamline navigation through its comprehensive features.
