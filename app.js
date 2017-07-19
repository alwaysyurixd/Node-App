var express = require("express");
var mysql = require("mysql");
var bodyParser = require("body-parser");

console.log("AQUI ESTOY");

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'bdcs'
});

console.log("AQUI ESTOY");

var app = express();

app.use(bodyParser.json()); // to support JSON-encoded bodies
app.use(bodyParser.urlencoded({ extended: true })); // to support URL-encoded bodies

var GCM = require('./gcm.js');
var gcm = new GCM('AIzaSyCQYD3Npron6xO4PiaseIjKcGo1Mje9IXw');
global.gcm = gcm;

console.log("AQUI ESTOY");
app.get("/", function(req, res) {
    var response = {};
    response.code = "fail";
    response.error = "";
    response.data = []
    data = connection.query("SELECT * FROM usuario", function(error, rows, fields) {
        if (!!error) {
            response.error = error;
            console.log("Error in query");
        } else {
            response.code = "ok";
            for (var i = 0; i < rows.length; i++) {
                //Agrega cada fila al array data de response
                response.data.push({ usuario: rows[i].usuario, password: rows[i].password });
            }
        }

        res.send(response);
    });
});
console.log("AQUI ESTOY");
app.post("/search", function(req, res) {
    var response = {};
    response.code = "fail";
    response.error = "";
    response.data = []
    data = connection.query("SELECT * FROM user WHERE username=?", [req.body.name], function(error, rows, fields) {
        if (!!error) {
            response.error = error;
            console.log("Error in query");
        } else {
            response.code = "ok";
            for (var i = 0; i < rows.length; i++) {
                //Agrega cada fila al array data de response
                response.data.push({ username: rows[i].username, password: rows[i].password });
            }
        }

        res.send(response);
    });
});

app.post("/general/login", function(req, res) {
    var response = {};
    response.code = "fail";
    response.error = "";
    response.data = [];

    //Cada '=?' es para ingresar un parámetro 
    data = connection.query("SELECT U.usuario, U.password, P.nombres, P.apellidos, U.tipo FROM usuario U inner join empleado E on U.idEmpleado = E.idEmpleado inner join persona P on P.idPersona = E.idPersona WHERE usuario=? AND password=? LIMIT 1", [req.body.usuario, req.body.password], function(error, rows, fields) {
        if (!!error || rows.length < 1) {
            response.error = error;
            console.log("Error in query");
        } else {
            response.code = "ok";
            console.log(rows.length);
            for (var i = 0; i < rows.length; i++) {
                //Agrega cada fila al array data de response
                response.data.push({ usuario: rows[i].usuario, password: rows[i].password, nombres: rows[i].nombres, apellidos: rows[i].apellidos, tipo: rows[i].tipo });
            }
        }
        res.send(response);
    });
});

app.post("/store/equipo/registro", function(req, res) {
    var response = {};
    response.code = "fail";
    response.error = "";
    response.data = [];

    //Cada '=?' es para ingresar un parámetro 
    console.log("Recibí: "+req.body);
    data = connection.query("INSERT INTO equipo (codigoSAP, descripcion, stock, unidadMedida, estado) VALUES ('" + req.body.codigoSAP + "','" + req.body.descripcion + "'," + req.body.stock + ",'" + req.body.unidadMedida + "','" + req.body.estado + "')", function(error, rows, fields) {;
        if (!!error || rows.length < 1) {
            response.error = error;
            console.log("Error in query" + error.message);
        } else {
            response.code = "ok";
            console.log(rows.length);
        }
        res.send(response);
    });
});

app.post("/store/equipo/listaequipo", function(req, res) {
    var response = {};
    response.code = "fail";
    response.error = "";
    response.data = [];

    //Cada '=?' es para ingresar un parámetro 
    data = connection.query("SELECT stock, codigoSAP, descripcion FROM equipo", function(error, rows, fields) {
        if (!!error || rows.length < 1) {
            response.error = error;
            console.log("Error in query");
        } else {
            response.code = "ok";
            console.log(rows.length);
            for (var i = 0; i < rows.length; i++) {
                //Agrega cada fila al array data de response
                response.data.push({ stock: rows[i].stock, codigoSAP: rows[i].codigoSAP, descripcion: rows[i].descripcion });
            }
        }
        res.send(response);
    });
});

app.post("/store/empleado/registro", function(req, res) {
    var response = {};
    response.code = "fail";
    response.error = "";
    response.data = [];

    var id = 0;
    var exists = false;


    //Cada '=?' es para ingresar un parámetro 
    data = connection.query("INSERT INTO persona (nombres, apellidos, dni, email, telefono) VALUES ('" + req.body.nombres + "','" + req.body.apellidos + "','" + req.body.dni + "','" + req.body.email + "','" + req.body.telefono + "')", function(error, rows1, fields) {
        if (!!error || rows1.length < 1) {
            response.error = error;
            console.log("Error in query: "+error);
        } else {
            data = connection.query("SELECT CAST(MAX(idPersona) AS UNSIGNED) as id FROM persona LIMIT 1", function(error, rows, fields) {;
                if (!!error || rows.length < 1) {
                    response.error = error;
                    console.log("Error in query 2" + error.message);
                } else {
                    //response.code = "ok";
                    console.log("row "+ rows[0].id);
                    var id = rows[0].id;
                    console.log(rows.length + 'here');
                    data = connection.query("INSERT INTO empleado (cargo, estado, idPersona) VALUES ('" + req.body.cargo + "','D'," + id + ")", function(error, rows2, fields) {
                        if (!!error || rows2.length < 1) {
                            response.error = error;
                            console.log("Error in query 5: " + id);
                        } else {
                            response.code = "ok";
                            console.log('Pasé');
                        }
                        res.send(response);
                    });
                }
                //res.send(response);
            });
        }
        //res.send(response);
    });
});

