![testing/building](https://img.shields.io/github/workflow/status/lswarss/DisguisedSwiftly/Testing/main) ![Platform](https://img.shields.io/badge/Platforms-iOS-4E4E4E.svg?colorA=28a745) 

# DisguisedSwiftly

Package with all sorts of cryptographic functions and capabilities for Swift.
For now it's mainly concentrated of steganography but new capabilities will be added in the future releases. 

## Example usage of Stego in iOS

```swift
let stego = Stego()
let image = UIImage(named: "swift")

stego.encodeTextInImage(with: "Swift is awesome", in: image) { [weak self] result in
    switch result {
    case .success(let image):
        self?.saveImage(image)
    case .failure(let error):
        self?.displayError(error)
    }
}

stego.decodeTextInImage(in: image) { [weak self] result in
    switch result {
    case .success(let message):
        self?.displayMessage(message)
    case .failure(_):
        self?.displayError(error)
    }
}
```
