## Introduction

In the ever-evolving world of web development, tools that streamline processes and optimize performance are essential. **Lodash**, a versatile utility library, has emerged as a powerhouse for JavaScript developers. In this article, we'll explore how **Lodash** can significantly impact API request handling within a React environment. We'll focus on two crucial features: **Throttling** and **Debouncing**. By delving into examples and code snippets, we'll demonstrate how **Lodash** can be utilized to enhance API request management, ensuring smoother user interactions and improved application efficiency.

**Note: This article assumes a basic familiarity with React and API interactions.**

[![FeaturedImage](./lodash-optmize-request.png)]

The **YouTube Channels** in both English (En) and French (Fr) are now accessible, feel free to subscribe by clicking [here](https://www.youtube.com/@numericaideas/channels?sub_confirmation=1).

## Throttling and Debouncing: Elevating API Request Handling

Efficiently managing API requests is vital to prevent overwhelming servers and deliver a seamless user experience. Throttling and debouncing are techniques that allow us to control how often a function is executed, particularly useful when functions are tied to user-triggered events.

Let's dirty our hands.
The following code showcases a text field that triggers an API call when its value is changed.

```
import { useEffect, useState } from "react";

const getLocations = async (search) => {
    const response = await fetch("https://fakemyapi.com/api/fake?id=976f9a09-87bc-4d92-8fd7-9860040b9806", {
        method: "GET",
    });
    return response.json();
};

const App = () => {
    const [searchText, setSearchText] = useState("");
    const [count, setCount] = useState(0);

    useEffect(() => {
        if (!!searchText.length) {
            getLocations(searchText).then((response) => {
                setCount((c) => c + 1);
            });
        }
    }, [searchText]);

    return (
        <div className="App">
            <input
                onChange={(e) => {
                    setSearchText(e.target.value);
                }}
                value={searchText}
                placeholder={"Location"}
            />

            <p>API called {count} times </p>
        </div>
    );
};

export default App;
```

Look at the output :

[![FeaturedImage](./search-input.gif)]

There are two things we can notice:

1. The API was called 8 times when fewer calls would have been sufficient.
2. The user had to wait for 8 requests to get the result of their search.

Now, imagine if your platform had 10 thousand simultaneous users. Your server would experience unnecessary heavy load. Let's see how Lodash can help us improve this."

### Throttling: Controlled Function Invocation

Throttling limits the rate at which a function can be invoked, ensuring that it is executed at a controlled frequency. Consider a scenario where user keystrokes trigger API requests for live search suggestions. To prevent excessive server load, we can implement throttling.

In this example, the throttle function from Lodash ensures that the handleSearch function is invoked at most once every 500 milliseconds, preventing rapid and excessive API requests while maintaining real-time search functionality.

```
...
import { throttle } from "lodash";

...

const searchQuery = (queryParam, doSomething) => {
    getLocations(queryParam).then(doSomething);
};

const search = throttle(searchQuery, 500, { leading: true, trailing: false });

const App = () => {
    ...

    useEffect(() => {
        if (!!searchText.length) {
            search(searchText, () => setCount((c) => c + 1));
        } else {
            search.cancel();
        }
    }, [searchText]);

    ....
};

export default App;
```

The result :

[![FeaturedImage](./search-input-throttle.gif)]

Now, let's have a look on how the throttle options work :

#### 1. { leading: true, trailing: true }

#### 2. { leading: true, trailing: false }

#### 3. { leading: false, trailing: true }

#### 4. { leading: true, trailing: true }

### Debouncing: Delayed Execution for Enhanced Efficiency

Debouncing delays the execution of a function until after a specified period has passed since the last invocation. This is particularly useful when responding to user actions that trigger multiple function calls in quick succession.

Now, let's have a look on how the debounce options work :

#### 1. { leading: true, trailing: true }

#### 2. { leading: true, trailing: false }

#### 3. { leading: false, trailing: true }

#### 4. { leading: true, trailing: true }
