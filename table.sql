
create table user_info(
	u_id VARCHAR(255) not null,
	nickname VARCHAR(50),
	pwd VARCHAR (255) not null,
	userimg_path VARCHAR(255),
	usermessage VARCHAR(255),
	PRIMARY KEY(u_id)
);

create table community(
	c_id VARCHAR(255) not null,
    u_id VARCHAR(255) not null,
    c_title VARCHAR(50) not null,
    viewCnt INT default 0,
    writer VARCHAR(20) not null,
    image VARCHAR(255),
    contents TEXT(3000) not null,
    write_time TIMESTAMP,
    PRIMARY KEY(c_id),
    FOREIGN KEY(u_id) REFERENCES user_info(u_id)
);

create table comments(
	com_id VARCHAR(255) not null,
    u_id VARCHAR(255) not null,
    c_id VARCHAR(255) not null,
    contents VARCHAR(1000) not null,
    write_time timestamp not null,
    primary key(com_id),
    foreign key(u_id) references user_info(u_id),
    foreign key(c_id) references community(c_id)
);

create table diet_list(
	dl_id VARCHAR(255) not null auto_increment,
    u_id VARCHAR(255) not null,
    d_id VARCHAR(255) not null,
    r_title VARCHAR(50) not null,
    write_time timestamp,
    primary key(l_id),
    foreign key(u_id) references user_info(u_id),
    foreign key(d_id) references diet(d_id)
);

create table diet(
	d_id VARCHAR(255) not null,
    r_id VARCHAR(255) not null,
    rice VARCHAR(50) not null,
    soup VARCHAR(50) not null,
    main VARCHAR(50) not null,
    sub1 VARCHAR(50) not null,
	sub2 VARCHAR(50) not null,
    primary key(d_id),
    foreign key(r_id) references recipe(r_id)
);

create table recipe(
	r_id VARCHAR(255) not null,
    d_id VARCHAR(255) not null,
    title VARCHAR(50) not null,
    category VARCHAR(255) not null,
    eng VARCHAR(20) not null,
    cal VARCHAR(20) not null,
    por VARCHAR(20) not null,
    fat VARCHAR(20) not null,
    na VARCHAR(20) not null,
    image VARCHAR(255),
    PRIMARY KEY(r_id),
    FOREIGN KEY(d_id) REFERENCES diet_list(dl_id)
);

create table step(
	s_id VARCHAR(255) not null,
    r_id VARCHAR(255) not null,
    manual01 VARCHAR(1000),
    manual02 VARCHAR(1000),
    manual03 VARCHAR(1000),
    manual04 VARCHAR(1000),
    manual05 VARCHAR(1000),
    manual06 VARCHAR(1000),
    PRIMARY KEY(s_id),
    FOREIGN KEY(r_id) REFERENCES recipe(r_id)
);

create table ingredients(
	ing_id VARCHAR(255) not null,
    r_id VARCHAR(255) not null,
    ing_name VARCHAR(50) not null,
    ing_amount VARCHAR(50) not null,
    PRIMARY KEY(ing_id),
    FOREIGN KEY(r_id) REFERENCES recipe(r_id)
);

create table price(
	ing_id VARCHAR(255) not null,
    p_id VARCHAR(255) not null,
	today VARCHAR(50),
	r_price VARCHAR(50),
	w_price VARCHAR(50),
    PRIMARY KEY(p_id),
    FOREIGN KEY(ing_id) REFERENCES ingredients(ing_id)
);