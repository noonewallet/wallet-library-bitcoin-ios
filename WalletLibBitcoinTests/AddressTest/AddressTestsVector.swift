//
//  AddressTestsVector.swift
//  WalletLibBitcoinTests
//
//

import Foundation


struct BitcoinDerivationKeyAddressesTestVector {
    
    static let data: [(address: String, pubdata: String, wif: String)] =
    [
    (address: "1MdGMxicf2rSRL8e9y7gcjissvSbRtNN34", pubdata: "02a8ec177c7ebaaa6ef569c17068db1f7d2f90d4b95ec98b41db7135ed3f7d32f5", wif: "L1zb2an64Supr3FeBg53LEPg2Z7LBRop7jeDDiBquqWVvbTyhYme"),
    (address: "1JftzvuMQLSWkRbh3heMrYkfS63e5nCGs1", pubdata: "0292eb75add748706a4abf56b66b7a69beb5dbe5686f50ef96c22ed2a29b8bb7da", wif: "KxTnrbo7n2pgPL7jEfRMDiot8v5zdmkEdfn42uaUepvJVnQsbzat"),
    (address: "12uoA4vncvMKQZmHZTAouob667bgzySxvb", pubdata: "0385d9474a30c999ea69d8c8b23a65bbc4e1385b1d120b89505d2c6663c0e4cf17", wif: "L33JhaAvGcBDiZ8H5zh1HZDbmRGEWLuxHFhpaxHrTVSjJimGKzjT"),
    (address: "19B5JwXmHtCNxii4KTVzp7QDUpAAGAFEs6", pubdata:  "0207676761e337c0994947705b81d91446d5b76854ebc3ae123a14ec1bad9b1f2b", wif: "L2HhaC6CiisobU4dicMJP8dNaKVKUqxZCiWgeDiKL3k7kDroDy8L"),
    (address: "16hNoFw5cF5Xc1XPsmWYf1n13V4QdQPdMJ", pubdata:  "02ccaabb27eeab90de478e4530e202ea3a477244dbe82e1ff02c21382e13e3ba78", wif: "L1w9xBeSwr6vhqJ85xdb4ubvkP183UHKcgAzX5RkZNZdsV6VPWBP"),
    (address: "1CQmbsirVZ5CBKdzPQUm4BdCbRHLPkJwF6", pubdata: "022a921e07468a8c0743ebc0ae8b6000bd03e25a63fd92d41d170dee00d12d2b29", wif: "L3qi7tYq6rz78rqNb8DdPac8PZffwLVgV2LqMUUMfsoVjDJ68B9p"),
    (address: "15mJ12eqXkBnq7C3CXES5sVUsKfwoPEmRb", pubdata: "0305c5a4f879a3b21b598b517a3ce96786845139a70c2727f3d21cb2b386dbe712", wif: "Kzt9PdyfRs9S2sVi3b7X1jXU9n8Ymm416UFtVPZh7muvY3AvswT9"),
    (address: "148ZP6eRefxwhxZJ39p3iwwy2veJrA9DDt", pubdata: "03fc17d2c4a13d0a5718581ebd52dcd57cd500e2e9caee6bb4ed8195de8ac4b3d6", wif: "KxPXnppiqhN63mPi8vzYRcYE6RLsiBBGT4EPA4jo5HuFQ2z7THMT"),
    (address: "1DpEHZs5Zz2kyYWKdYe5WH6Wve13AJp7Cs", pubdata: "02f7a6f226130fdf5c498162e8cc28bc5323b13043ce2ebc62419eb6d7c313c142", wif: "KyrD9wDNHDYXtmdRfvWVZ9r9ZG2jUJSuNJWm8dT2EZD4DLZsoYGU"),
    (address: "19Tj4LuRE9ZKLfU8BV8ReT3BF9WuX92GDf", pubdata: "02a207ca5b5e7bbf7c433130c041111906dd10afd90832f4a47121dccb40d4e8ec", wif: "L4xnQfM5YkPVNV8rniZ2MJ8aysYxgNcCGm4J2KSKttY6gMFMnhsr"),
    (address: "1F8NaxRTcyvRBCSzX5CUvQLMTVc2VFQ9ys", pubdata: "02b438e75a5aab974a18528460d201fb4d4cb0849dea37747ba7023e8074aebef7", wif: "L3gQW5d2dV1duJ2tU33amobuQzKE5uFibR4pnQFJdRppjxpeVjEg"),
    (address: "1KZHYBswdSQhgxZmjnLQ6Rtz8bQQ5VaSvj", pubdata: "022e9fef9017c1496c8b39b2f1dd4826386326e0e39554f62a0c0f997675a5f273", wif: "L12FB3a4HAxR964Gua5h7Axz7Pnp2egothMpfsfKLCzvsgyszdzu"),
    (address: "14iAW6fibQxJhpdREPLw7fQ6zseZZU1u34", pubdata: "020ef8327a00f8f47953e9cccda5072520515cd21c0ae730c2840de5b29c5157d1", wif: "L2yyEE8nQywPRq7FH3f8yYd1KLqpFAPRfjkAJ8QNAMMuU93dBTkZ"),
    (address: "19jx3zZFDdSPzAnxP36GSDete2kot7U3Kw", pubdata: "02fec359afa1594455f92f286acc8a357f4d1ab13a9a4a45431665f31041f30b7e", wif: "L1Z2ExwyLxG1gq5bgWHMZUMV8TFeLLGX9bUGSvY6ckDiwmc3XpNF"),
    (address: "1JNfo3kxU17BPASpz1oQSVCugoR5Yky3qK", pubdata: "02da43277df1cc89f99db867bbbb69d9c2a968615876c68ca417f38d1a0ddfa47f", wif: "L46ALJNA2a8W44snc6saTeQyRWBEWejG4tgRTFNscwLdbxtjKaiQ"),
    (address: "17kWPbN4WS23dNDbqop5jhUKgPLANyAibd", pubdata: "02001d32fbad2928981a7a10a341dcfadebcf785da631e47e27beca312756aa11c", wif: "L41dPtLJYXojMtgegGodMTLuviMxmyvUnz7gQoEWw9RhSx9RFGVp"),
    (address: "1HxdQA8NK9ZU6CQM2UhtuRRukFLQLUzJAv", pubdata: "023ddd9dd7d708aa64173bd74fe457fd87a30557e37c775c14ab8306d04f60a3e7", wif: "KyRCUPxQ3ucsGzCsEYx3qhRo9PCK81VkgbefUBQypHLj1Vonp5rs"),
    (address: "1ETLoTQUTFEBr1n9kioL9zDGsoSehwXGhX", pubdata: "02eb389371d75833ff0efd9866f5ec558c1d9049256547b50dda706471af5cf857", wif: "Kwzge1aKdz26xW14LFvHRviZJNqRKgF3m9faXoJBhRBonPnSm3eb"),
    (address: "1Kxe6HeQjLZahCrPGwcNGH4qi3hzNh9wEY", pubdata: "0290eae1f7eb79b6b54b1549007ba316b6ac8251788625d4f1eaa941fd7e983dcf", wif: "Kwzri4hTUMguuNFW7RwXo5Tt89GtPbYzt1MmmQMHrMVZvqaAjVVm"),
    (address: "1cw7sq5fdpNuyCvbJR7obh5rjhEZRUh25", pubdata: "03ef0a0a03292cd58be253ad747fa6b9f3bfe0011c51f0782760743657ce55db62", wif: "L2nLvQpz9qeMkqS9MoLCiTyJR872yaYfmncYn49ofqc22Pp5MKE4"),
    (address: "1CPNcJdrVcKE9L8R3u5EbRTtqDJjoRSeT1", pubdata: "03ba3ca38fb50126bdd55336927d144b850c9eaf11e220153b87a7c289c3ed3b35", wif: "KxF756snnmKHpjX7Tz4ewWX4X5uWx7GPeLGFFUHwpYSEqJFX5hLt"),
    (address: "1GNGP7pLsocdnNnsfSFg7mnwhBkcxEvd4X", pubdata: "035ffca59e3c73face723fb40b0f78a2b7ececc430954a2bf2ebefd03a66115fdf", wif: "KyPdqVx3Y2qnK5ZndEModMHy4rKtPQ7zZP3HxVvfYSymWvjVQFgQ"),
    (address: "1PD4rHzAHpCytE7J7DTL6AV7KNSBmbjxNu", pubdata: "02b9e1c0845dc523c7f27b878c21dc9c707c94c1f5d8b48d347d00a50017daadb5", wif: "L1jatzirgRS9KkXMhMTDTBeyjiJKwryaVVYj5akumQKxiLNvWoNK"),
    (address: "13tmCVxn1fjeWkPC2zgt3HLWLpMLkifBpa", pubdata: "029b26044fa749c1c4e58df89f24d61536e96654e6bd240987b3e59a995f6abd13", wif: "Kz8qsLrZp9qTT2C6PFMUaqYprY3UTwyaAkqdL9r1JjSuSiF2SZac"),
    (address: "19YUv8JAhCCvtQpv749zwTGr9PJmjF9iRn", pubdata: "031375ae68837a49c768b7724d7541c5c68cc9d642a110704a5b016de3a188c3f8", wif: "KzvCL2Ns64SJWtTbecSdDXgTFu4yvC9ebaho49mM5cX1TigpayeU"),
    (address: "19UzEL21XJT3Ju4aUUR4Hq98gNg7cJ2ZRt", pubdata: "03d8b085b64c7ad23609f705ec60600a3503305c6b33195bb1ccd74d06dc49bf05", wif: "L44zdXDapVodXST4BHjntDGNrYzUKbHfLa47yAMTPuh7oK18ipH7"),
    (address: "1KWUtrriZ5Cn3ej8tnaUd2oyQezfSFv4xn", pubdata: "025ce0e9d9adc09716a8e62b73893bc4e235a331b2fe5d18634548d29381299172", wif: "L31UDqJTBRW1SVud8HWf7doQy5bV5P5WD39qNcCmWrSKUpro26DH"),
    (address: "1LW8fLebok71MPeQBzCNt64TSreMPEXxrm", pubdata: "02347754f2cb7aa3c6b98ea783e7ee4387ffe0b891d564add0b0e9165355c102ea", wif: "L3wcmQ9sXBaULMCCKX4eH2uMhZ1StUD9BSCWV2NdbjMfZezWWeRG"),
    (address: "1AUA42TtSeUkWBJDiXdaWgrTDbiLMSK2oS", pubdata: "035509f383a39192294dc65f99eeb849c236fc19c9850900ea03298e53ba56ad1d", wif: "L3NW7Jcf9JJwwj8C1zCaiBytQ1ZAj9awFFQd2qiAz9zPTqHW7S5p"),
    (address: "1JAXFqeZMwpg5NiUuLvwc6zfzJJEkRXGs8", pubdata: "030b22da2978fc82eb1bdd1ce90215e8c52bbc09716c3f5fa45f9fa8d236149381", wif: "Ky6Fw4gDzCmDVsutqu6vLT4neebKGsDfzLJZumeM7RV4E4pbUXzB")
    ]
    
}


