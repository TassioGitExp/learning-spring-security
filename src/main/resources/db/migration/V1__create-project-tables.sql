CREATE TABLE IF NOT EXISTS carrinho (
  	id SERIAL NOT NULL UNIQUE,
  	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS usuario (
  	id SERIAL NOT NULL UNIQUE,
  	nome VARCHAR NOT NULL,
  	email VARCHAR NOT NULL UNIQUE,
  	senha VARCHAR NOT NULL,
  	saldo NUMERIC(2) DEFAULT 0,
  	id_carrinho INTEGER,
  	PRIMARY KEY (id),
  	FOREIGN KEY (id_carrinho) REFERENCES carrinho(id)
);

CREATE TABLE IF NOT EXISTS administrador (
  	id SERIAL NOT NULL UNIQUE,
  	nome VARCHAR NOT NULL,
  	email VARCHAR NOT NULL UNIQUE,
  	senha VARCHAR NOT NULL,
  	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS produto (
  	id SERIAL NOT NULL UNIQUE,
  	nome VARCHAR NOT NULL,
  	preco NUMERIC(2) not NULL,
  	qnt_estoque INTEGER DEFAULT 0,
  	descricao VARCHAR DEFAULT '',
  	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS produto_tags (
  	tag VARCHAR UNIQUE,
  	id_produto INTEGER not NULL UNIQUE,
  	PRIMARY KEY (id_produto, tag),
  	FOREIGN key (id_produto) REFERENCES produto (id)
);

CREATE TABLE IF NOT EXISTS carrinho_produto (
  	id SERIAL NOT NULL UNIQUE,
  	id_carrinho INTEGER NOT NULL UNIQUE,
  	id_produto INTEGER NOT NULL UNIQUE,	
  	quantidade INTEGER DEFAULT 1,
  	PRIMARY KEY (id),
  	FOREIGN key (id_carrinho) REFERENCES carrinho (id),
  	FOREIGN key (id_produto) REFERENCES produto (id)
);

CREATE TABLE IF NOT EXISTS compra (
  	id SERIAL NOT NULL UNIQUE,
  	id_user INTEGER NOT NULL UNIQUE,
  	data_compra DATE NOT NULL UNIQUE,	
  	PRIMARY KEY (id),
  	FOREIGN key (id_user) REFERENCES usuario (id)
);

CREATE TABLE IF NOT EXISTS compra_produto (
  	id SERIAL NOT NULL UNIQUE,
  	id_compra INTEGER NOT NULL UNIQUE,
  	id_produto INTEGER NOT NULL UNIQUE,	
  	PRIMARY KEY (id),
  	FOREIGN key (id_compra) REFERENCES compra (id),
  	FOREIGN key (id_produto) REFERENCES produto (id)
);