import React, { useState } from "react";
import { getLocations } from "./api";
import { List } from "./List";
import { debounce, throttle } from "lodash";

const searchLocations = async (search, processData) => {
    getLocations(search).then((response) => {
        processData(response.data);
    });
};

const search = debounce(searchLocations, 1000, { leading: true, trailing: false });
//Or const search = throttle(searchLocations, 1000);

const App = () => {
    const [results, setResults] = useState([]);
    const onSearchText = (text) => {
        if (!!text.length) {
            search(text, setResults);
        } else {
            search.cancel();
        }
    };

    return (
        <div className="App">
            <input
                onChange={(e) => {
                    onSearchText(e.target.value);
                }}
                style={{ width: 200, height: 50, margin: 20, fontSize: 20 }}
            />

            <List data={results} />
        </div>
    );
};

export default App;
