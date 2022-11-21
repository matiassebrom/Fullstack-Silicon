// Ejecicio 4

const fs = require("fs");
const rawdata = fs.readFileSync("../TP-07/departamentos.json", "utf8");
let departamentos = JSON.parse(rawdata);

getDepartamento(departamentos);

function getDepartamento(departamentos) {
  for (
    var i = 0;
    i < departamentos["departamentos"][1]["Tecnologia"].length;
    i++
  ) {
    console.log(
      departamentos["departamentos"][1]["Tecnologia"][i]["nombre"] +
        " " +
        departamentos["departamentos"][1]["Tecnologia"][i]["puesto"]
    );
  }
}
