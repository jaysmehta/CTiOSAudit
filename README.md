# CT iOS Audit Tool 

## Installation using CocoaPods

For your iOS app, add the following to your Podfile:

```
target 'YOUR_TARGET_NAME' do
   pod 'CTiOSAudit'
end
```

Then run `pod install`

## Integration

1. `import CTiOSAudit` module in your AppDelegate class. 
2. Initialise the SDK and call `startAudit()` method before CleverTap iOS `autoIntegrate()` method.

```swift
let ctAudit = CTAudit()
ctAudit.startAudit()
```
3. Run your app, a text file with audit results will be generated on the path mentioned in the deubg logs.
