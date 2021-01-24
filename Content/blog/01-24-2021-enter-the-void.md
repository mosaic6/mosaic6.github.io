---
date: 2021-01-24 21:04
description: Have you every really looked into what Void is?
tags: development, quickie
excerpt: Do you really know what Void is?
topic: What is Void?
title: Enter the Void
---

# Welcome to the Void...explanation.

Have you ever really looked into what `Void` is? Have you read the official [documentation](https://developer.apple.com/documentation/swift/void)?

If not, no worries, it's nothing 😆.

## Declaration

```swift
typealias Void = ()
```

## But, why...?

Why and how do we use `Void`? You've all seen it, and used it. When you declare a function or method without a return type, `Void` is included unless otherwise specified. 

## Ok, but what is it really?

If you look at the `typealias` declaration, you can see that `Void` is simply an empty tuple. 

## Example

```swift
func logSomething(_ message: String) -> Void {
    print("LOG: \(message)")
}

let log: (String) -> Void = logSomething
log("Don't get too excited, it's just a message.")
```
Another way you could look at `Void` would be:

```swift
func doSomething() { ... }

// This is the same as

func doSomething() -> Void { ... }
```

## Conclusion
As you can see, `Void` is nothing. It's empty. And that's okay 👌. It doesn't have anything to prove to the other types. When you don't need to return a specified type, use `Void`. Or don't...it doesn't matter.


