// Ejecicio 4

const fs = require("fs");
const rawdata = fs.readFileSync("../TP-07/pesonas.json", "utf8");
var persona = JSON.parse(rawdata);

getNombre(persona);

function getNombre(listadepersonas) {
  for (var i = 0; i < listadepersonas["personas"].length; i++) {
    if (listadepersonas["personas"][i]["Localidad"] === "Posadas") {
      console.log(
        listadepersonas["personas"][i]["nombre"] +
          " " +
          listadepersonas["personas"][i]["Apellido"]
      );
    }
  }
}
