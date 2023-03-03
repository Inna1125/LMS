create database if not exists LMS;

use LMS;

create table if not exists admin(
	ad_id varchar(15),
	ad_passwd varchar(15) not null,
	ad_name varchar(20) not null,
	primary key(ad_id)
);

create table if not exists company(
	c_code varchar(20),
	c_name varchar(30) not null,
	c_type varchar(20),
	c_countY int not null,
	c_countM int not null,
	c_limit char(1) not null,
	c_limscore int,
	primary key(c_code)
);

create table if not exists book(
	b_no int(4) unsigned zerofill auto_increment,
	b_code varchar(10) not null,
	b_name varchar(50) not null,
	b_author varchar(30) not null,
	b_pub varchar(30) not null,
	b_date date not null,
	b_price int not null,
	b_pageNo int not null,
	b_desc text not null,
	b_index text,
	b_comment text,
	b_image varchar(100),
	b_count int not null default 0,
	b_categoryF varchar(20) not null,
	b_categoryS varchar(20) not null,
	b_regDate date not null,
	b_purpose text,
	primary key(b_no)
);

create table if not exists member(
	m_no int auto_increment,
	m_id varchar(15) not null,
	m_name varchar(20) not null,
	m_passwd varchar(15) not null,
	m_zipNo varchar(8) not null,
	m_addr varchar(40) not null,
	m_addrDetail varchar(40) not null,
	m_tel varchar(15) not null,
	m_phone varchar(15) not null,
	m_email varchar(30) not null,
	m_sendOk char(1) not null,
	m_dept varchar(30) not null,
	m_position varchar(30) not null,
	m_countY int not null default 0,
	m_countM int not null default 0,
	m_pass char(1) not null default 'y',
	c_code varchar(20) not null,
	primary key(m_no),
	constraint m_c_fk foreign key(c_code) references company(c_code) on update cascade on delete cascade
);

create table if not exists report(
	r_no int auto_increment,
	r_date date not null,
	r_content text not null,
	r_score int not null,
	r_ip varchar(50) not null,
	r_done char(1) default 'n' not null,
	r_reply text,
	b_no int(4) unsigned zerofill not null,
	m_no int not null,
	primary key(r_no),
	constraint r_b_fk foreign key(b_no) references book(b_no) on update cascade on delete cascade,
	constraint r_m_fk foreign key(m_no) references member(m_no) on update cascade on delete cascade
);

create table if not exists ask(
	a_no int auto_increment,
	a_category varchar(30) ,
	a_title varchar(50) ,
	a_content text ,
	a_passwd int ,
	a_date datetime ,
	a_reply text,
	a_repNo int,
	a_repContent text,
	a_step int,
	ad_id varchar(15) ,
	m_no int not null,
	primary key(a_no),
	constraint a_ad_fk foreign key(ad_id) references admin(ad_id) on delete cascade,
	constraint a_m_fk foreign key(m_no) references member(m_no) on update cascade on delete cascade
);

create table if not exists heart(
	h_no int auto_increment,
	b_no int(4) unsigned zerofill not null,
	m_no int not null,
	primary key(h_no),
	constraint h_b_fk foreign key(b_no) references book(b_no) on update cascade on delete cascade,
	constraint h_m_fk foreign key(m_no) references member(m_no) on update cascade on delete cascade
);

create table if not exists class(
	cl_no int not null auto_increment,
	b_no int(4) unsigned zerofill not null,
	m_no int not null,
	cl_done char(1) not null default 'n',
	primary key(cl_no),
	constraint cl_b_fk foreign key(b_no) references book(b_no) on update cascade on delete cascade,
	constraint cl_m_fk foreign key(m_no) references member(m_no) on update cascade on delete cascade
);

create table if not exists notice(
	n_no int auto_increment,
	n_title varchar(50) not null,
	n_content text not null,
	n_readNo int not null default 0,
	n_date datetime not null,
	n_ip varchar(50) not null,
	ad_id varchar(15) not null,
	primary key(n_no),
	constraint n_ad_fk foreign key(ad_id) references admin(ad_id)
);
