show tables;

create table guest (
	idx	int not null auto_increment,	/* 고유 번호 */
	name varchar(20) not null,			/* 성명 */
	content text not null,						/* 방명록 내용 */
	email varchar(60),							/* 메일 주소 */
	homePage	varchar (60),					/* 홈페이지(블로그) 주소 */
		hostIp varchar(30) not null,			/* 방문자 IP */
	visitDate datetime default now(),		/* 방문한 날짜 */
	primary key(idx)
);

drop table guest;

select * from guest;

insert into guest value (default, '관리자', '방명록 서비스를 시작합니다.', 'ssokum34@naver.com', 'ssokum34.tistory.com', '192.168.50.20', now()); 
alter