struct BitcoinAddressesTestVector {
    
    static let data: [(key: String, address: String)] =
    [
        (key: "028027c2fc9b25167cef3d0bc2b44fa5877f2623a4e7fc8171b7f083d64d70ca08", address: "19mZH5iaYYjknbnDpg4fqj2cwTsHnUZWKK"),
        (key: "0358e65308e42f898107d6c6945f5a5b3608136cac98959db721514576835e9831", address: "1Hbpc4aWA6LLHZPw2iwBJJKH67GWWaFJCu"),
        (key: "0284834b68ecfcb0e84b5b56b1428554ac41ce8b40c096a173a69e4678d6437441", address: "13tDmBEkhon4ZNk34uwFpZRYnHNRLuWSUj"),
        (key: "021b4e3919b525664b5072b7c3593329d5a5f4b75b7aefcd4c887636ea2c79801d", address: "1GcvuKWuHbQ1eHsyg5WhhbteGmN11vH35U"),
        (key: "03df56ad68ae2aa3837decef178668787dcb13f5574186dcbfe90ba6ae5aea0152", address: "1LtPLWAjr1X75GEJZKKHatG9nyYHCGqzvu"),
        (key: "038317ce15789b65ed0079b8811f39de16bf165a3b394f213b612e114c392055c8", address: "1Dzftsgte8yHqzkDir2WwTNBx6f4tQ4JYt"),
        (key: "02fbfb06d8b89908e352ec23b9b6107e7b8088d5fbfd94a2a13d2bf16e3716243c", address: "1CJRyJnh1iDA5anXNvWrM88HJ44BekYTVP"),
        (key: "0269ea1835148ad4db2593b584797faa67f665e87abf613459a8a84b087778ca99", address: "161JQm2RYWJPREWZRNoXFr7YNNP4WxhvyD"),
        (key: "02ba9396676abcda4b9e960cc2db5d7d83db63c7fd4717564992f0b444d60d1ad3", address: "1FabxavvXKkUJQvJTbTsEXYTgdS9DF48ZJ"),
        (key: "03c6af777120df6fedd5e003e84f90de4384416ff5681551000f4d9ff35a2d6058", address: "15RkENHxCmcHK4vmoCLzKnMPk9fheA4DCX"),
        (key: "0328980f9417413abf081ff9e22e73dd18ba5cfc6764f07102be4988b3b1311b08", address: "1MuQCuAuuv9aDWR7H2J8Xt9bLSL2PwMSxh"),
        (key: "025ad1f7b151e93164c92ab205bc47ef0463704da29cd4e1901fadbc01f9361486", address: "1AE7NqRfKHkBeEe28nq3M1jM2tA1BaaXKW"),
        (key: "032ca796667a974f061376b8c6f2649de51e0f3e0cf423c7d35907941548b77a68", address: "13QtFT3DL9yeHBz4k11CJ8KV586iKgmFye"),
        (key: "027c839ee8b10522cdc457ee04b8b05bbdb5341ced59fa2be8cc40ed1955dc866c", address: "1PuBstTy6cPJFva8LqAbFtBwvU8gYSJkQr"),
        (key: "020f0a870e62228232632c9c1e57e5a1c964324df7d5de66f340b03ecf289e54dd", address: "1GEVmo9NMh2Xgjf5m1yReYxesM2ZY6PzMS"),
        (key: "0206f7a44efc431818f0d602207fdb42b4039877b14dd49d521eb1d05f2f2d434f", address: "13GfF1AMB3FbULGbapfGhUiGi63B56xNeW"),
        (key: "02a1c4611daf8bbc43f8e0307616e7388470aa023c093b76aa540d5c8ca1221e13", address: "1Pt3hrktEMpovffxLv14yycWPPiSLcbZik"),
        (key: "03d49d8071d06360de12e6a164d1cbbe8f0c8f4422b0aaf9f21ac2b6024e4b4b62", address: "1Q9xgksBaBFDeV3Ti6heL5UbpbVMsDRmuo"),
        (key: "03935ce4f4e013c074e809a8f8b4042d3b6d7b557ac8247b081f1bcbcc845477c4", address: "1KX8DYf2sJm5ijjCgKv5r15NxgCtugtSsY"),
        (key: "03ed1b608b08ff8be443d70946d1bc1f825e2c34f70242b8f3b085830a75f3243b", address: "12hoATLc3Lr6vztfWFn176qdGuvJagxEEm"),
        (key: "03d61688e5acb6900cdbcda67c28c01f7a649c80f39930f7c0bab01813c4efd199", address: "1CSXw9zz5CRxHZziF76jTZip6UE85JMUus"),
        (key: "03dcc4a28d5879a3c52cdaf27d718ecc44511d723d4fa070870b9c7fe6fd3f1c9d", address: "17FdZNEU9J1MPH39gtZiC7kd1tTfJUyJqx"),
        (key: "03ee06766c45d7c49bf9061f36c5e266a1ee4b00a449dff8d71e5cd41b05aa57eb", address: "13WFQDauo2SBhDW1r6PCC5ztzktjffmQCv"),
        (key: "0200ba5aec0840f5d1310d9685bd04d0873e596fa58759cab6b9b0f0a3d9b805e5", address: "1D7bJigAXR3RXG277jYmWxHRe8aCoPY1Qb"),
        (key: "024572de6dc285df9b927706bf40ed46999e5a012f7cb8b0134320be64c5851572", address: "13gAFxzt444cPDtVxWndUEyucrYLrFSms5"),
        (key: "0281ef5b42277a61f5c40228a2426ccfba1c5b6475003358af51e2c172254b383f", address: "1HsNYe8Vd2noAV2VmZvttj4Zqg156UCTip"),
        (key: "02f7704b892c17e0c464aa2e733c46bf97e3acb9c7c2ea1fb3f3b1868c5856e854", address: "17ywehLCsaLAnVkcDHhApH9YjSPUezFPzQ"),
        (key: "03a7142f4f5503b1397e6ceaefe647179ee426456e7d6856937f09871056dcfcb4", address: "1GiFx1YybdjDajc4FRCPVDcqqMvqMcy9Eo"),
        (key: "0298f4dd5a36304f8d1292e193ed0b3eaced7033dc63c9a37a89d7531aaffa400b", address: "1J1K5PUM2SrrMM9EuHqCabZquobYGsLCSh"),
        (key: "03277b38ed47b1fa06fb4dad5edb9f3cae8c4470f2ce98cce84303ddf513589448", address: "13KBmgTYmK18xgpgzsNaUQ93EXfPnWCEDj")
    ]
    
}




