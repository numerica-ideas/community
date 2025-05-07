export const getLocations = async (search) => {
    var myHeaders = new Headers();
    myHeaders.append("Authorization", `Basic ${process.env.REACT_APP_ROAD_GOAT_BASIC_AUTH}`);

    let requestOptions = {
        method: "GET",
        headers: myHeaders,
        redirect: "follow",
    };

    try {
        const response = await fetch("https://api.roadgoat.com/api/v2/destinations/auto_complete?q=" + search, requestOptions);

        return response.json();
    } catch (error) {
        console.log("error", error);
    }
};
