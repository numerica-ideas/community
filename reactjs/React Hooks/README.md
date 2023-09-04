# React Hooks: How to use Hooks to manage component state and lifecycle.

[React](https://react.dev/learn) is a popular JavaScript library used to create interactive user interfaces. With the release of React 16.8, a new feature called [Hooks](https://react.dev/reference/react) was introduced. Hooks allow developers to manage the state and lifecycle of components in an easier and more efficient way.

## What is a Hook?

A Hook is a special function that allows developers to use state and other React features without having to write a class. Hooks are functions that can be used inside React functional components. They allow developers to reuse state and lifecycle logic without having to use classes. For example:

- Instead of using a class and writing methods like `componentDidMount` or `componentWillUnmount` to manage component lifecycle like this:

```sh
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

you can use the `useEffect` Hook like this:

```sh
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

Second, Hooks make code easier to test. Since they are independent functions, they can be tested separately without needing to instantiate an entire component. This makes it easier to test different parts of a component and makes it easier to identify errors. For example, imagine that we want to implement an increment button, and test it. With hook it looks like this:

```sh
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

Now here is the related test code, which uses the Jest library:

```sh
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

## How to use Hooks?

There are several types of Hooks available in React, such as `useState`, `useEffect`, `useContext`, etc. Each Hook has a specific function that can be used to manage a specific part of the component's lifecycle. For example:

- The `useState` Hook is used to manage local state in a React component. It allows to define a state variable and a function to update it. When the function to update state is called, React automatically updates the UI to reflect the new state. We have as a typical example, our increment function used above
- The `useEffect` hook is used in React to execute a function after each component render. This allows updating the state of the component in response to changes in props or state, or performing tasks such as retrieving data from an API. The `useEffect` hook can also be used to clean up function effects when the component is unmounted. For example, suppose you have a component that displays a greeting message to the user, and you want to update this message whenever the user's name changes. You can use the `useEffect` hook to perform this update:

```sh
import React, { useState, useEffect } from "react";

function WelcomeMessage(props) {
  const [name, setName] = useState(props.name);

  useEffect(() => {
    setName(props.name);
  }, [props.name]);

  return <h1>Welcome, {name} !</h1>;
}
```

- `useCallback` is a React hook that allows you to remember a function in memory between renders. This optimizes performance by avoiding recreating the same function each time you render.

Here is an example of using `useCallback`:```

```sh
import React, { useState, useCallback } from 'react';

function MyComponent() {
  const [count, setCount] = useState(0);

  // This function is created on every render
  function handleClick() {
    setCount(count + 1);
  }

  // This function is memoized between renders
  const memoizedHandleClick = useCallback(() => {
    setCount(count + 1);
  }, [count]);

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={handleClick}>Increment</button>
      <button onClick={memoizedHandleClick}>Memoized Increment</button>
    </div>
  );
}
```

In this example, handleClick is a function created on every render, which can cause performance issues if the component is frequently rendered. On the other hand, memoizedHandleClick is memoized between renders using useCallback, which optimizes performance. Note that useCallback takes an array of dependencies as an argument, which specifies the values that the memoized function depends on. In this example, the function depends on the value of count, so we pass it as a dependency.

## Conclusion

Hooks are a powerful feature of React that allow developers to manage component state and lifecycle in an easier and more efficient way. They offer several advantages over classes, such as reduced code required, better testability, and improved performance. By using Hooks, developers can write more concise and easier to understand components, which makes it easier to maintain and evolve the application.

In conclusion, Hooks are a valuable tool for all React developers and should be used to improve code quality.
