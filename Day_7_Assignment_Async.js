const axios = require('axios');

function randomNumber() {
    return Math.floor(Math.random() * 50) + 1;
}
function checkNumber() {
    return new Promise((resolve, reject) => {
        const number = randomNumber();
        console.log(number);
        if (number % 5 == 0) {
            resolve(randomNumber);
        }
        else {
            reject(number + " is not a Multiple of 5");
        }
    }
    );
}
checkNumber().then((number) => {
    console.log(number + " is a multiple of 5");
})
    .catch((error) => {
        console.log("Error: " + error)
    });


// -----------------------------------------------------------------------------------------------------


let url = "https://reqres.in/api/users/";

axios.get(url).then((resData) => {
    console.log(resData.data);
})

// ---------------------------------------------------------------------------------------

async function getData() {
    try {
        let url = "https://reqres.in/api/users/";
        const resData = await axios.get(url);
        console.log(resData.data);
    }
    catch (error) {
        console.log("Error getting data" + error);
    }
}
getData();

// ------------------------------------------------------------------------------------------

 async function getCustomerByCountry(givenCountry) {
    let url = "https://www.w3schools.com/angular/customers.php";
    const resData = await axios.get(url);
    let customerArray = resData.data.records;
    for (let item of customerArray) {
        if (item.Country == givenCountry)
            console.log(`Name : ${item.Name}, City: ${item.City}, Country: ${item.Country}`);
    }
}
getCustomerByCountry("Brazil");