$(document).ready(function(){

    fetchCustomers();

//Function to insert data
$('#customer-form').submit(function(e){
    const postData = {
        name: $('#name').val(),
        lastname: $('#lastname').val(),
        phonenumber: $('#phonenumber').val(),
        issue: $('#issue').val()
    };
    e.preventDefault();
    let url = '../logic/customers/customerAdd.php';

    $.post(url, postData, function(){
        fetchCustomers();
        $('#customer-form').trigger('reset');
        alert("Cliente agregado Satisfactoriamente")
    });
});
//Function to watch customers in the table
    function fetchCustomers(){
        $.ajax({
            url: '../logic/customers/customerList.php',
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
                            <td>${customer.issue} </td>
                            <td>${customer.phonenumber} </td>
                            <td>${customer.createdate} </td>
                            <td> 
                                <button class = "customer-update btn btn-success"><i class="fas fa-edit"></i></button>
                                <button class = "customer-delete btn btn-danger"><i class="fas fa-trash-alt"></i></button>
                            </td>
                        </tr>
                    `
                });
                $('#customers').html(template);
            }
        });
    }
  
    //Function for delete 
    $(document).on('click', 'customer_delete', function(){
        if(confirm('Esta seguro que desea eliminar este registro?')){
            let element = $(this)[0].parentElement.parentElement;
            let id = $(element).attr('');
        }


    });




});