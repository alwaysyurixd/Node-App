var mysql = require("mysql");

var mysqlConfig = {
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'safestoreDB'
};

//Connect to mysql database
connectToDB = function(){
    connection = mysql.createConnection(mysqlConfig);
}