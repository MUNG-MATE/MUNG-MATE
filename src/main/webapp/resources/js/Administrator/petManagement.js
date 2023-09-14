const box = document.getElementsByClassName("petsitterBox")
        const sc = window.scrollY;
        let boxCount = 2;
        for(let i=2; i<box.length; i++){
            box[i].style.display="none";
        }

        window.addEventListener('scroll', function(){
            console.log( window.scrollY )
            console.log(window.innerHeight)
            console.log(document.body.offsetHeight) 
            
            if( (window.innerHeight + window.scrollY + 210) >=document.body.offsetHeight){
                
                if(boxCount < box.length){
                    box[boxCount].style.display="flex";    
                    boxCount++;
                    console.log(boxCount);
                }
                
            }    
            
        });