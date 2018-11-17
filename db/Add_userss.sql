CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_user`(
	
in fullnameparam varchar(150), 
    
in identificationparam varchar(20), 
    
in emailparam varchar(150), 
    
in phoneparam varchar(150),
	
in avatarparam longtext,
    
in usernameparam varchar(45),
    
in passwordparam longtext
    
)

BEGIN
		
DECLARE last_id INT ;

insert into personalinfo(fullname,identification,email,phone,state,avatar,username,_password) 
values(fullnameparam,identificationparam, emailparam, phoneparam, false, avatarparam, usernameparam, passwordparam ) ;

SET last_id = LAST_INSERT_ID() ;
        
        
insert into users(PersonalInfo_id, createdAt)

        values(last_id, now())
;
      
		IF last_id > 0  THEN
			
			select true, personalinfo.fullname from personalinfo where personalinfo.id = last_id ;

		ELSE
			
			select false;

	
END IF;


END