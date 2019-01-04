function change(obj)
{
	obj.style.background="#3d4e60";
	var name=obj.getElementsByClassName("chooseImg")[0].getElementsByTagName("img")[0].getAttribute("src").substring(7);
	obj.getElementsByClassName("chooseImg")[0].getElementsByTagName("img")[0].src="images/c-"+name;
	obj.getElementsByClassName("chooseText")[0].style.color="white";
	obj.style['border-right']="5px solid #354457";
}
function recover(obj)
{
	obj.style.background="#4d5e70";
	var name=obj.getElementsByClassName("chooseImg")[0].getElementsByTagName("img")[0].getAttribute("src").substring(9);
	obj.getElementsByClassName("chooseImg")[0].getElementsByTagName("img")[0].src="images/"+name;
	obj.getElementsByClassName("chooseText")[0].style.color="#aebccb";
	obj.style['border-right']="5px solid #4d5e70";
}
