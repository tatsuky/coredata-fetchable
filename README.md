# coredata-fetchable

## Usage

Add `CoreDataFetchable` to your `NSManagedObject` subclass inheritation:

```swift
@objc(Person)
public final class Person: NSManagedObject, CoreDataFetchable {
    // ...
}
```

Note here that `final` keyword is added to the declaration.

## Creating and insert to context

```swift
let person = Person.create()
person.uuid = UUID()
person.age = 24
person.name = "John Doe"
```

## Fetching all instances

```swift
let people = Person.fetch()
```

See [the implementation](https://github.com/tatsuky/coredata-fetchable/blob/master/CoreDataFetchable.swift) for the available arguments.

## Deleting instance(s)

```swift
let person = Person.create()

// Delete single instance
person.delete() // Oops, I changed my mind.

// Delete all instances
Person.deleteAll() // I want everyone gone.
```

## Caveats

Do not forget to save context when the application will terminate.

I didn't implement e.g. `person.save()` because it may have a performance issue given you would call `context.save()` every time an instance is created.
