$(document).ready(function(){

    fetchComputerLog();

//Function to insert data
$('#computerLog-form').submit(function(e){
    const postData = {
        marca: $('#marca').val(),
        model: $('#model').val(),
        processor: $('#processor').val(),
        ram: $('#ram').val(),
        disk: $('#disk').val(),
        sizeDisk: $('#sizeDisk').val(),
        state: $('#state').val()
    };
    e.preventDefault();
    let url = '../logic/computerLog/computerLogAdd.php';

    $.post(url, postData, function(){
        fetchComputerLog();
        $('#computerLog-form').trigger('reset');
        alert("Computadora Agregada Satisfactoriamente")
    });
});
//Function to watch computer in the table
    function fetchComputerLog(){
        $.ajax({
            url: '../logic/computerLog/computerLogList.php',
            type: 'GET',
            success: function(response){
                let computerLog = JSON.parse(response);
                let template = '';

                computerLog.forEach( computer =>{
                    template += `
                        <tr>
                            <td>${computer.id} </td>
                            <td>${computer.marca} </td>
                            <td>${computer.model} </td>
                            <td>${computer.processor} </td>
                            <td>${computer.ram} </td>
                            <td>${computer.disk} </td>
                            <td>${computer.sizeDisk} </td>
                            <td>${computer.state} </td>
                            <td>${computer.createdate} </td>
                            <td > 
                                <button class = "computer-update btn btn-success"><i class="fas fa-edit"></i></button>
                                <button class = "computer-delete btn btn-danger"><i class="fas fa-trash-alt"></i></button>
                            </td>
                        </tr>
                    `
                });
                $('#computerLog').html(template);
            }
        });
    }
  

});