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

Vue.config.ignoredElements = ['ion-icon'];
axios.defaults.headers.common = {
    'X-Requested-With': 'XMLHttpRequest',
    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
};
new Vue({
    el:"#app",
    data:{
        message:[],
        param:''
    },
    methods:{
        GetData(){
            axios.get('/document/api/index',{
                params:{
                    content:'TestSubject'
                }
            })
            .then(res=>{
                this.message = res.data
            }).catch(e=>{
                console.log(e)
            })
        },
        DeleteData(id){
        
            const params={
                content:'test',
                pagenation:0
            }
            axios.delete('/document/delete/'+id,{
                data:params
            })
            .then(()=>{
                this.GetData()
            })
            .catch(e=>{
                console.log(e.response)
            })
        },
        TrashActive(){
            this.$refs.trash.classList.remove("is-danger")
            this.$refs.checkbox.forEach(v=>{
                if(v.checked) this.$refs.trash.classList.add("is-danger")
            })  
        },
        TrashOn(){
            const btn_class = this.$refs.trash.className.split(' ')
            if(!btn_class.includes('is-danger')){
                alert('アイテムが選ばれていません')
                return
            }
            const checkbox = this.$refs.checkbox
            var id = ''
            for(let i in this.$refs.checkbox){
             if(checkbox[i].checked){
                id = checkbox[i].id
                break
             }
            }
            this.DeleteData(id)
        },
        ClickNav(e){
            let id = e.currentTarget.getAttribute('id')
            console.log(id)
        }
       
    },
    mounted(){
        this.GetData()
    }
})