/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

mostrar();

function mostrar() {

    $.ajax({

        url: "../ControladorFlores?tipoc=mostrar",
        type: "get",
        success: function (response) {
            console.log(response);

        },
        error: function () {

        }





    });




}

//$("#form_insertar").off("submit").on("submit",function(event){
//        event.preventDefault();
//        
//        $.ajax({
//           
//            url:"../UsuarioSer?tipo=mostrar",
//            type:"post",
//            data: $(this).serialize(),
//            success: function(response){
//                console.log(response);
//                mostrar();
//                console.log("listo");
//            },
//            error: function(){
//                
//            }
//            
//        });
//        
//        
//        
//    });


