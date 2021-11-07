![Platform](https://img.shields.io/badge/Platforms-iOS-4E4E4E.svg?colorA=28a745)

![testing/building](https://img.shields.io/github/workflow/status/lswarss/DisguisedSwiftly/Testing/main)

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
