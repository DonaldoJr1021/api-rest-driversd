CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_driver`(
	
in fullnameparam varchar(150), 
    
in identificationparam varchar(20), 
    
in emailparam varchar(150), 
    
in phoneparam varchar(150),
	
in avatarparam longtext,
    
in usernameparam varchar(45),
    
in passwordparam longtext

)

BEGIN 
		
UPDATE personalinfo
 SET 
		fullname = fullnameparam,
            
		email = emailparam,
          
		phone = phoneparam,
            
		state = false,
            
		avatar = avatarparam,
            
		username = usernameparam,
            
		_password = passwordparam
		
        
			WHERE identification = identificationparam;

END