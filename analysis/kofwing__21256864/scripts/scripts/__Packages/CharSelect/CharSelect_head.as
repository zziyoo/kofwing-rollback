class CharSelect.CharSelect_head extends MovieClip
{
   var $hasHidden;
   var $name;
   var $role;
   var $type;
   var active;
   var down;
   var hasHidden;
   var left;
   var name;
   var posObj;
   var right;
   var role;
   var type;
   var types;
   var up;
   var yc;
   var localHint = false;
   var loadOK = true;
   function CharSelect_head()
   {
      super();
      this.posObj = {up:this.up,down:this.down,left:this.left,right:this.right,yc:this.yc};
      if(this.active == false)
      {
         this.$name = "";
         this.$role = "none";
         return;
      }
      this.activate();
   }
   function activate()
   {
      this.active = true;
      if(this._parent._name == "select_mc2")
      {
         this.posObj = {up:this.up,down:this.down,left:this.right,right:this.left,yc:this.yc};
      }
      else
      {
         this.posObj = {up:this.up,down:this.down,left:this.left,right:this.right,yc:this.yc};
      }
      this.$name = this.name;
      this.$role = this.role;
      this.$type = this.type;
      this.types = this.type;
      this.$hasHidden = this.hasHidden;
      if(this.$role == "")
      {
         this.$role = "none";
      }
      this.gotoAndStop(this.$role);
      if(this.$role == "Iori" && this.$type == 3)
      {
         this.gotoAndStop("Iori3");
      }
      if(this.$role == "Zero" && this.$type == 2)
      {
         this.gotoAndStop("Zero2");
      }
      if(this.$role == "Orochi" && this.$type == 2)
      {
         this.gotoAndStop("Orochi2");
      }
   }
}
