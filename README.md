# DisguisedSwiftly

Package with all sorts of cryptographic functions and capabilities for Swift.
For now it's mainly concentrated of steganography but new capabilities will be added in the future releases. 

## Example usage of Stego in iOS

```swift
let stego = Stego()

let image = UIImage(named: "swift")

let encodedImage = stego.encodeTextInImage(with text: "Swift is awesome", image: image, finished: { finished in
    finished ? print("Ended encoding") : print("Didnt finish")
})


let decodedText = stego?.decodeTextInImage(image: image, finished: { finished in
    finished ? print("Ended encoding") : print("Didnt finish")
})
```
