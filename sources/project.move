module MyModule::MusicNFT {
    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    /// Struct representing a music NFT sale listing.
    struct MusicNFT has store, key {
        price: u64,       // Price of the NFT
        creator: address, // Creator of the NFT
        owner: address,   // Current owner of the NFT
    }

    /// Function to list a music NFT for sale.
    public fun list_music_nft(creator: &signer, price: u64) {
        let creator_addr = signer::address_of(creator);
        move_to(creator, MusicNFT { price, creator: creator_addr, owner: creator_addr });
    }

    /// Function to purchase the music NFT, transferring royalties to the creator.
    public fun purchase_music_nft(buyer: &signer, creator: address, amount: u64) acquires MusicNFT {
        let nft = borrow_global_mut<MusicNFT>(creator);
        assert!(amount >= nft.price, 1);

        // Transfer payment to the creator
        let payment = coin::withdraw<AptosCoin>(buyer, amount);
        coin::deposit<AptosCoin>(nft.creator, payment);

        // Update ownership of the NFT
        nft.owner = signer::address_of(buyer);
    }
}
