DROP DATABASE IF EXISTS db_produtos;

CREATE DATABASE db_produtos
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_unicode_ci;

USE db_produtos;

CREATE TABLE tb_cor(
	cd_cor INT(11) NOT NULL,
    nm_cor VARCHAR(45) NOT NULL,
    CONSTRAINT pk_cor
		PRIMARY KEY(cd_cor)
);

CREATE TABLE tb_categoria(
	cd_categoria INT(11) NOT NULL,
    nm_categoria VARCHAR(64) NOT NULL,
    cd_subcategoria INT(11),
		CONSTRAINT pk_categoria
			PRIMARY KEY(cd_categoria),
		CONSTRAINT fk_subcategoria_categoria
			FOREIGN KEY(cd_subcategoria)
			REFERENCES tb_categoria(cd_categoria)
);

CREATE TABLE tb_produto(
	cd_produto INT(11) NOT NULL,
    cd_item VARCHAR(32) NOT NULL,
    nm_produto VARCHAR(45) NOT NULL,
    dt_produto TIMESTAMP NOT NULL,
    vl_produto DECIMAL(12,2) NOT NULL,
    qt_estoque INT(11) NOT NULL,
    ic_status CHAR(1) NOT NULL,
    ds_amigavel VARCHAR(128),
    vl_envio DECIMAL(6,2),
    vl_taxa_extra DECIMAL(6,2),
    cd_categoria INT(11) NOT NULL,
		CONSTRAINT pk_produto
			PRIMARY KEY(cd_produto),
		CONSTRAINT fk_produto_categoria
			FOREIGN KEY(cd_categoria)
            REFERENCES tb_categoria(cd_categoria)
);

CREATE TABLE tb_imagem(
	cd_imagem INT(11) NOT NULL,
    nm_imagem VARCHAR(255) NOT NULL,
    dt_imagem TIMESTAMP NOT NULL,
    ic_principal CHAR(1) NOT NULL,
    cd_produto INT(11) NOT NULL,
		CONSTRAINT pk_imagem
			PRIMARY KEY(cd_imagem),
		CONSTRAINT fk_imagem_produto
			FOREIGN KEY(cd_produto)
            REFERENCES tb_produto(cd_produto)
);

CREATE TABLE tb_descricao(
	cd_descricao INT(11) NOT NULL,
    nm_descricao VARCHAR(300) NOT NULL,
    cd_produto INT(11) NOT NULL,
		CONSTRAINT pk_descricao
			PRIMARY KEY(cd_descricao),
		CONSTRAINT fk_descricao_produto
			FOREIGN KEY(cd_produto)
            REFERENCES tb_produto(cd_produto)
);

CREATE TABLE tb_detalhe(
	cd_detalhe INT(11) NOT NULL,
    nm_detalhe VARCHAR(64) NOT NULL,
    cd_produto INT(11) NOT NULL,
		CONSTRAINT pk_detalhe
			PRIMARY KEY(cd_detalhe),
		CONSTRAINT fk_detalhe_produto
			FOREIGN KEY(cd_produto)
            REFERENCES tb_produto(cd_produto)
);

CREATE TABLE tb_modelo(
	cd_modelo INT(11) NOT NULL,
    ic_disponivel CHAR(1) NOT NULL,
    dt_modelo DATE NOT NULL,
	qt_tamanho VARCHAR(30),
    qt_comprimento VARCHAR(30),
    qt_largura VARCHAR(30),
    qt_altura VARCHAR(30),
    qt_peso VARCHAR(30),
    cd_cor INT(11) NOT NULL,
    cd_produto INT(11) NOT NULL,
	CONSTRAINT pk_modelo
		PRIMARY KEY (cd_modelo),
	CONSTRAINT fk_modelo_cor
		FOREIGN KEY(cd_cor)
        REFERENCES tb_cor(cd_cor),
	CONSTRAINT fk_modelo_produto
		FOREIGN KEY(cd_produto)
			REFERENCES tb_produto(cd_produto)
);

INSERT INTO tb_cor VALUES
(1, 'Branco'),
(2, 'Preto'),
(3, 'Azul'),
(4, 'Verde'),
(5, 'Vermelho');

INSERT INTO tb_categoria VALUES
(1, 'Telefone', NULL),
(2, 'Celular', 1),
(3, 'Fixo', 1),
(4, 'Informática', NULL),
(5, 'PC/ Computador', 4),
(6, 'Notebook', 4),
(7, 'Bicicleta', NULL),
(8, 'Infantil', 7),
(9, 'Adulto', 7),
(10, 'Pet Shop', NULL),
(11, 'Cães', 10),
(12, 'Gatos', 10);

