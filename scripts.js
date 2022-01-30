function fun_idade ()
{
    var dt_msecs = new Date();
    if(dt_msecs.getMonth>=10){
        if(dt_msecs.getDay>=20)
            document.getElementById("idade").innerHTML=(dt_msecs.getFullYear()-1995);
    }
    else
        document.getElementById("idade").innerHTML=(dt_msecs.getFullYear()-1996);
}

function menu_display()
{
    document.getElementById("menu").innerHTML='<a href="/">Inicio</a>';
}

function sendMail() {
    var link = "mailto:nashaun.kmauri@thtt.us"
             + "?cc=bedehiyen@ezmail.top"
             + "&subject=" + escape("Hola Javi")
             + "&body=" + "Javi, tienes que hablar tu"
    ;

    window.location.href = link;
}

window.onload = fun_idade;