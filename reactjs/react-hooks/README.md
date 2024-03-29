# React Hooks to Manage Component State and Lifecycle&nbsp;[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fnumerica-ideas%2Fcommunity%2Ftree%2Fmaster%2Freactjs%2Freact-hooks&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://numericaideas.com/blog/react-hooks)

**This document was originally written by "Noël Foka" on the blog**: https://numericaideas.com/blog/react-hooks

[![ReactHooksThumbnail](./images/react-hooks.png)](https://numericaideas.com/blog/react-hooks)

> The **YouTube Channels** in both English (En) and French (Fr) are now accessible, Feel free to subscribe by clicking [here](https://www.youtube.com/@numericaideas/channels?sub_confirmation=1).

## What is a Hook?

A **Hook** is a special function that allows developers to use state and other React features without having to write a class. Hooks were released with the release of **React 16.8** and are also functions that can be used in functional React components. They facilitate development by providing less code to developers for using React features.

## React Hook Usages

Indeed, the appearance of hooks in web development frameworks and libraries, such as React, is due to the need to simplify code by avoiding `Class` and make more flexible the management of state in components. Hooks allow developers to manage local state, perform side effects, and reuse logic between components more efficiently. They offer a more functional and declarative approach to state management, which makes it easier to create more modular and maintainable applications.

For example, instead of using a class and writing methods like `componentDidMount` or `componentWillUnmount` to manage component lifecycle like this:

```jsx
import React, { Component } from 'react';

class MyComponent extends Component {
  constructor(props) {
    super(props);
    this.state = { count: 0 };
  }

  componentDidMount() {
    document.title = `You clicked ${this.state.count} times`;
  }

  componentDidUpdate() {
    document.title = `You clicked ${this.state.count} times`;
  }

  render() {
    return (
      <div>
        <p>You clicked {this.state.count} times</p>
        <button onClick={() => this.setState({ count: this.state.count + 1 })}>
          Click me
        </button>
      </div>
    );
  }
}
```

You can use the `useEffect` Hook like this:

```jsx
import React, { useState, useEffect } from 'react';

function MyComponent() {
  const [count, setCount] = useState(0);

  useEffect(() => {
    // This function is called every time the component is mounted or updated
    document.title = `You clicked ${count} times`;
  }, [count]);

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
```

Also, there are several types of Hooks available in React of which we will list some examples such as `useState`, `useEffect`, `useContext`, etc. Each Hook has a specific function that can be used to manage a specific part of the component's lifecycle. For example:

- The `useState` Hook is used to manage local state in a React component. It allows to define a state variable and a function to update it. When the update state function is called, React automatically updates the UI to reflect the new state. We have as a typical example, our increment function used above
- The `useEffect` hook is used in React to execute a function after each component render. This makes it possible to update the state of the component in response to prop or state changes, or to perform tasks such as retrieving data from an API. The `useEffect` hook can also be used to clean up function effects when the component is unmounted. For example, suppose you have a component that displays a welcome message to the user, and you want to update this message whenever the user's name changes. You can use the `useEffect` hook to perform this update:

``` jsx
import React, { useState, useEffect } from "react";

function WelcomeMessage(props) {
    const [name, setName] = useState(props.name);

    useEffect(() => {
      setName(props.name);
    }, [props.name]);

    return <h1>Welcome, {name}!</h1>;
}
```

- `useCallback` is a React hook that allows you to remember a function in memory between renders. This optimizes performance by avoiding recreating the same function each time you render.

Here is an example of using `useCallback`:

``` jsx
import React, { useState, useCallback } from 'react';

function MyComponent() {
    const [count, setCount] = useState(0);

    // This function is created at each render
    function handleClick() {
      setCount(count + 1);
    }

    // This function is remembered between renders
    const memoizedHandleClick = useCallback(() => {
      setCount(count + 1);
    }, [count]);

    back (
      <div>
        <p>Number: {count}</p>
        <button onClick={handleClick}>Increment</button>
        <button onClick={memoizedHandleClick}>Memorized Increment</button>
      </div>
    );
}
```

In this example, `handleClick` is a function that is created each time it renders, which can cause performance issues if the component is rendered frequently. On the other hand, `memoizedHandleClick` is remembered between renders using `useCallback`, which optimizes performance. Note that `useCallback` takes a dependency array as an argument, which specifies the values that the stored function depends on. In this example, the function depends on the value of `count`, so we pass it as a dependency.

## Testing React Hooks

Hooks make code easier to test. Since they are independent functions, they can be tested separately without needing to instantiate an entire component. This makes it easier to test different parts of a component and makes it easier to identify errors. For example, imagine that we want to implement an increment button, and test it. With hook it looks like this:

```jsx
import React, { useState } from 'react';

function Counter() {
  const [count, setCount] = useState(0);

  function increment() {
    setCount(count + 1);
  }

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={increment}>Increment</button>
    </div>
  );
}

export default Counter;
```

Now here is the related test code, which uses the [Jest](https://jestjs.io/docs/tutorial-react) library:

```jsx
import React from 'react';
import { render, fireEvent } from '@testing-library/react';
import Counter from './Counter';

test('Counter increments when button is clicked', () => {
  const { getByText } = render(<Counter />);
  const button = getByText('Increment');
  const count = getByText('Count: 0');

  fireEvent.click(button);

  expect(count).toHaveTextContent('Count: 1');
});
```

———————

We have just started our journey to build a network of professionals to grow even more our free knowledge-sharing community that’ll give you a chance to learn interesting things about topics like cloud computing, software development, and software architectures while keeping the door open to more opportunities.

Does this speak to you? If **YES**, feel free to [Join our Discord Server](https://discord.numericaideas.com) to stay in touch with the community and be part of independently organized events.

———————

## Conclusion

To sum up, Hooks are powerful React features that allow developers to manage component state and lifecycle in an easier and more efficient way. They offer several advantages over classes, such as reduced code required, better testability, and improved performance. By using Hooks, developers can write more concise and easier-to-understand components, which makes it easier to maintain and evolve the application.

Thanks for reading this article. Like, recommend, and share if you enjoyed it. Follow us on [Facebook](https://www.facebook.com/numericaideas),  [Twitter](https://twitter.com/numericaideas), and [LinkedIn](https://www.linkedin.com/company/numericaideas) for more content.
