-- cenário modelo de Ecommerce apresentado no desafio
-- drop database Modelo_Ecommerce;
-- create database Modelo_Ecommerce;
-- use Modelo_Ecommerce;
 Show tables;

-- cria tabela Cliente
create table Clients(
		idClients int auto_increment primary key,
        Fname varchar(10),
        Minit char(3),
        Lname varchar(20),
        CPF char(11) not null,
        Adress varchar(30),
        constraint unique_cpf_client unique (CPF)
        );
alter table Clients auto_increment=1;
 select * from clients;
-- cria tabela Produto
-- Size = a dimensão do Produto
create table Product(
		idProduct int auto_increment primary key,
        Pname varchar(10) not null,
        Classification_Kid bool default false,
        category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos', 'Móveis'),
        avaliation float default 0,
        size varchar(10)
);
alter table Product auto_increment=1;

-- para ser continuado no desafio: termine de implementar a tabela e crie a conexão com as tabelas necessárias
-- alem disso, reflita essa modificação no diagrama de esquema relacional
-- crie constraints relacionadas ao pagamento
create table Payments(
		idPayment int,
        idPClients int,
        typePayment enum('Boleto', 'Cartão','Dois cartões'),
        limitAvaliable float,
        primary key(idPClients, idPayment),
        constraint fk_Payments_client foreign key (idPClients) references Clients(IdClients)
);
-- cria tablea Pedido
create table Orders(
		IdOrder int auto_increment primary key,
		IdOrderClient int,
		OrderStatus Enum('Cancelado', 'Confirmado','Em processamento') default 'Em Processamento',
		OrdersDescription varchar(255),
		sendValue float default 10,
        paymentCash bool default false,
constraint fk_orders_client foreign key (IdOrderClient) references Clients(IdClients)
);
alter table Orders auto_increment=1;

-- criar tabela estoque
create table ProductStorage(			
        IdProductStorage int auto_increment primary key,
		location varchar(255),
		quantity int default 0
);
alter table ProductStorage auto_increment=1;

-- criar tabela  fornecedor
create table Supplier(
		idSupplier int auto_increment primary key,
        SocialName varchar(255) not null,
        CNPJ char(15),
        contact varchar(11) not null,
        constraint unique_CNPJ_Supplier unique (CNPJ)
        );
alter table Supplier auto_increment=1;

-- criar tabela Vendedor
create table Saller(
		idSaller int auto_increment primary key,
        SocialName varchar(255) not null,
        AbstName varchar(255),
        CNPJ char(15),
        CPF char(9),
        Location varchar(255),
        contact varchar(11) not null,
        constraint unique_CNPJ_saller unique (CNPJ),
        constraint unique_CPF_saller unique (CPF)
        );
alter table Saller auto_increment=1;

-- criar tabela Produto Vendedor
create table ProductSaller(
		IDPsaller int, 
        IDPproduct int,
        ProdQuantity int default 1,
        primary key (IDPSaller, IDPproduct),
        constraint fk_product_seller foreign key(IDPsaller) references Saller(idSaller),
		constraint fk_product_product foreign key(IDPproduct) references Product(idProduct)
		);
		
-- criar tabela produto Pedido
create table productOrder(
		IdPOproduct int,
		IdPOorder int,
        poQuantity int default 1,
        poStatus enum('Disponível', 'Sem Estoque') default 'Disponível',
        primary key (IdPOproduct, IdPOorder),
        constraint fk_productorder_order foreign key(IdPOorder) references Orders(IdOrder),
		constraint fk_productorder_product foreign key(IdPOproduct) references Product(idProduct)
);		
-- criar tabela estoque Local
create table storageLocation(
		idLproduct int,
        idLstorage int,
        location varchar(255) not null,
        primary key (idLproduct, idLstorage),
        constraint fk_storage_Location_Product foreign key(idLproduct) references Product(idProduct),
		constraint fk_storage_Location_Storage foreign key(idLstorage) references productStorage(IdProductStorage)
);

-- criar tabela Produto fornecedor
create table productSupplier(
		idPsSupplier int,
        idPsProduct int,
        PsQuantity int not null,
        primary key(idPsSupplier, idPsProduct),
       constraint fk_product_supplier_supplier foreign key(idPsSupplier) references Supplier(idSupplier),
		constraint fk_product_supplier_Product foreign key(idPsProduct) references Product(idProduct)
);