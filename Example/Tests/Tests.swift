import XCTest
import Secp256k1Kit

class Tests: XCTestCase {

    func testExample() {
        
      //Notes to Qredo Dev
      //sha256 hash the seed, this hash is used as the 'Private Key'
      //Use Kit.createPublicKey(fromPrivateKeyData: data) to convert to a public key
        
        
      //Private key is sha256 hash of test "qredo" = d018917e12036a542f6af250f7e03069eb37343d0563af5452f81acf64d97801
      //Public key should be  0434989080c32ca4575e5bc91b7a0c622be274e80c16c61274fb130501ac6617f7b1407fed52f4248b3a1e1a675d0089c9836029380c70d7d18fe5a56cea706056
    
       let data = dataWithHexString(hex: "d018917e12036a542f6af250f7e03069eb37343d0563af5452f81acf64d97801")
       let sk = Kit.createPublicKey(fromPrivateKeyData: data)
       print(sk.hexEncodedString())
       let res = sk.hexEncodedString()
       XCTAssert(res=="0434989080c32ca4575e5bc91b7a0c622be274e80c16c61274fb130501ac6617f7b1407fed52f4248b3a1e1a675d0089c9836029380c70d7d18fe5a56cea706056","Pass")
    
    }

    func dataWithHexString(hex: String) -> Data {
        var hex = hex
        var data = Data()
        while(hex.count > 0) {
            let subIndex = hex.index(hex.startIndex, offsetBy: 2)
            let c = String(hex[..<subIndex])
            hex = String(hex[subIndex...])
            var ch: UInt32 = 0
            Scanner(string: c).scanHexInt32(&ch)
            var char = UInt8(ch)
            data.append(&char, count: 1)
        }
        return data
    }
    
}

extension Data {
    func hexEncodedString() -> String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
}
