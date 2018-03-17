-- Comentarios
-- a linha abaixo cria um banco de dados
create database dbinfox;
-- a linha abaixo escolhe o banco de dados a ser utilizado
use dbinfox;
-- o bloco abaixo cria uma tabela
create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);
desc tbusuarios;
-- a linha abaixo insere dados na tabela
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(1,'Marcos Oliveira','98888-8888','marcos','123456');

select * from tbusuarios;

insert into tbusuarios(iduser,usuario,fone,login,senha)
values(2,'Administrador','98888-7777','admin','admin');

insert into tbusuarios(iduser,usuario,fone,login,senha)
values(3,'Bill Gates','98888-6666','bill','123456');

select * from tbusuarios;

-- a linha abaixo modifica dados na tabela
update tbusuarios set fone='97777-7777' where iduser = 2;
select * from tbusuarios;

-- a linha abaixo apaga um registri da tabela
delete from tbusuarios where iduser=3;
select * from tbusuarios;

create table tbclientes(
idcli int primary key auto_increment,
nomecli varchar(50) not null,
endcli varchar(100),
fonecli varchar(50) not null,
emailcli varchar(50)
);

desc tbclientes;
insert into tbclientes(nomecli,endcli,fonecli,emailcli)
values('Linus Torvalds','Rua Tux, 2017','95555-5555','linus@linux.com');

select * from tbclientes;

create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp,
equipamento varchar(150) not null,
defeito varchar(150) not null,
servico varchar(150),
tecnico varchar(30),
valor decimal(10,2),
idcli int not null,
foreign key(idcli) references tbclientes(idcli)
);

desc tbos;

insert into tbos(equipamento,defeito,servico,tecnico,valor,idcli)
values('Notebook','Não liga','Troca da fonte','Zé',87.50,1);

select * from tbos;

-- a linha abaixo traz informações de duas tabelas
select 
O.os,equipamento,defeito,servico,valor,
C.nomecli,foneCli
from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli);




