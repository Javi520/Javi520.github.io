function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

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

function sendMail() {   //Paula no merecía esto
    var link = "mailto:nashaun.kmauri@thtt.us"
             + "?cc=bedehiyen@ezmail.top"
             + "&subject=" + escape("Hola Javi")
             + "&body=" + "Javi, tienes que hablar tu"
    ;

    window.location.href = link;
}

function pistas_padlock()
{
    console.log("Parece que sigues siendo algo lista");
    console.log("Qué tienes si juntas una de las primeras películas que merecomendaste y ví** y las Lolas que cría mi tío?");
    await sleep(3000);
    console.log("PD: Es el nombre de la película y no tiene espacios. Cuidado con la combinación de mayúsculas que puede haber");
}

async function onWindowsLoadDo()  // I need to do this since it does not work calling both function inside
{
    var dt_msecs = new Date();
    if(dt_msecs.getMonth>=10){
        if(dt_msecs.getDay>=20)
            document.getElementById("idade").innerHTML=(dt_msecs.getFullYear()-1995);
    }
    else
        document.getElementById("idade").innerHTML=(dt_msecs.getFullYear()-1996);

    console.log("Parece que sigues siendo algo lista");
    console.log("Qué tienes si juntas una de las primeras películas que merecomendaste y ví** y las Lolas que cría mi tío?");
    await sleep(3000);
    console.log("PD: Es el nombre de la película y no tiene espacios. Cuidado con la combinación de mayúsculas que puede haber");    
}

window.onload = onWindowsLoadDo;
//window.onload = menu_display
//It's a variable... so writing both will cause an override of the initial value
//the correct form is by using window.addEventListener("load", function)