app.post("/store/registroempleado", function(req, res) {
    var response = {};
    response.code = "fail";
    response.error = "";
    response.data = [];

    //Cada '=?' es para ingresar un parámetro 
    data = connection.query("INSERT INTO tecnico (nombres, apellidos, dni) VALUES ('" + req.body.nombres + "','" + req.body.apellidos + "','" + req.body.dni + "')", function(error, rows, fields) {;
        if (!!error || rows.length < 1) {
            response.error = error;
            console.log("Error in query" + error.message);
        } else {
            response.code = "ok";
            console.log(rows.length);
        }
        res.send(response);
    });
});

app.post("/operative/equipo/listaequipo", function(req, res) {
    var response = {};
    response.code = "fail";
    response.error = "";
    response.data = [];

    //Cada '=?' es para ingresar un parámetro 
    data = connection.query("SELECT * FROM tecnico", function(error, rows, fields) {
        if (!!error || rows.length < 1) {
            response.error = error;
            console.log("Error in query");
        } else {
            response.code = "ok";
            console.log(rows.length);
            for (var i = 0; i < rows.length; i++) {
                //Agrega cada fila al array data de response
                response.data.push({ nombres: rows[i].nombres, apellidos: rows[i].apellidos, dni: rows[i].dni });
            }
        }
        res.send(response);
    });
});

app.post("/store/empleado/listaempleado", function(req, res) {
    var response = {};
    response.code = "fail";
    response.error = "";
    response.data = [];

    //Cada '=?' es para ingresar un parámetro 
    data = connection.query("SELECT U.usuario as usuario, P.nombres as nombres, P.apellidos as apellidos, E.cargo as cargo FROM persona P inner join empleado E on P.idPersona = E.idPersona inner join usuario U on U.idEmpleado = E.idEmpleado", function(error, rows, fields) {
        if (!!error || rows.length < 1) {
            response.error = error;
            console.log("Error in query");
        } else {
            response.code = "ok";
            console.log(rows.length);
            for (var i = 0; i < rows.length; i++) {
                //Agrega cada fila al array data de response
                response.data.push({ usuario: rows[i].usuario, nombres: rows[i].nombres, apellidos: rows[i].apellidos, cargo: rows[i].cargo });
            }
        }
        res.send(response);
    });
});

app.post("/store/lote/registro", function(req, res) {
    var response = {};
    response.code = "fail";
    response.error = "";
    response.data = [];

    //Cada '=?' es para ingresar un parámetro 
    data = connection.query("INSERT INTO lote ( codigo) VALUES ('" + req.body.codigo+"')", function(error, rows, fields) {;
        if (!!error || rows.length < 1) {
            response.error = error;
            console.log("Error in query" + error.message);
        } else {
            response.code = "ok";
            console.log(rows.length);
        }
        res.send(response);
    });
});

/// listar lote 


app.post("/store/lote/listar", function(req, res) {
    var response = {};
    response.code = "fail";
    response.stadistics = {};
    response.error = "";
    response.data = [];

    //Cada '=?' es para ingresar un parámetro 
    data = connection.query("SELECT idlote, codigo, fechaRegistro FROM lote ", function(error, rows, fields) {
        if (!!error || rows.length < 1) {
            response.error = error;
            console.log("Error in query");
        } else {
            response.code = "ok";
            console.log(rows.length);
            for (var i = 0; i < rows.length; i++) {
                //Agrega cada fila al array data de response
response.data.push({ id: rows[i].idlote ,codigo: rows[i].codigo, fechaRegistro: rows[i].fechaRegistro });
           

               }
        }

        res.send(response);
    });
});


app.post("/notify/send", function(req, res){
    var response = {};
    response.code = "fail";
    response.error = "";
    response.data = [];
    response.stadistics = {};
    ids = [];
    //ids.push(req.body.token1);
    //ids.push(req.body.token2);


    data = connection.query("SELECT usuario, token FROM usuario ", function(error, rows, fields) {
        if (!!error || rows.length < 1) {
            response.error = error;
            console.log("Error in query");
        } else {
            response.code = "ok";
            console.log(rows.length);
            for (var i = 0; i < rows.length; i++) {
                //Agrega cada fila al array data de response
                response.data.push({ usuario: rows[i].usuario ,token: rows[i].token});
                ids.push(rows[i].token);
            }

            var msg = {
                registration_ids: ids,
                collapse_key: "your_collapse_key",
                time_to_live: 180,
                notification: {
                    title: "Noticia desde NodeJS",
                    body: "Descripcion de la noticia del servidor"
                }
            };

            gcm.send(msg, function( err, respons){ 
                console.log("Mensaje: ", msg);

                response.stadistics = {};
                stadistics = {
                    success : respons.success,
                    failure: respons.failure
                }
                /*response.stadistics.success = "";
                response.stadistics.success = ();
                response.stadistics.failrure = "";
                response.stadistics.failrure= respons.failrure;    */
                response.stadistics = stadistics;


                console.log("-----------------------------");
                console.log("RESPONSE: ", respons);
                console.log("RESPONSE: ", response.stadistics);
                res.send(response);
            });

        }

        //res.send(response);
    });

    

    
});

app.listen(8080, function(req, res) {
    console.log("Server 8080");
    connection.connect(function(err) {
        if (!!err) {
            console.log(err);
        } else {
            console.log("Conected to DB");
        }
    });
});