//add your api here below
var API_ENDPOINT = "https://yl7ealf6a8.execute-api.eu-north-1.amazonaws.com/v1"

$(document).ready(function() {
  // Call the function to retrieve employees
  getEmployees();
});
//AJAX POST REQUEST
document.getElementById("createEmployeeForm").onsubmit = function(event) {
  event.preventDefault(); // Pour empêcher le formulaire de se soumettre normalement
  var inputData = {
    "employeeId": $('#id').val(),
    "name": $('#name').val(),
    "email": $('#email').val(),
    "address": $('#address').val(),
    "phone": $('#phone').val()
  };

  $.ajax({
    url: API_ENDPOINT,
    type: 'POST',
    data: JSON.stringify(inputData),
    contentType: 'application/json; charset=utf-8',
    success: function(response) {
      $('#createEmployeeForm')[0].reset();
      alert("success");

      // Call the function to retrieve employees
      getEmployees();
    },
    error: function() {
      alert("error");
    }
  });
};

//AJAX DELETE REQUEST
function deleteEmployee(employeeId) {
  var requestBody = {
    "employeeId": employeeId.toString()
  };
  $.ajax({
    url: API_ENDPOINT,
    type: 'DELETE',
    data: JSON.stringify(requestBody),
    contentType: 'application/json; charset=utf-8',
    success: function(response) {
      alert("Employee deleted successfully");
      // Call the function to retrieve employees
      getEmployees();
    },
    error: function() {
      alert("Error deleting employee");
    }
  });
}

//AJAX GET REQUEST
document.getElementById("getEmployees").onclick = function() {
  getEmployees();
};

function getEmployees() {
  $.ajax({
    url: API_ENDPOINT,
    type: 'GET',
    contentType: 'application/json; charset=utf-8',
    success: function(response) {
      $('#EmployeesTable tr').slice(1).remove();
      jQuery.each(response, function(i, data) {
        var row = "<tr> \
          <td>" + data['employeeId'] + "</td>\
          <td>" + data['name'] + "</td>\
          <td>" + data['email'] + "</td>\
          <td>" + data['address'] + "</td>\
          <td>" + data['phone'] + "</td>\
          <td>\
            <a href='#' class='delete' data-toggle='modal' onclick='deleteEmployee(" + data['employeeId'] + ")'><i class='material-icons' data-toggle='tooltip' title='Delete'>&#xE872;</i></a>\
          </td>\
        </tr>";
        $("#EmployeesTable").append(row);
      });
    },
    error: function() {
      alert("error");
    }
  });
}
