elements = document.getElementsByTagName("li");
    var serch = location.search
    var param = serch.split('&')
    var a = document.getElementById("item")
    var checkbox = document.getElementsByName("options")
    
    function check_search(){
        var check_item = 0
        for(let i=0;i<checkbox.length;i++){
            if(checkbox[i].checked){
                check_item = 1
            }
        }
        if(check_item == 1){
            a.classList.add("is-danger")
        }else{
            a.classList.remove("is-danger")
        }
    }
    function deletebutton(){ 
        for(let i=0;i<checkbox.length;i++){
            if(checkbox[i].checked){
                document.getElementById(checkbox[i].value).click()

            }
        }
    }
    if(param.length == 1){
        elements[0].className = "is-active"
    }else{
        var paramArray  = param[1].split('=')[1]
        if(paramArray){
            for(let i=0;i<4;i++){
                if(paramArray == elements[i].id){
                    elements[i].className = "is-active"
                }      
            }
        }
    }
    