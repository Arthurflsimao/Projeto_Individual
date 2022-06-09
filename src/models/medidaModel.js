var database = require("../database/config");


function votar(idCinema){
    instrucaoSql = `INSERT INTO
    votacao (fkCinema)
    VALUES (${idCinema})`;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarUltimasMedidas(idCinema) {
    instrucaoSql = `select nome, 
    ROUND((count(fkCinema) / t.total * 100),1) as porcentagem,
   count(fkCinema) as id 
        from cinema
            join votacao
                on fkCinema = idCinema,
                    ( SELECT COUNT(fkCinema) as total from votacao) t
 group by fkCinema`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idCinema) {
    instrucaoSql = `select 
    select nome, count(fkCinema) as id from Cinema
    join votacao
    on fkCinema = ${idCinema}
    group by fkCinema
    order by fkCinema`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    votar,
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}