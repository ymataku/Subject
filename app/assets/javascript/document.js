var delete_button = document.getElementById("item")
var checkbox = document.getElementsByName("options")
var param = location.search.split('&')

function DeleteBtnActive(){
    for(let i=0;i<checkbox.length;i++){
        if(checkbox[i].checked){
            delete_button.classList.add("is-danger")
            return
        }
    }
    delete_button.classList.remove("is-danger")
    return
}


function DeleteDoc(){
    for(let i=0;i<checkbox.length;i++){
        if(checkbox[i].checked) document.getElementById(checkbox[i].value).click()
    }
}

var nav = document.getElementsByName("nav")
var type_nav = document.getElementById("type-nav")

nav.forEach(e=>{
  if(e.id == type_nav.value) e.className = "is-active"
})
// function NavActive(e){
    
//     console.log(e)

// }
// if(param.length == 1){
//     nav[0].className = "is-active"
// }else{
//     var paramArray  = param[1].split('=')[1]
//     console.log(paramArray)
//     if(paramArray){
//         for(let i=0;i<4;i++){
//             if(paramArray == nav[i].id){
//                 nav[i].className = "is-active"
//             }      
//         }
//     }
// }
