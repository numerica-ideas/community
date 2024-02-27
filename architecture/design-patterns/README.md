# Design Patterns Hits&nbsp;[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fnumerica-ideas%2Fcommunity%2Ftree%2Fmaster%2Farchitecture%2FDesign-Patterns Hits&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://numericaideas.com/blog/design-patterns)

# **This article was originally written by "Faouzi EL Mansour" on the blog**: https://numericaideas.com/blog/design-patterns 

# Introduction
In IT, one of the golden rules is not to reinvent the wheel. Because this allows us to save time and use a solution (like design patterns) that has already proven itself to solve a well-defined problem. Today, a developer who does not know design patterns and how to apply them in a very specific context is not a complete developer, or even a junior developer. This article provides an introduction to design patterns. We will give a definition of the design pattern and we will then make a classification of the different patterns and finally present the advantages and disadvantages of the latter.
![fearuredImage](./images/design-pattern.png)

## Historical
Design pattern is a concept that goes back a bit. It originated with the publication of the book A Pattern Language: Towns, Buildings, Construction (Center for Environmental Structure Series) by Christopher Alexander. It is a book that presents solutions that can be used to design an urban environment. The term was picked up in 1994 and was adapted by a group nicknamed the Gang of Four (Erich Gamma, Richard Helm, Ralph Johnson, and John Vlissides) into the software field where they published a book Design Patterns: Catalog of Design Patterns. reusable design. Hence the origin of the word Design Pattern in the field of IT. In this book, they presented 23 solution models to use when faced with a number of recurring problems in the world of computer programming. Since then, the use of design patterns has become an essential part of software programming.

## Design Pattern: What is it?
Design patterns are resolutions made to deal with common problems in software design. They offer a very simple approach to solving design problems in general and in particular, promoting the reusability, maintainability and flexibility of the source code during the development of a software product. These design patterns are not typical of a particular programming language or technology, but can be used in various scenarios when designing software.

To put it simply, Design Pattern is a way to solve a recurring problem in the world of software programming. He is there to give you the principles and it is up to you to adapt these principles to your own program. At the time, programmers faced a certain number of problems that came up very often in their daily lives. Using the same solution to solve the same problem has pushed some programmers to identify problems and propose common solutions to solve them. Among these problems we can have the structuring of the code for example. That is to say, the design pattern explains to you how to structure your code to have an easily digestible and readable program.

## Classification of Design Patterns
There are several categories of design patterns, including creational, structural, and behavioral patterns. In this section, we will briefly present each category:

### Creational Design Patterns
These models focus on the principles of object creation, allowing the creation of flexible and isolated objects. This is to avoid strong coupling between objects. There are 5 in the literature. Below we will cite some of them:

#### Singleton Design Pattern
The Singleton pattern is one of the most used creative patterns. It allows you to create a single instance of a class with an exclusive entry by providing a global access point to it. Often we have to face the problem of using only one instance of a class at a time. This design pattern responds perfectly to this problem.

#### Factory Design Pattern
Best practices like the SOLID principle recommend that we use interfaces instead of implementations. The Factory materializes this process by defining an interface to create objects and allow subclasses to decide which class to instantiate. As its name suggests, this pattern allows you to construct objects.

#### Builder Design Pattern
The builder allows you to have readable code by separating the construction of complex objects from its representation. It allows you to create a complex object step by step. A computer can be seen as a complex tool for example because it is made up of several components (motherboard, ram, cpu, etc.). Builder allows you to assemble a computer component by component.


### Structural Design Patterns
This class of design pattern focuses on the structural aspect of your source code or how to organize your software project. So it answers the question of how to compose classes and objects to obtain a well-structured project while keeping them flexible and efficient? Below we present some of them:

#### Adapter Design Pattern
This pattern aims to make compatible two interfaces which are not initially compatible. It converts the interface of one class into another interface expected by another class, allowing classes to work together. We find this pattern much more when we want to interact with different systems. One using for example SOAP and the other JSON.

#### Decorator Design Pattern
you want to dynamically add a new behavior to an object without breaking the S (Single Responsibility Principle) of SOLID, the decorator pattern is best placed to do this. It allows you to wrap the desired new behavior in a decorator class, thus offering a flexible choice to the subclass to extend the functionality.

#### Composite Design Pattern
The main purpose of this pattern is to organize your code or your project in the form of a tree, thus allowing you to have complex objects from simple objects. Objects are processed individually and are composed uniformly. It should be noted that this pattern is used much more when faced with a problem that requires structuring a project in the form of a tree, similar to the manipulation of directories, folders or files.

