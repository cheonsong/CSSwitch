# CSSwitch

![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)
[![Version](https://img.shields.io/cocoapods/v/CSSwitch.svg?style=flat)](https://cocoapods.org/pods/CSSwitch)
[![License](https://img.shields.io/cocoapods/l/CSSwitch.svg?style=flat)](https://cocoapods.org/pods/CSSwitch)
[![Platform](https://img.shields.io/cocoapods/p/CSSwitch.svg?style=flat)](https://cocoapods.org/pods/CSSwitch)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

  - iOS 9.0+
  - Swift 5.0
  
## Installation

CSSwitch is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CSSwitch'
```

## Properties

| Property                                                | Explanation                                          | Default Value      |
| ------------------------------------------- | ------------------------------------------ | :-----------------: |
```borderColor: CGColor``` | switch border color | UIColor.lightGray.cgColor |
```borderWidth: CGFloat``` | switch border width | 1.0 |
```selectBorderColor: CGColor``` | selected view border color | UIColor.clear.cgColor |
```selectBorderWidth: CGFloat``` | selected view border width | 0.0 |
```selectedColor: UIColor``` | selected view backgroundColor | UIColor.white |
```deselectedColor: UIColor``` | deselected view backgroundColor | UIColor.clear |
```selectedFont: UIFont``` | selected text font | SystemFont(10) |
```deselectedFont: UIFont``` | deselected view border width | SystemFont(10) |
```selectedTextColor: UIColor``` | selected text color | UIColor.black |
```deselectedTextColor: UIColor``` | selected text color | UIColor.lightGray |
```cornerRadius: CGFloat``` | switch cornerRadius (both of swtich and selectView) | UIColor.lightGray |
```leftText: String``` | leftText in Switch | "left" |
```rightText: String``` | rightText in Switch | "right" |

## Author

cheonsong, qkrcjsthd@gmail.com

## License

CSSwitch is available under the MIT license. See the LICENSE file for more info.
