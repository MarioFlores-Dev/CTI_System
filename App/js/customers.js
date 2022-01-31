$(document).ready(function(){

    fetchCustomers();

    function fetchCustomers(){
        $.ajax({
            url: '../logic/customers/customerlist.php',
            type: 'GET',
            success: function(response){
                let customers = JSON.parse(response);
                let template = '';

                customers.forEach( customer =>{
                    template += `
                        <tr>
                            <td>${customer.id} </td>
                            <td>${customer.name} </td>
                            <td>${customer.lastname} </td>
                            <td>${customer.phonenumber} </td>
                            <td> 
                                <button class = "customer-delete btn-danger">DesHabilitar</button>
                            </td>
                        </tr>
                    `
                });
                $('#customers').html(template);
            }
        });
    }
  





});