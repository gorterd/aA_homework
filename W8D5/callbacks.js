// window.setTimeout( () => alert('HAMMERTIME'), 5000);

// function hammerTime(time) {
//     window.setTimeout( () => alert(`${time} is hammertime!`), time);
// }

const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

reader.question("Would you like some tea?  ", firstAns => {
    console.log(`You replied ${firstAns}.\n`);
    const first = (firstAns === "yes") ? "do" : "don't";
    
    reader.question("Would you like biscuits?  ", secondAns => {
        console.log(`You replied ${secondAns}.\n`);
        const second = (secondAns === "yes") ? "do" : "don't";

        console.log(`So you ${first} want tea and you ${second} want biscuits.\n`);
        reader.close();
    });
});