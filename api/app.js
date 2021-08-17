const {Client} = require('pg');

const client = new Client({ 
    user: "postgres",
    password: "123",
    host: "localhost",
    port: 5432,
    database: "postgres"
});

client.connect()
.then(() => console.log("Conectado"))
.then(() => client.query(`SELECT 
name as Nome,
numero as Mesa,
produto,
quantidade,
preço,
pedidos_produtos2.date_create 
FROM pedido_usuario JOIN usuarios_cadastrados ON usuarios_cadastrados.id_usuario_cadastrado = pedido_usuario.id_usuario_cadastrado
JOIN pedidos_produtos pedidos_produtos2 ON pedidos_produtos2.id_pedido_usuario = pedido_usuario.id_pedido_usuario
JOIN produtos ON produtos.id_produto = pedidos_produtos2.id_produto
JOIN mesas ON mesas.id_mesa = pedido_usuario.id_mesa
WHERE pedidos_produtos2.id_produto != 7 AND pedidos_produtos2.id_produto != 8
ORDER BY date_create`))
.then(results => console.table(results.rows))
.catch(e => console.log(e))
.finally(() => client.end())

// INSERIR DADOS
/*client.connect()
.then(() => console.log("Inserindo Dados"))
.then(() => client.query(`INSERT INTO produtos (produto, preço) VALUES($1,$2)`,['Medalhão',5]))
.then(() => client.query(`SELECT * FROM produtos`)
.then(results => console.table(results.rows))
.catch(e => console.log(e))
.finally(() => client.end()))*/

// ALTERAR DADOS
/*client.connect()
.then(() => console.log("Alterando dados"))
.then(() => client.query(`UPDATE produtos SET produto=$1, preço=$2 WHERE id_produto = 15`,['Heineken',12]))
.then(() => client.query(`SELECT * FROM produtos`)
.then(results => console.table(results.rows))
.catch(e => console.log(e))
.finally(() => client.end()))*/

//DELETAR DADOS
/*client.connect()
.then(() => console.log("Deletando dados"))
.then(() => client.query(`DELETE FROM produtos WHERE id_produto = 14`))
.then(() => client.query(`SELECT * FROM produtos`)
.then(results => console.table(results.rows))
.catch(e => console.log(e))
.finally(() => client.end()))*/