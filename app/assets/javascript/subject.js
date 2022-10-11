var checkbox = document.getElementsByName("options")
var btn_delete =   document.getElementById("delete")
var btn_edit = document.getElementById("edit")

function check_search(){
    var check_item = 0
    for(let i=0;i<checkbox.length;i++){
        if(checkbox[i].checked){
            check_item = 1
        }
    }
    if(check_item == 1){
        btn_delete.classList.add("is-danger")
        btn_edit.classList.add("is-warning")

    }else{
        btn_delete.classList.remove("is-danger")
        btn_edit.classList.remove("is-warning")
    }
}

function deletebutton(){ 
    for(let i=0;i<checkbox.length;i++){
        if(checkbox[i].checked){
            document.getElementById(checkbox[i].value).click()
        }
    }
}
function editbutton(){ 
    for(let i=0;i<checkbox.length;i++){
        if(checkbox[i].checked){
            document.getElementsByName(checkbox[i].value)[0].click()
        }
    }
}

elements = document.getElementsByTagName("li");
var parameter = location.search
var splitparam = parameter.split('&')
var paramArray = splitparam[0]



if(splitparam.length == 1){
    elements[0].className = "is-active"
}else{
    paramArray  = paramArray.split('=')[1]
    if(paramArray){
        for(let i=0;i<3;i++){
            if(paramArray == elements[i].id){
                elements[i].className = "is-active"
            }      
        }
    }
}