struct BitcoinSegwitDerivationTestVector {
    
    static let extendedPrivateKeyBIP84 = "zprvAePkkBiRsqXvM93RNMJPbkxtj9AEBdBEgwztidjMe6ZrpWMtE7oPdEMFxNVSNYkbQksFqDm5hvyJb8h3yXbRPYVZZUVXPvkZjphYCt6oGSV"
    static let extendedPrivateKeyBIP49 = "yprvAKVhKxbvwfxrVsYEKnfaVJg28hzC4rhXGxYWXFfqkHc9VBYCYT52vHkEuQgZHASEUFfj6tfiBmXNdNcQbsxN7nhAkrox7rYTM3HtooNqg9f"
    
    static let validAddressesBIP84 = [
    "bc1q8838kz7rntuyeepeaf9n6s6sm9nkqyl7r8ss58",
    "bc1qu2mrjm7m7um0jgyxulcl0v6dx6268hawwzc7g5",
    "bc1qp0y0mxfm7kgxexqukcuty4dj6ycg2p0mmhfqyq",
    "bc1qct5vrwsfrx39y8glgg9f2cn3hwz4vd49chgpwn",
    "bc1qhza66cq748c49krhdwq3f3kue2d0v82ufej8cy",
    "bc1qmgv0un3v3d3q8c25uz7u46uw9va57xz3t956ac",
    "bc1qgkns7q6jva8xprumnl4wp2n7ay0q086hms4al0",
    "bc1qdltae3kpsfrupvg5g620m94r7hty848fkxetuu",
    "bc1q7j6s76r8mpzjpmx7pldeh8w0d9kxe50zds4t2q",
    "bc1qa2kxm6z23kjlsfusq9x6l0045pj4g6mfcjf43p",
    "bc1qjzwyg6kdqqrf67rgrwldlmxwh0ulyvrfyqvu9f",
    "bc1qlm7zu863eam0nj29pvzcs5a4p9eguja33u57qr",
    "bc1q8rwe0qzd6r08g5tgvqf5gqhpcls77qwtaeg7q9",
    "bc1q2qfu9ndhv7ttxvksm8nqkvvsmu2zn6e7vwrtpe",
    "bc1qnngqrjhcf6xj25tp6ufwmzqep0673rjuqhgn7u",
    "bc1qmqyfedv40w5glzjmqpecq3kzhys6x5s9r9rs3d",
    "bc1quym4tl3wwpl3x6wu6625spntz3gnqhgp963mn8",
    "bc1q32rjwyy9runhyy885h5qqludv76lcv20yxm46x",
    "bc1q6nl42scjgewnw8pxjffhaer57lp3fa8q6e5lpk",
    "bc1qeyrrr5ynctvld94m6950fh5a7pz29hgvq9cqhl"
    ]
    
