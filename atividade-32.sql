-- -------------------------------------------------
-- Tabela de usuários
-- -------------------------------------------------

CREATE TABLE `usuarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO usuarios (id,nome) VALUES 
(1,'João'),
(2,'Paulo'),
(3,'Manoel'),
(4,'Joaquim'),
(5,'Sebastião');

-- -------------------------------------------------
-- Tabela de lojas
-- -------------------------------------------------

CREATE TABLE `lojas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO lojas (nome) VALUES 
('Casas Maria'),
('Lojas Tem'),
('Belitardo Eletro');

-- -------------------------------------------------
-- Tabela de fornecedores
-- -------------------------------------------------

CREATE TABLE `fornecedores` (
  `id` int(10) unsigned NOT NULL,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO fornecedores (id,nome)
(1,'Épol'),
(2,'Semsunga'),
(3,'Déu');
	
-- -------------------------------------------------
-- Tabela de pedidos
-- -------------------------------------------------

CREATE TABLE `pedidos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  `usuario_id` int(10) unsigned NOT NULL,
  `loja_id` int(10) unsigned NOT NULL,
  `fornecedor_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedidos_FK_1` (`usuario_id`),
  KEY `pedidos_FK_2` (`loja_id`),
  KEY `pedidos_FK_3` (`fornecedor_id`),
  CONSTRAINT `pedidos_FK` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `pedidos_FK_1` FOREIGN KEY (`loja_id`) REFERENCES `lojas` (`id`),
  CONSTRAINT `pedidos_FK_2` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

INSERT INTO pedidos 
(id,descricao,usuario_id,loja_id,fornecedor_id)
VALUES 
(1,'Microondas',1,1,1),
(2,'Celular',1,2,2),
(3,'Notebook',2,3,3),
(4,'Mouse',3,2,2),
(5,'Teclado',4,3,3),
(6,'1 kg de carne',2,1,NULL),
(7,'Geladeira',1,1,3),
(8,'Sofá',2,2,2),
(9,'Cerveja',2,1,NULL),
(10,'10 pães',3,2,NULL);
