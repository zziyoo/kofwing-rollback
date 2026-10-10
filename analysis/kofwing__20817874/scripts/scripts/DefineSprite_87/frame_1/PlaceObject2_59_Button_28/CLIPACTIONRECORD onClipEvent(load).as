onClipEvent(load){
   function __f_click(eventObj)
   {
      if(_root.debug == true)
      {
         _root.debug = false;
      }
      else
      {
         _root.debug = true;
      }
   }
   this.addEventListener("click",__f_click);
}
