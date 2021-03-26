CREATE TABLE categoriaproduto
(
  codcategoria serial NOT NULL,
  descricaocat character varying(100) NOT NULL,
  CONSTRAINT pk_categoriaproduto PRIMARY KEY (codcategoria));



CREATE TABLE cidade
(
  codcidade serial NOT NULL,
  nome character varying(100) NOT NULL,
  estado character varying(100) NOT NULL,
  CONSTRAINT cidade_pkey PRIMARY KEY (codcidade));
      

CREATE TABLE unidademedida
(
  codunidademedida serial NOT NULL,
  nomeunidade character varying(100) NOT NULL,
  statusunidade character varying(100),
  CONSTRAINT unidademedida_pkey PRIMARY KEY (codunidademedida));

CREATE TABLE usuariosistema
(
  idusuario serial NOT NULL,
  nomeusuario character varying(100) NOT NULL,
  login character varying(100) NOT NULL,
  senha character varying(20) NOT NULL,
  situacao boolean,
  CONSTRAINT pk_usuariosistema PRIMARY KEY (idusuario));

CREATE TABLE cliente
(
  idcliente serial NOT NULL,
  nomecli character varying(90) NOT NULL,
  sexo character varying(45),
  idade integer,
  celular character varying(20),
  cpf character varying(20),
  enderecocli character varying(90),
  cidade character varying(45),
  estado character varying(45),
  CONSTRAINT pk_cliente PRIMARY KEY (idcliente));



CREATE TABLE fornecedor
(
  idfornecedor serial NOT NULL,
  razaosocial character varying(120) NOT NULL,
  pessoaresponsavel character varying(75),
  cnpj character varying(20),
  email character varying(60),
  site character varying(90),
  fonefornec character varying(90),
enderecofornec character varying(90),
  cidade character varying(45),
  estado character varying(45),
  CONSTRAINT pk_fornecedor PRIMARY KEY (idfornecedor));



CREATE TABLE produto
(
  idproduto serial NOT NULL,
 nomeprod character varying(100) NOT NULL,
  descricaoprod character varying(100),
codcategoriaproduto integer NOT NULL,
  codunidademedida integer NOT NULL,
  precoprod numeric(10,4),
  dataprimeiravenda date,
  CONSTRAINT pk_produto PRIMARY KEY (idproduto),
  CONSTRAINT fk_codcategoriaproduto_produto FOREIGN KEY (codcategoriaproduto)
      REFERENCES categoriaproduto (codcategoria) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_codunidademedida_produto FOREIGN KEY (codunidademedida)
      REFERENCES unidademedida (codunidademedida) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE estoque
(
  idestoque serial NOT NULL,
  idfornecedor integer NOT NULL,
  nomesuprimento character varying(90) NOT NULL,
  precoestoque numeric(10,4) NOT NULL,
  validade date,
  quantidadeestoque integer,
  CONSTRAINT pk_estoque PRIMARY KEY (idestoque),
  CONSTRAINT fk_idfornecedor_estoque FOREIGN KEY (idfornecedor)
      REFERENCES fornecedor (idfornecedor) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION);


CREATE TABLE venda
(
  idvenda integer NOT NULL,
  idproduto integer NOT NULL,
  idcliente integer NOT NULL,
  quantidadevenda numeric(10,3) NOT NULL,
  valorunit numeric(10,3),
  valortotalvenda numeric(10,3),
  datavenda date,
  CONSTRAINT pk_venda PRIMARY KEY (idvenda, idproduto),
  CONSTRAINT fk_idcliente_venda FOREIGN KEY (idcliente)
      REFERENCES cliente (idcliente) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


INSERT INTO usuariosistema(
            idusuario, nomeusuario, login, senha, situacao)
    VALUES (DEFAULT, 'Administrador', 'admin', '1234', true);
