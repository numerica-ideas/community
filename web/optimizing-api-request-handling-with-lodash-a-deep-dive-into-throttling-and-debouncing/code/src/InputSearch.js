import React, { useState } from "react";
import { getLocations } from "./api";
import { List } from "./List";

const searchLocations = async (search, processData) => {
    getLocations(search).then((response) => {
        processData(response.data);
    });
};

const App = () => {
    const [results, setResults] = useState([]);
    const onSearchText = (text) => {
        if (!!text.length) {
            searchLocations(text, setResults);
        }
    };

    return (
        <div className="App">
            <input
                onChange={(e) => {
                    onSearchText(e.target.value);
                }}
                style={{ width: 200, height: 50, margin: 20 }}
            />

            <List data={results} />
        </div>
    );
};

export default App;
