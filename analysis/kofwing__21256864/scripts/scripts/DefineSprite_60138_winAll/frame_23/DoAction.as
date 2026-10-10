function validation()
{
   if(txt_name.text != "")
   {
      txt_name.editable = false;
      txt_name.setFocus(null);
      btnConfirm.setFocus(null);
      btnConfirm.enabled = false;
      anyKey._visible = true;
      nameEntered = true;
   }
}
stop();
var nameEntered = false;
anyKey._visible = false;
_level0.transOut();
if(_level0.lan == "en")
{
   txt_hint.text = "Please enter your nickname";
}
txt_name.setFocus();
btnConfirm.onRelease = function()
{
   validation();
};
