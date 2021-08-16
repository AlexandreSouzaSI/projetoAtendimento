CREATE TABLE "grupo_produto" (
  "id_grupo_produto" serial NOT NULL,
  "name" varchar,
  "date_create" TIMESTAMP,
  "date_update" TIMESTAMP,
  "date_delete" TIMESTAMP,
  "user_create" varchar,
  "user_update" varchar,
  "user_delete" varchar,
  PRIMARY KEY ("id_grupo_produto")
);


CREATE TABLE "estoque" (
  "id_estoque" serial NOT NULL,
  "id_produto" int,
  "quantidade" int,
  "vencimento" date,
  "date_create" TIMESTAMP,
  "date_upgrade" TIMESTAMP,
  "date_delete" TIMESTAMP,
  "user_create" varchar,
  "user_update" varchar,
  "user_delete" varchar,
  PRIMARY KEY ("id_estoque")
);

CREATE TABLE "forma_pagamento" (
  "id_forma_pagamento" serial NOT NULL,
  "descrição" varchar,
  "date_create" TIMESTAMP,
  "date_update" TIMESTAMP,
  "date_delete" TIMESTAMP,
  "user_create" varchar,
  "user_update" varchar,
  "user_delete" varchar,
  PRIMARY KEY ("id_forma_pagamento")
);

CREATE TABLE "produtos" (
  "id_produto" serial NOT NULL,
  "id_grupo_produto" int,
  "name" varchar,
  "quantidade" int,
  "preço" int,
  "date_create" TIMESTAMP,
  "date_update" TIMESTAMP,
  "date_delete" TIMESTAMP,
  "user_create" varchar,
  "user_update" varchar,
  "user_delete" varchar,
  PRIMARY KEY ("id_produto")
);

CREATE TABLE "usuarios_cadastrados" (
  "id_usuario_cadastrado" serial NOT NULL,
  "name" varchar,
  "email" varchar,
  "telefone" int,
  "senha" varchar,
  "date_create" TIMESTAMP,
  "date_update" TIMESTAMP,
  "date_delete" TIMESTAMP,
  "user_create" varchar,
  "user_update" varchar,
  "user_delete" varchar,
  PRIMARY KEY ("id_usuario_cadastrado")
);

CREATE TABLE "pedido_usuario" (
  "id_pedido_usuario" serial NOT NULL,
  "id_usuario_cadastrado" int,
  "id_mesa" int,
  "id_forma_pagamento" int,
  "preço_total" int,
  "date_create" TIMESTAMP,
  "date_update" TIMESTAMP,
  "date_delete" TIMESTAMP,
  "user_create" varchar,
  "user_update" varchar,
  "user_delete" varchar,
  PRIMARY KEY ("id_pedido_usuario")
);

CREATE TABLE "mesas" (
  "id_mesa" serial NOT NULL,
  "numero" int,
  "date_create" TIMESTAMP,
  "date_update" TIMESTAMP,
  "date_delete" TIMESTAMP,
  "user_create" varchar,
  "user_update" varchar,
  "user_delete" varchar,
  PRIMARY KEY ("id_mesa")
);


CREATE TABLE "pedidos_produtos" (
  "id_pedido_usuario" serial,
  "id_produto" serial,
  "quantidade" int,
  "date_create" TIMESTAMP,
  "date_update" TIMESTAMP,
  "date_delete" TIMESTAMP,
  "user_create" varchar,
  "user_update" varchar,
  "user_delete" varchar
);


SELECT * FROM pedidos_produtos
SELECT * FROM produtos
SELECT * FROM usuarios_cadastrados

ALTER TABLE "produtos" ADD CONSTRAINT "produtos_fk0" FOREIGN KEY ("id_grupo_produto") REFERENCES "grupo_produto"("id_grupo_produto");

ALTER TABLE "estoque" ADD CONSTRAINT "produtos_fk1" FOREIGN KEY ("id_produto") REFERENCES "produtos"("id_produto");

ALTER TABLE "pedido_usuario" ADD CONSTRAINT "pedido_usuario_fk0" FOREIGN KEY ("id_mesa") REFERENCES "mesas"("id_mesa");
ALTER TABLE "pedido_usuario" ADD CONSTRAINT "pedido_usuario_fk1" FOREIGN KEY ("id_usuario_cadastrado") REFERENCES "usuarios_cadastrados"("id_usuario_cadastrado");
ALTER TABLE "pedido_usuario" ADD CONSTRAINT "pedido_usuario_fk3" FOREIGN KEY ("id_forma_pagamento") REFERENCES "forma_pagamento"("id_forma_pagamento");

ALTER TABLE "pedidos_produtos" ADD CONSTRAINT "pedidos_produtos_fk0" FOREIGN KEY ("id_produto") REFERENCES "produtos"("id_produto");
ALTER TABLE "pedidos_produtos" ADD CONSTRAINT "pedidos_produtos_fk1" FOREIGN KEY ("id_pedido_usuario") REFERENCES "pedido_usuario"("id_pedido_usuario");