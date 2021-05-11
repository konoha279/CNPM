var addingGuest =  document.getElementById("adding-guest");
var addingStaff =  document.getElementById("adding-staff");
var content = document.getElementById('adding');
var inputGuests = addingGuest.getElementsByTagName("INPUT");
var inputStaffs = addingStaff.getElementsByTagName("INPUT");
window.onload = function(){
    var cookieArr = document.cookie.split(";");
    var cookieUsername = cookieArr[0].replace("username=","");
    var items = document.getElementsByName("disabled"+cookieUsername);
    for (t=0; t<items.length;t++)
    {
        items[t].setAttribute("disabled", "true");
    }
    for(i=0;i<inputGuests.length;i++)
    {
        inputGuests[i].removeAttribute("disabled");
    }
    for(j=0; j<inputStaffs.length; j++)
    {
        if (inputStaffs[j].getAttribute("id") != "staffStatus")
            inputStaffs[j].setAttribute("disabled", "true");
    }
    addingGuest.style.display = "";
    addingStaff.style.display = "none";
    
}

function changeAdding()
{
    if (document.getElementById('addRoleSelected').value == "0")
    {
        for(i=0;i<inputGuests.length;i++)
        {
            inputGuests[i].removeAttribute("disabled");
        }
        for(j=0; j<inputStaffs.length; j++)
        {
            if (inputStaffs[j].getAttribute("id") != "staffStatus")
                inputStaffs[j].setAttribute("disabled", "true");
        }
        addingGuest.style.display = "";
        addingStaff.style.display = "none";
    }
    else
    {
        for(i=0;i<inputGuests.length;i++)
        {
            inputGuests[i].setAttribute("disabled", "true");
        }
        for(j=0; j<inputStaffs.length; j++)
        {
            inputStaffs[j].removeAttribute("disabled");
        }
        addingGuest.style.display = "none";
        addingStaff.style.display = "";
    }
}