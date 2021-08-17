SELECT * FROM pedidos_produtos

CREATE INDEX idx_pedidos_usuario ON pedido_usuario (date_create)
CREATE INDEX idx_usuarios_cadastrados ON usuarios_cadastrados (name, email)
CREATE INDEX idx_pedidos_produto ON pedidos_produtos (produto)

Listar Itens dos clientes por ordem de pedido

CREATE VIEW vw_listar_comidas AS
SELECT 
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
WHERE pedidos_produtos2.id_produto = 7 OR pedidos_produtos2.id_produto = 8
ORDER BY date_create

SELECT * FROM vw_listar_comidas
------------------------------------------------------------------------------------------------------------------------------------

Listar bebidas por ordem de pedido

CREATE VIEW vw_lista_bebida AS
SELECT 
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
ORDER BY date_create

SELECT * FROM produtos
------------------------------------------------------------------------------------------------------------------------------------


SELECT 
	name as Nome,
	numero as mesa,
	produto,
	quantidade,
	preço,
	(preço * quantidade) as preco_total
FROM pedido_usuario JOIN usuarios_cadastrados ON usuarios_cadastrados.id_usuario_cadastrado = pedido_usuario.id_usuario_cadastrado
JOIN pedidos_produtos pedidos_produtos2 ON pedidos_produtos2.id_pedido_usuario = pedido_usuario.id_pedido_usuario
JOIN produtos ON produtos.id_produto = pedidos_produtos2.id_produto
JOIN mesas ON mesas.id_mesa = pedido_usuario.id_mesa
GROUP BY nome, preço, numero, produto, quantidade
ORDER BY nome

------------------------------------------------------------------------------------------------------
CREATE VIEW vw_lista_total_por_usuario AS
SELECT 
	name as Nome,
	SUM(preço * quantidade) as Total
FROM pedido_usuario JOIN usuarios_cadastrados ON usuarios_cadastrados.id_usuario_cadastrado = pedido_usuario.id_usuario_cadastrado
JOIN pedidos_produtos pedidos_produtos2 ON pedidos_produtos2.id_pedido_usuario = pedido_usuario.id_pedido_usuario
JOIN produtos ON produtos.id_produto = pedidos_produtos2.id_produto
JOIN mesas ON mesas.id_mesa = pedido_usuario.id_mesa
GROUP BY nome
ORDER BY nome

SELECT * FROM vw_lista_total_por_usuario


DROP VIEW vw_lista_total_por_usuario
------------------------------------------------------------------------------------------------------
SELECT * FROM pedido_usuario

SELECT 
	SUBSTRING(CAST(pedido_usuario.date_create AS varchar), 1, 10) as data_pedido,
	SUM(preço * quantidade) as Total
FROM pedido_usuario JOIN usuarios_cadastrados ON usuarios_cadastrados.id_usuario_cadastrado = pedido_usuario.id_usuario_cadastrado
JOIN pedidos_produtos pedidos_produtos2 ON pedidos_produtos2.id_pedido_usuario = pedido_usuario.id_pedido_usuario
JOIN produtos ON produtos.id_produto = pedidos_produtos2.id_produto
JOIN mesas ON mesas.id_mesa = pedido_usuario.id_mesa
GROUP BY data_pedido

------------------------------------------------------------------------------------------------------

SELECT 
	SUBSTRING(CAST(pedido_usuario.date_create AS varchar), 1, 10) as data_pedido,
	quantidade,
	produto
FROM pedido_usuario JOIN usuarios_cadastrados ON usuarios_cadastrados.id_usuario_cadastrado = pedido_usuario.id_usuario_cadastrado
JOIN pedidos_produtos pedidos_produtos2 ON pedidos_produtos2.id_pedido_usuario = pedido_usuario.id_pedido_usuario
JOIN produtos ON produtos.id_produto = pedidos_produtos2.id_produto
JOIN mesas ON mesas.id_mesa = pedido_usuario.id_mesa
WHERE produtos.produto = 'Heineken'
GROUP BY  produto, quantidade, data_pedido
ORDER BY quantidade DESC



