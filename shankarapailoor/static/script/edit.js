document.write("<script src='/static/script/axios.js'></script>");
window.addEventListener('load',function(){
   
    let tbody=this.document.querySelector('tbody')
    let remark=this.document.querySelector('[name="remark_edit"]')
    let submit_btn=this.document.querySelector('.btn-secondary')
    
    let editId
    tbody.addEventListener('click',function(e){
        if (e.target.classList.contains('btnedit')) {
            $('#depedit').modal('show')
            let id = e.target.dataset.id
            editId=id
            axios({
                method:'get',
                url:'getRemarkByDisId',
                params:{id:id}
            }).then(res => {
                let data = res.data.disres
                remark.value=data.Remark
            })
        }
        
    })
    submit_btn.addEventListener('click',function(){
       var id = editId
       var mark=remark.value
        var formData=new FormData
        formData.append('id',id)
        formData.append('mark',mark)
        axios({
            method:'post',
            url:'editRemark',
            data:formData
        }).then(res => {

        })
    })
    tbody.addEventListener('click',function(e){
        if(e.target.classList.contains('deleterow')){
            confirm("确定要删除该测试吗？");
            let id = e.target.dataset.id
            axios({
                url:'deleteDisres',
                method:'get',
                params:{id:id}
            }).then(res => {
                alert("成功删除")
            })
        }
    })
})