    static let validAddressesBIP49 = [
    "32bSLz2WRsyGuxR4ZoKCNVMNmzKwY5ZXKD",
    "3QJtxRQrgaPBv3WuR7sCG8AHgftMxrrs45",
    "38LAVFi3dtvNHFsJG5auHVcyjPDZNGNEHr",
    "361WvgicpaGY8ZpM4X6C5tUxVcyBtoQ4hx",
    "3QYv8u4KniDDx9AX6ikDzQBHBSYSpJjE8V",
    "3QSh9AKuucVwF8E9etoyf4VrBfRxhTb36n",
    "33MwMxhQyWX8eby1n57iePfcuhUuKNhEiH",
    "31tWNaJ311wuZsVkM3aSHBmQBTCUs265Xh",
    "33KBW77uEZ5pY74hAToCpUtqKYsuBsTDKp",
    "333ZNHs72MfgQwxLLQCMvb3YXkDSHFFqGg",
    "3QZQfHKXE8uvppx6FoJgBikYrVSAEaFF3M",
    "3K3pJ4Dp9hNqTRHCFShxfHYrPpcFYLpiJZ",
    "35e3SchaFEPH3CDoUvEJ8TBQrYbQoMYJoF",
    "38uX7fP6xw3fesHD5LgaK9yTWqpruNLh4k",
    "3NmwyeiuNZy6VsuPEPqNmMzxtTbscq83FJ",
    "3J3MKTKEJFVijdzM6YnLRwJFLZ55Gih39k",
    "3Cm5wm7bZr95N513wZZg92iiQZ5EvQ59x5",
    "3A7Drgjz6jm1pM4PsXPc5pkz6pCeWK6R3P",
    "34FAP6vkFe6BexErgcSu7BCp3CENFFk3mC",
    "32bSQdAFAxQW1Sr14mqfMoMzqwoW84bxk7"
    ]
}
