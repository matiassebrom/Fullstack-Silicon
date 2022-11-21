// Ejecicio 1

const fs = require("fs");
let rawdata = fs.readFileSync("../TP-07/pesonas.json");
let persona = JSON.parse(rawdata);
console.log(rawdata);
//console.log(persona);
//<Buffer 7b 0d 0a 20 20 20 20 22 70 65 72 73 6f 6e 61 73 22 3a 20 5b 0d 0a 20 20 20 20 20 20 7b 0d 0a 20 20 20 20 20 20 20 20 22 6e 6f 6d 62 72 65 22 3a 20 22 ... 846 more bytes>

//console.log(JSON.stringify(rawdata));

console.log(JSON.parse(rawdata));

// JSON.stringify()
//El método JSON.stringify() convierte un objeto o valor de JavaScript en una cadena de texto JSON,
// opcionalmente reemplaza valores si se indica una función de reemplazo, o si se especifican las propiedades mediante un array de reemplazo.

//JSON.parse()
// El método JSON.parse() analiza una cadena de texto como JSON, transformando opcionalmente el valor producido por el análisis.
