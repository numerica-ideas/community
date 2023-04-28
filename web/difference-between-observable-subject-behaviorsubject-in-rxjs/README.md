# Difference between Observable, Subject, and BehaviorSubject in RxJS&nbsp;[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fnumerica-ideas%2Fcommunity%2Ftree%2Fmaster%2Faws%2Fdifference-between-observable-subject-behaviorsubject-in-rxjs&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://blog.numericaideas.com)

## Introduction

**RxJS** (Reactive Extensions for JavaScript) is a library that brings the concept of reactive programming that deals with asynchronous data calls, callbacks, and event-based programs using observables. It provides a lot of operators to allow handling asynchronous events as collections. Using the Observables pattern, RxJS comes with two other types of Observables: Subject and BehaviorSubject; each with its own particularity. Understanding the distinctions between Observable, Subject, and BehaviorSubject is crucial. Therefore, in this article, we will outline the differences between these distinct entities.

## Observable

An **Observable** is a function that creates an observer and attaches it to the source where events are excepted. It performs this by calling a `subscribe()` method where you can access the published event. With Observable, we can only consume events but not emit them, which implies that we can have many consumers but only one producer. One thing to notice is that the producer will run as many times for each observer.

### Methods

- subscribe

### Example

```
import { Observable } from 'rxjs';

let observable = new Observable(
   function subscribe(observer) {
      observer.next("My First Observable")
   }
);

observable.subscribe(x => console.log(x));
// Output: My First Observable
```

## Subject

A **Subject**’s a kind of observable that allows unlike a simple observable, the ability to publish an event after subscription, but it has no initial value. In addition to the `subscribe()` method, it has a method `next()` which is used to emit an event. Subject is stateful and the producer executes only once for all listeners/observers.

### Methods

- subscribe
- next

### Example

```
import { Subject } from 'rxjs';

const subject = new Subject(); 

subject.next(‘value 0'); 

subject.subscribe(val => console.log(val)); 

subject.next(‘value 1'); 
// Output: value 1

subject.next(‘value 2'); 
// Output: value 2
```

## BehaviorSubject

About **BehaviorSubject**, this one is very similar to **Subject** except that **it can have an initial value**. BehaviorSubject also ensures the last published event is consumed by new consumers.

### Methods

- subscribe
- next

### Example

```
import { BehavioSubject } from 'rxjs';

const behaviorsubject = new BehavioSubject(‘initial’); 

behaviorsubject.next(‘value 0'); 

behaviorsubject.subscribe(val => console.log(val)); 
 // Output: value 0

behaviorsubject.next(‘value 1'); 
// Output: value 1

behaviorsubject.next(‘value 2'); 
// Output: value 2
```

## Conclusion

In conclusion, we hope that this article has cleared up any confusion surrounding Observable, Subject, and BehaviorSubject. If you have any further thoughts or insights to add, please do not hesitate to share them with us. We welcome all feedback and suggestions.
