
function sleep(ms) {
return new Promise(resolve => setTimeout(resolve, ms));
}

async function typingEffect(element_id, stringToBeWritten)
{
    aEscribir = stringToBeWritten.split("");
    
    aux = [aEscribir[0], ''];
    for(i = 0; i <= aEscribir.length; i++)
    {
        element_id.innerText=aux.join("");
        aux[i] = aEscribir[i];
        await sleep(100+Math.random()*50-25);
    }
}

async function newChatMessage(chat_id, stringToBeWritten)
{
    var message = document.createElement("a");
    var newline = document.createElement("br");
    document.getElementById(chat_id).appendChild(message);
    await typingEffect(message, stringToBeWritten);
    document.getElementById(chat_id).appendChild(newline);
}

async function primeraPista()
{
    var audio = new Audio('beep.mp3');
    await newChatMessage('chat', "Bienvenida Raquel, soy AuPy9000, un Bot programado por un gran Genio, conocido como Australio Pythekus");
    console.log('AUS');
    await sleep(1000);
    await newChatMessage('chat', "Ahí va un refrán: \"La paciencia!, es la clave del exito\", asi de gratis... Este programador.... vaya cosas tiene, eh!");
    console.log('TRAL');
    await sleep(1000);
    await newChatMessage('chat', "Siento algo de pena... Al final te dije que te lo iba a dar y estoy siendo algo injusto :(");
    await sleep(1000);
    await newChatMessage('chat', "Ahi te va el enlace");
    document.getElementById('Link_falso').hidden=false;
    console.log('IO');
    await sleep(3*60*1000); // 3 minutos
    audio.play();
    await sleep(10000);
    await newChatMessage('chat', "JAJAJAJAJAJA, como has podido caer....");
    await sleep(2000);
    await newChatMessage('chat', "CHAO!");
    console.log('>');
    await sleep(20000);
    console.log('SRA');
    console.log('CROQUETA');
    await newChatMessage('chat', "El link verdadero por mostrar una buena paciencia :)");
    await sleep(1000);
    await newChatMessage('chat', "Por cierto, yo soy una persona que aunque juego en PC, a veces uso la consola");
    document.getElementById('Link_verdadero').hidden=false;
}

console.log('Chica lista');