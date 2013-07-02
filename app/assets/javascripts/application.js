function remove_fields(link) {
        $(link).prev("input[type=hidden]").val("1");
        $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
        var new_id = new Date().getTime();
        var regexp = new RegExp("new_" + association, "g");
        $(link).parent().before(content.replace(regexp, new_id));
}


function verificarCantidadRespuestas(checkBox, cantidadMinima)
{
    try
    {
        count = 0;
        
        if(typeof document.salida.elements[checkBox].length === 'undefined')
        {
            if(document.salida.elements[checkBox].checked == true)
            {
                count++;
            }
        }else{
            for(x=0; x < document.salida.elements[checkBox].length; x++)
            {
                if(document.salida.elements[checkBox][x].checked == true)
                {
                    count++;
                }
            }
        }            
        
        if(count < cantidadMinima && cantidadMinima > -1)
        {
            alert("Debe responder por lo menos " + cantidadMinima.toString() + " preguntas.");
            return false;
        }
        else if(count > cantidadMaxima && cantidadMaxima > -1)
        {
            alert("Puede responder como máximo " + cantidadMaxima.toString() + " preguntas.");
            return false;
        }
        else 
        {
            return true;
        }
    }
    catch(exception)
    {
        alert("Error: " + exception);
        return false;
    }
}