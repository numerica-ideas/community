import React, { useMemo } from "react";

export const List = ({ data }) => {
    const uniqueResults = useMemo(() => {
        let list = new Set();
        data.forEach((item) => {
            const {
                attributes: { short_name },
            } = item;
            list.add(short_name);
        });

        return Array.from(list);
    }, [data]);

    return (
        <ul style={{ marginTop: "20px" }}>
            {uniqueResults.map((name, i) => {
                return (
                    <li key={i} style={{ marginTop: 10 }}>
                        {name}
                    </li>
                );
            })}
        </ul>
    );
};
