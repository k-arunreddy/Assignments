function changeformat(n) {
  if (n == 1) {
    document.getElementById("style1").href = "form1.css";
  } else if (n == 2) {
    document.getElementById("style1").href = "form2.css";
  } else if (n == 3) {
    document.getElementById("style1").href = "form3.css";
  }
}

function validateForm() {
  var empid = document.getElementById("empid").value.trim();
  var fname = document.getElementById("fname").value.trim();
  var lname = document.getElementById("lname").value.trim();
  var dname = document.getElementById("dname").value.trim();

  if (empid === "" || fname === "" || lname === "" || dname === "") {
    alert("Please fill all required fields");
    return false;
  }
  var genderSelected = false;
  var genderRadios = document.getElementsByName("gender");
  for (var i = 0; i < genderRadios.length; i++) {
    if (genderRadios[i].checked) {
      genderSelected = true;
      break;
    }
  }
  if (!genderSelected) {
    alert("Please select a gender");
    return false;
  }
  var fieldChecked = document.querySelectorAll('input[name="vehicle"]:checked');
  if (fieldChecked.length === 0) {
    alert("Please select at least one field (IMS or BFS)");
    return false;
  }

  return true; 
}