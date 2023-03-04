Vue.config.ignoredElements = ['ion-icon'];
axios.defaults.headers.common = {
    'X-Requested-With': 'XMLHttpRequest',
    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
};
new Vue({
    el:"#app",
    data:{
        message:[],
        title:'TestSubject',
        menu_type:'all',
    },
    methods:{
        GetData(){
            axios.get('/document/api/index',{
                params:{
                    content:this.title
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
                content:this.title,
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
        ClickNav(event){
            this.menu_type =  event.currentTarget.getAttribute('id')
        }
       
    },
    mounted(){
        this.GetData()
    }
})