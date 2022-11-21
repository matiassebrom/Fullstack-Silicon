// Ejecicio 4

const fs = require("fs");
const rawdata = fs.readFileSync("../TP-07/pesonas.json", "utf8");
var persona = JSON.parse(rawdata);

getNombre(persona);

function getNombre(listadepersonas) {
  for (var i = 0; i < persona["personas"].length; i++) {
    if (persona["personas"][i]["Localidad"] === "Posadas") {
      console.log(
        persona["personas"][i]["nombre"] +
          " " +
          persona["personas"][i]["Apellido"]
      );
    }
  }
}