INSERT INTO tb_produto VALUES
(1, '012345-ABC', 'Quick', '2020-01-01 01:01:01', 299.99, 2, 'I', NULL, 33.81, NULL, 2),
(2, '678901-DEF', 'FinePhone', '2020-02-02 02:02:02', 142.89, 10, 'D', NULL, 14.99, 2.99, 3),
(3, '234567-GHI', 'CompAll', '2020-03-03 03:03:03', 3419.00, 3, 'D', NULL, 79.99, NULL, 5),
(4, '890123-JKL', 'AsNote', '2020-04-04 04:04:04', 1249.99,  4, 'D', NULL, 35.39, 58.88, 6),
(5, '456789-MNO', 'VulcanBike', '2020-05-05 05:05:05', 699.00, 5, 'D', 'Ecológico certificado pela Entidade das Bicicletas', 45.88, NULL, 8),
(6, '012345-PQR', 'ForesterBike', '2020-06-06 06:06:06', 1186.55, 6, 'D', 'Ecológico certificado pela Entidade das Bicicletas', 55.99, NULL, 9),
(7, '678901-STU', 'Big Bola', '2020-07-07 07:07:07', 38.55, 7, 'D', 'Ecológico certificado pela Entidade das Bolas de Pets', 5.88, NULL, 11),
(8, '234567-VWX', 'Arranhador', '2020-08-08 08:08:08', 64.00, 8, 'D', 'Ecológico certificado pela Entidade dos Arranhadores de Gatos', 25.00, 5.00, 12);

INSERT INTO tb_imagem VALUES
(1, 'twertyuio.jpg', '2020-01-01 01:01:01', 'S', 1),
(2, 'poiuytttt.jpg', '2020-01-01 01:01:01', 'N', 1),
(3, 'dfghjdfgd.jpg', '2020-02-02 02:02:02', 'S', 2),
(4, 'dfghjdfgh.jpg', '2020-02-02 02:02:02', 'N', 2),
(5, 'gfjhgdfgh.jpg', '2020-03-03 03:03:03', 'S', 3),
(6, 'dfghjkfgh.jpg', '2020-03-03 03:03:03', 'N', 3),
(7, 'cvbnjkfgh.jpg', '2020-04-04 04:04:04', 'S', 4),
(8, 'fghjkghjg.jpg', '2020-04-04 04:04:04', 'N', 4),
(9, 'kjhghjhgh.jpg', '2020-05-05 05:05:05', 'S', 5),
(10, 'pdfghhft.jpg', '2020-05-05 05:05:05', 'N', 5),
(11, 'fghjfghj.jpg', '2020-06-06 06:06:06', 'S', 6),
(12, 'pofghjft.jpg', '2020-06-06 06:06:06', 'N', 6),
(13, 'iughgkjh.jpg', '2020-07-07 07:07:07', 'S', 7),
(14, 'fghjfght.jpg', '2020-07-07 07:07:07', 'N', 7),
(15, 'dfghyjuo.jpg', '2020-08-08 08:08:08', 'S', 8),
(16, 'piuyoiuy.jpg', '2020-08-08 08:08:08', 'N', 8);

INSERT INTO tb_descricao VALUES
(1, 'Celular LG 2.0 MP 2 Chips', 1),
(2, 'Telefone com Fio Intelbras Pleno sem Chave', 2),
(3, 'Lenovo Intel Core i5 8265U 4 GB 1 TB Windows 10 23,8"', 3),
(4, 'Samsung Intel Core i3 7020U 15,6" 4GB HD 1 TB Windows 10 7ª Geração', 4),
(5, 'Bicicleta Caloi 21 Marchas Aro 24 Freio V-Brake', 5),
(6, 'Caloi Aro 29 Suspensão Dianteira Freio a Disco Mecânico', 6),
(7, 'Interativa Som Para Cachorros', 7),
(8, 'Feito para cantos é uma opção discreta e funcional. Protege o seu sofá e móveis sem restringir o instinto de arranhar do felino', 8);

INSERT INTO tb_detalhe VALUES
(1, 'LCD', 1),
(2, 'Flash', 2),
(3, 'Anti Reflexo', 3),
(4, 'Wi-Fi', 4),
(5, 'Suspensão Dianteira', 5),
(6,'21 Marchas', 6),
(7, 'PVC', 7),
(8, 'Protege o sofá', 8);

INSERT INTO tb_modelo VALUES
(1, 'I', '2020-01-01', NULL, '6.0', '9.0', '17.0', '322.0', 1, 1),
(2, 'D', '2020-02-02', NULL, '19.8', '14.0', '9.4', '422.0', 2, 2),
(3, 'D', '2020-03-03', NULL, '541.04', '185.0', '447.36', '5.87', 3, 3),
(4, 'D', '2020-04-04', NULL, '24.9', '24.9', '37.7', '1.9', 4, 4),
(5,'D', '2020-05-05', NULL, '135.0', '20.0', '70.0', '20.1', 5, 5),
(6, 'D', '2020-06-06', NULL, '65.0', '65.0', '100.0','15.20', 1, 1),
(7, 'D', '2020-07-07', NULL, '23.0', '15.0', '10.0', '499.0',2, 2),
(8, 'D', '2020-08-08', NULL, '25.0', '25.0', '56.0','1.08', 3, 3);
