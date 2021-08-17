select * from estoque

INSERT INTO public.estoque (quantidade, vencimento, id_produto) values (20, '20-10-2021', 1)
INSERT INTO public.estoque (quantidade, vencimento, id_produto) values (50, '20-10-2022', 2)
INSERT INTO public.estoque (quantidade, vencimento, id_produto) values (100, '10-10-2022', 3)
INSERT INTO public.estoque (quantidade, vencimento, id_produto) values (20, '10-08-2021', 4)
INSERT INTO public.estoque (quantidade, vencimento, id_produto) values (50, '20-08-2021', 5)
INSERT INTO public.estoque (quantidade, vencimento, id_produto) values (100, '10-10-2022', 6)

TRUNCATE TABLE estoque CASCADE;
DROP TABLE estoque

-------------------------------------------------------------------------

select * from grupo_produto

INSERT INTO public.grupo_produto (name) values ('espetinho')
INSERT INTO public.grupo_produto (name) values ('Refrigerante')
INSERT INTO public.grupo_produto (name) values ('Cerveja')

TRUNCATE TABLE grupo_produto CASCADE;
DROP TABLE grupo_produto

-------------------------------------------------------------------------
	
select * from produtos

INSERT INTO public.produtos ( name, preço) values ( 'espetinho de porco', 5)
INSERT INTO public.produtos ( name, preço) values ( 'espetinho de boi', 6)
INSERT INTO public.produtos ( name, preço) values ( 'Coca-Cola', 10)
INSERT INTO public.produtos ( name, preço) values ( 'Guarana', 10)
INSERT INTO public.produtos ( name, preço) values ( 'Heineken', 12)
INSERT INTO public.produtos ( name, preço) values ( 'Skol', 8)

TRUNCATE TABLE produtos CASCADE;
ALTER TABLE produtos DROP COLUMN quantidade

-------------------------------------------------------------------------

select * from mesas

INSERT INTO public.mesas (numero) values (1)
INSERT INTO public.mesas (numero) values (2)
INSERT INTO public.mesas (numero) values (3)
INSERT INTO public.mesas (numero) values (4)

TRUNCATE TABLE mesas CASCADE;

-------------------------------------------------------------------------

select * from usuarios_cadastrados

INSERT INTO public.usuarios_cadastrados (name, email, telefone, senha) values ('Alexandre', 'alemoura23@hotmail.com', 975805400, 12345)
INSERT INTO public.usuarios_cadastrados (name, email, telefone, senha) values ('Debora', 'debora@hotmail.com', 975805422, '11111')
INSERT INTO public.usuarios_cadastrados (name, email, telefone, senha) values ('Moura', 'm@gmail.com', 975805666, '15952')

TRUNCATE TABLE usuarios_cadastrados CASCADE;

-------------------------------------------------------------------------

select * from pedido_usuario

INSERT INTO public.pedido_usuario (id_mesa, id_usuario_cadastrado, date_create) values (1, 1, now())
INSERT INTO public.pedido_usuario (id_mesa, id_usuario_cadastrado, date_create) values (1, 1, now())
INSERT INTO public.pedido_usuario (id_mesa, id_usuario_cadastrado, date_create) values (1, 1, now())

INSERT INTO public.pedido_usuario (id_mesa, id_usuario_cadastrado, date_create) values (2, 2, now())
INSERT INTO public.pedido_usuario (id_mesa, id_usuario_cadastrado, date_create) values (2, 2, now())
INSERT INTO public.pedido_usuario (id_mesa, id_usuario_cadastrado, date_create) values (2, 2, now())

INSERT INTO public.pedido_usuario (id_mesa, id_usuario_cadastrado, date_create) values (3, 3, now())
INSERT INTO public.pedido_usuario (id_mesa, id_usuario_cadastrado, date_create) values (3, 3, now())
INSERT INTO public.pedido_usuario (id_mesa, id_usuario_cadastrado, date_create) values (3, 3, now())


TRUNCATE TABLE pedido_usuario CASCADE;

-------------------------------------------------------------------------

select * from pedidos_produtos

INSERT INTO public.pedidos_produtos (id_pedido_usuario, id_produto, quantidade, date_create) values (5, 7, 3, now())
INSERT INTO public.pedidos_produtos (id_pedido_usuario, id_produto, quantidade, date_create) values (6, 8, 2, now())
INSERT INTO public.pedidos_produtos (id_pedido_usuario, id_produto, quantidade, date_create) values (7, 9, 1, now())
INSERT INTO public.pedidos_produtos (id_pedido_usuario, id_produto, quantidade, date_create) values (8, 11, 5, now())
INSERT INTO public.pedidos_produtos (id_pedido_usuario, id_produto, quantidade, date_create) values (9, 10, 2, now())
INSERT INTO public.pedidos_produtos (id_pedido_usuario, id_produto, quantidade, date_create) values (10, 12, 5, now())
INSERT INTO public.pedidos_produtos (id_pedido_usuario, id_produto, quantidade, date_create) values (11, 11, 10, now())
INSERT INTO public.pedidos_produtos (id_pedido_usuario, id_produto, quantidade, date_create) values (12, 8, 5, now())
INSERT INTO public.pedidos_produtos (id_pedido_usuario, id_produto, quantidade, date_create) values (13, 7, 2, now())

TRUNCATE TABLE pedidos_produtos CASCADE;

-------------------------------------------------------------------------

SELECT * from forma_pagamento

INSERT INTO public.forma_pagamento (descrição) values ('debito')
INSERT INTO public.forma_pagamento (descrição) values ('credito')
INSERT INTO public.forma_pagamento (descrição) values ('dinheiro')

TRUNCATE TABLE forma_de_pagamento CASCADE;