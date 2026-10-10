onClipEvent(load){
   function __f_click(eventObj)
   {
      if(_parent.mc._visible)
      {
         _parent.mc._visible = false;
      }
      else
      {
         _parent.mc._visible = true;
      }
   }
   this.addEventListener("click",__f_click);
}