### Behavioral Design Patterns
These templates are there to make it easier for you to communicate between your objects and assign responsibilities. Basically, this class of patterns focuses on algorithms and scheduling responsibilities by defining how objects interact and distributing tasks efficiently. In this case of models we can find the patterns:

#### Observer Design Pattern
This is a pattern that is used to implement a notification system. Its principle is simple. It allows objects to register to receive notifications when an important event occurs in other objects. We can make an analogy with the signaling system on our roads. When the light turns green, for example, vehicles cross and pedestrians stop. The event here is the transition of the light from one color to another and depending on the color, the objects (vehicles, pedestrians, etc.) around will change their state as well.

#### Strategy Design Pattern
This pattern, as its name suggests, is intended to be strategic. It allows defining a family of dynamically interchangeable algorithms and encapsulates each of them, allowing them to be used interchangeably depending on the context. This pattern addresses the problems of using a single object with multiple treatments without violating the SOLID principles.

#### Command Design Pattern
It allows you to encapsulate a request as an object, that is to say, it allows you to separate the action code and the action itself. This pattern allows you to design an application without knowing the characteristics of an object with which your application is called upon to communicate. Much more technically, this pattern allows clients to configure clients with different requests, queue or log requests, and support cancelable operations.


These are just a few examples of design templates, and there are many more templates available. Each model addresses a specific design problem and provides a proven solution. It is important to choose the appropriate model based on the problem at hand and the specific requirements of your software project.

## Why Design Patterns?
Design patterns are used in software development for several reasons:

Problem Solving: Design patterns provide proven solutions to common design problems in software development. They summarize best practices and design principles that have been refined and validated over time. By using design patterns, developers can leverage the collective knowledge and experience of the software development community to efficiently solve complex problems.

## Advantages and disadvantages

### Advantages
Design patterns provide several advantages in software development. Here are some key benefits of using design patterns:

#### Reusability: 
Design patterns provide reusable solutions to common design problems. They summarize proven design principles and best practices, allowing developers to apply them in different projects and scenarios. By reusing design patterns, developers can save time and effort in designing and implementing solutions from scratch.

#### Maintainability 
Design patterns promote code maintainability by providing a structured and organized approach to software design. They help separate issues, making code easier to understand, modify, and extend. With design patterns, changes to one part of the code base are less likely to have a ripple effect on other parts, reducing the risk of introducing bugs or unintended side effects.

#### Flexibility and Extensibility
Design patterns allow software systems to be more flexible and extensible. They allow easy modification and extension of existing code without affecting the entire system. By following design patterns, developers can build software that is open to future changes and capable of adapting to new requirements or features with minimal impact on the existing code base.

### Disadvantages

Although design patterns offer many advantages, it is also important to consider their potential disadvantages. Here are some drawbacks or challenges associated with design patterns:

#### Complexity
Design patterns introduce additional layers of abstraction and complexity into the code base. Implementing design patterns can require developers to understand and apply complex concepts, which can be difficult for less experienced team members. Overuse or misapplication of design patterns can lead to unnecessarily complex code that is difficult to understand and maintain.

#### Over-engineering
Design patterns should be used judiciously and only when they are truly necessary. Applying design patterns without a clear need can lead to over-engineering, where the code becomes too complex and difficult to maintain. It's important to strike a balance between using design patterns to solve specific problems and keeping the code base simple and straightforward.

#### Learning curve
Design patterns require developers to have a solid understanding of their concepts and implementation details. Learning and mastering design patterns can take time and effort, especially for developers who are new to software design principles. This learning curve can slow down the development process at first.

———————

We have just started our journey to build a network of professionals to grow even more our free knowledge-sharing community that’ll give you a chance to learn interesting things about topics like cloud computing, software development, and software architectures while keeping the door open to more opportunities.

Does this speak to you? If **YES**, feel free to [Join our Discord Server](https://discord.numericaideas.com) to stay in touch with the community and be part of independently organized events.

———————

## Conclusion
Overall, design patterns contribute to the development of high-quality, maintainable, flexible, and scalable software systems. They provide proven solutions to common design problems and promote best practices in software development. However, it is important to use design patterns judiciously and consider the specific requirements and constraints of each project to ensure that the benefits of design patterns outweigh the potential drawbacks.

Thanks for reading this article. Like, recommend, and share if you enjoyed it. Follow us on [Facebook](https://www.facebook.com/numericaideas), [Twitter](https://twitter.com/numericaideas), and [LinkedIn](https://www.linkedin.com/company/numericaideas) for more content.



