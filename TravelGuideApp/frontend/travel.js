// Function to fetch data from the API
async function fetchData() {
    try {
        const response = await fetch('http://127.0.0.1:5000/places');
        const data = await response.json();
        return data;
    } catch (error) {
        console.error('Error fetching data:', error);
    }
}

// Function to dynamically generate HTML table
async function generateTable() {
    const travelPlaces = await fetchData();

console.log(travelPlaces);

    let tableHtml = `
        <table border="1" style="width: 55%">
            <thead>
                <tr>
                    <th>Country</th>
                    <th>City</th>
                    <th>Must See Places</th>
                </tr>
            </thead>
            <tbody>`;

    // Loop through the array and populate the table rows
    travelPlaces.forEach(place => {
        tableHtml += `
            <tr>
                <td>${place[1]}</td>
                <td>${place[2]}</td>
                <td>${place[3]}</td>
            </tr>`;
    });

    // Close the table
    tableHtml += `
            </tbody>
        </table>`;

    return tableHtml;
}

// Get the HTML element to display the table
const tableContainer = document.getElementById('table-container');

// Call the generateTable function and set the generated table HTML to the container
generateTable().then(html => {
    tableContainer.innerHTML = html;
});