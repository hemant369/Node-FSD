const { Queue } = require('@datastructures-js/queue');

let queueobj = new Queue();

let request = {};

// Adding in the Queue
request = { name: "Ryan", id: 15, number: 12345, description: "Currently Available", date: "08-12-2024", time: "12:22 PM" };
queueobj.enqueue(request);
request = { name: "Scott", id: 16, number: 12656, description: "Currently Not Available", date: "15-10-2024", time: "10:00 AM" };
queueobj.enqueue(request);
request = { name: "Alex", id: 17, number: 12435, description: "Currently Available", date: "16-05-2024", time: "04:00 PM" };
queueobj.enqueue(request);

// Removing
let removedRequest = queueobj.dequeue();
console.log("Deleted Request:")
console.log("----------------")
console.log(`Name : ${removedRequest.name}, Number: ${removedRequest.number}, Description : ${removedRequest.description}, Date: ${removedRequest.date}, Time: ${removedRequest.time}`);

console.log(" ")

// Display
console.log("Updated Queue:");
console.log("--------------") 
for (let item of queueobj.toArray()) {
    console.log(`Name : ${item.name}, Number: ${item.number}, Description : ${item.description}, Date: ${item.date}, Time: ${item.time}`);
}

// ******************************************************************************************************************************************************************************

const { Stack } = require('@datastructures-js/stack');

let browserHistory = new Stack();

function addEntry(url, date, time) {
    let entry = { url, date, time };
    browserHistory.push(entry);
}

function removeEntry() {
    let remove = browserHistory.pop();
    console.log("Delete Entry:");
    console.log(`Url: ${remove.url}, Date: ${remove.date}, Time: ${remove.time}`);
    console.log("--------------");
}

function displayEntry() {
    console.log("Updated Browser History:");
    console.log("------------------------")
    for (let entry of browserHistory.toArray()) {
        console.log(`Url: ${entry.url}, Date: ${entry.date}, Time: ${entry.time}`);
    }
}

addEntry("https://www.google.com", "10-02-2024", "12:00 PM");
addEntry("https://www.youtube.com", "11-02-2024", "01:30 PM");
addEntry("https://www.yahoo.com", "04-01-2024", "02:45 PM");
removeEntry();
displayEntry();

// *******************************************************************************************************************************************************

let flightDetails = new Map();

flightDetails.set('AR456', { source: 'Hyderabad', destination: 'Bangalore', date: '05-09-2024', time: '18:00' });
flightDetails.set('GF596', { source: 'Mumbai', destination: 'Delhi', date: '11-04-2024', time: '20:30' });

function flightStatus(flightNumber, currentTime) {
    if (flightDetails.has(flightNumber)) {
        let flight = flightDetails.get(flightNumber);
        let flightTime = flight.time;
        if (currentTime > flightTime) {
            console.log(`The Flight Number ${flightNumber} has already left from ${flight.source} to ${flight.destination}`);
        } else {
            console.log(`The Flight Number ${flightNumber} is leaving at ${flight.time} from ${flight.source} to ${flight.destination}`);
        }
    } else {
        console.log(`Invalid flight number: ${flightNumber}`);
    }
}

let flightNumber = 'AR456';
let time = "17:00";
flightStatus(flightNumber,time);