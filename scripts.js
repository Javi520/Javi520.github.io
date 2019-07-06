function queIdadeTeño (id){
    var dt_msecs = new Date();
    if(dt_msecs.getMonth>=10){
        if(dt_msecs.getDay>=20)
            document.getElementById(id).innerHTML=dt_msecs.getFullYear-1995;
    }
    else
        document.getElementById(id).innerHTML=dt_msecs.getFullYear-1996;
}