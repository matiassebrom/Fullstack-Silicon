// Ejecicio 3

"use strict";
const fs = require("fs");
fs.readFile("../TP-07/pesonas.json", (err, data) => {
  if (err) throw err;
  //console.log(JSON.parse(data));
  //console.log(JSON.stringify(data));
});
//<Buffer 7b 0d 0a 20 20 20 20 22 70 65 72 73 6f 6e 61 73 22 3a 20 5b 0d 0a 20 20 20 20 20 20 7b 0d 0a 20 20 20 20 20 20 20 20 22 6e 6f 6d 62 72 65 22 3a 20 22 ... 846 more bytes>
