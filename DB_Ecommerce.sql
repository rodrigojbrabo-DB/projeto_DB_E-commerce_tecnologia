-- criação do banco de dados para o cenário de E-commerce
-- drop database ecommerce;
-- create database ecommerce;
-- use ecommerce;
 show tables;
 
-- cria tabela Cliente
create table Cliente(
	ID_Cliente int auto_increment primary key not null,
	Nome varchar(10) not null,
	Sobrenome varchar(30) not null,
	Email varchar(30) not null,
	CPF char(14),
    CNPJ char(18),
	Contato char(15) not null,
	Rua varchar(30) not null,
	Complemento varchar(10),
	Bairro varchar(20) not null,
	Cidade varchar(25) not null,
	Estado Char(2) not null,
	CEP char(9) not null,
	constraint unique_CPF_cliente unique (CPF),
    constraint unique_CNPJ_cliente unique (CNPJ)
);
alter table Cliente auto_increment=1;

-- cria tabela Fornecedor
	create table Fornecedor (
	ID_Fornecedor int auto_increment primary key not null,
    RazaoSocial varchar(20) not null,
    CNPJ char(18),
    Contato char(15) not null,
    Email varchar(30) not null,
	Rua varchar(30) not null,
	Complemento varchar(10),
	Bairro varchar(20) not null,
	Cidade varchar(25) not null,
	Estado Char(2) not null,
	CEP char(9) not null,
	constraint unique_estoque unique (CNPJ)
	);
    alter table Fornecedor auto_increment=1;
    
-- cria tabela Produto
Create table Produto (
	ID_Produto int auto_increment primary key not null,
    Categoria ENUM('Notebooks' , 'Desktop' , 'Servidores' , 'Thinclients' , 'Tablets' , 'Monitores') default 'Notebooks',
	Fabricante varchar(10) not null,
    Modelo varchar(15) not null,
    Cor ENUM('Preto' , 'Prata' , 'Cinza' , 'Branco') default 'Branco',
    Descricao text(500) not null,
    Valor decimal(10,2) not null default 0,
    Disponibilidade enum ('Disponível' , 'Indisponível') default 'Indisponível'
);
alter table Produto auto_increment=1;

-- cria tablea Pedido
create table Pedido ( 
	ID_Pedido int auto_increment,
    ID_PCliente int ,
    Status_Pedidos enum ('Cancelado','Confirmado','Processando','Pendente','Finalizado') default 'Pendente',
    Descricao_Pedido varchar(255) not null,
    Quantidade int not null default 0,
    Frete decimal(10,2) default 0 not null,
    Valor_Unitario decimal(10,2) not null default 0,
    Rastreamento varchar(10) default 0,
    Valor_Pedido decimal(10,2) generated always as ((Quantidade * Valor_unitario) + Frete) stored,
    primary key (ID_Pedido, ID_PCliente),
    constraint fk_Pedido_Cliente foreign key (ID_PCliente) references Cliente(ID_Cliente)
    );
    alter table Pedido auto_increment=1;
        
-- cria tabela Pagamento
Create table Pagamento (
	ID_Pagamento int auto_increment primary key,
    TipoPagamento enum('Boleto' , 'Cartão' , 'Link' , 'PIX') default 'Boleto',
    Parcelado enum('Sim' , 'Não') default 'Não',
    DataPagamento date
	);
    alter table Pagamento auto_increment=1;
    
-- Cria tabela estoque
create table Estoque(
	ID_Estoque int primary key auto_increment,
    Localizacao varchar(255),
    Quantidade int not null default 0
    );
    alter table Estoque auto_increment=1; 
    
-- Criar tabela Vendedor

create table Vendedor (
	ID_Vendedor int auto_increment primary key,
    Nome varchar(30) not null,
    Apelido varchar(15) not null,
    CNPJ char(18),
    CPF char(14),
	Telefone char(15) not null,
    Email varchar(40) not null,
    Endereco varchar(255),
    constraint unique_CNPJ_vendedor unique (CNPJ),
    constraint unique_CPF_vendedor unique (CPF),
    constraint unique_Apelido_vendedor unique (Apelido)
    );
    alter table Vendedor auto_increment=1;
    
-- Criar tabela Produto Vendedor
create table ProdutoVendedor (
	ID_PVvendedor int,
    ID_PVproduto int,
    Quantidade int not null default 0,
    PVStatus enum('Disponível' , 'Indisponível') default 'Indisponível',
    primary key (ID_PVproduto, ID_PVvendedor),
    constraint fk_PV_Vendedor foreign key (ID_PVvendedor) references Vendedor(ID_Vendedor),
    constraint fk_PV_produto foreign key (ID_PVproduto) references Produto(ID_Produto)
);
-- drop table PedidoProduto;
-- Criar tabela Pedido Produto
create table PedidoProduto(
    ID_PeProProduto int,
    ID_PeProPedido int,
    primary key (ID_PeProProduto, ID_PeProPedido),
    constraint fk_PePro_Pedido foreign key (ID_PeProPedido) references Pedido(ID_Pedido),
    constraint fk_PePro_Produto foreign key (ID_PeProProduto) references Produto(ID_Produto)
);

-- Criar tabela Estoque Local
create table EstoqueLocal(
	ID_ELProduto int,
    ID_ELEstoque int,
    ELLocalizacao varchar(255) not Null,
    primary key (ID_ELProduto, ID_ELEstoque),
    constraint fk_EL_Produto foreign key (ID_ELProduto) references Produto(ID_Produto),
    constraint fk_EL_Estoque foreign key (ID_ELEstoque) references Estoque(ID_Estoque)
);
-- drop table Poduto_Fornecedor;
-- Criar Tabela Produto Fornecedor
create table ProdutoFornecedor(
	ID_PF_Fornecedor int,
    ID_PF_Produto int,
    PFQuantidade int not null default 0,
    PFStatus enum('Disponível' , 'Indisponível') default 'Indisponível',
    primary key(ID_PF_Fornecedor, ID_PF_Produto),
    constraint fk_PF_Fornecedor foreign key (ID_PF_Fornecedor) references Fornecedor(ID_Fornecedor),
    constraint fk_PF_Produto foreign key (ID_PF_Produto) references Produto(ID_Produto)
);
-- drop table Pagamento_Cliente;
-- Criar Tabela Pagamento Cliente
create table Pagamento_Cliente(
	ID_PCPagamento int,
    ID_PCCliente int,
    primary key(ID_PCPagamento, ID_PCCliente),
    constraint fk_PC_Pagamento foreign key(ID_PCPagamento) references Pagamento(ID_Pagamento),
    constraint fk_PC_Cliente foreign key(ID_PCCliente) references Cliente(ID_Cliente)
);

-- Criar Tabela Pedido Pagamento
create table Pedido_Pagamento(
	ID_PPPagamento int,
    ID_PPPedido int,
    primary key(ID_PPPagamento, ID_PPPedido),
	constraint fk_PP_Pagamento foreign key(ID_PPPagamento) references Pagamento(ID_Pagamento),
    constraint fk_PP_Pedido foreign key( ID_PPPedido) references Pedido(ID_Pedido)
);

					