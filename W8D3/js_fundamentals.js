function madLib(verb, adj, noun){
    return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`;
}

function isSubstring(searchString, subString) {
    let subLength = subString.length;
    for (let i = 0; i <= searchString.length - subLength; i++){
        if (searchString.slice(i,i+subLength) === subString){
            return true;
        } 
    }

    return false;
}

function fizzBuzz(array){
    divs = [];
    array.forEach( (el) => {
        if (el % 3 === 0 || el % 5 === 0){
            if (!(el % 3 === 0 && el % 5 === 0)){
                divs.push(el);
            }
        }
    })

    return divs;
}