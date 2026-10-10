class role_corn.Role extends MovieClip
{
   var Va;
   var Vdash;
   var Vg;
   var Vjump_far;
   var Vjump_x;
   var Vjump_y;
   var Vwalk;
   var Vx;
   var Vy;
   var _roleName;
   var _to_BC;
   var _to_PK;
   var _to_PK_l;
   var _to_double_b;
   var _to_double_d;
   var _to_double_f;
   var _to_double_u;
   var _to_key_h;
   var _to_key_s;
   var _to_key_s2;
   var _to_kick;
   var _to_kick_l;
   var _to_punch;
   var _to_punch_l;
   var b;
   var burstList;
   var burst_defend;
   var burst_mode;
   var char_mc;
   var colorObj;
   var color_timer;
   var color_timer2;
   var comboClass;
   var countPos;
   var countTimes;
   var count_type;
   var currentLabel;
   var d;
   var d_alpha;
   var d_rate22;
   var effect_loader;
   var egde;
   var egde_max;
   var egde_min;
   var end_alpha;
   var f;
   var farJumpT;
   var flyingObj;
   var freeze_timer;
   var hitValue;
   var hits;
   var hitsArray;
   var hitsObj;
   var hurt1_snd;
   var hurt2_snd;
   var hurtSoundArray;
   var hurtValue;
   var ida;
   var inBurst;
   var inCount;
   var inFreeze;
   var input_pre;
   var isBurstSkill;
   var isKO;
   var k;
   var land_Y;
   var life;
   var lifeObj;
   var life_max;
   var lose_snd;
   var mc;
   var mode_key;
   var newKeyControl;
   var noCatchT;
   var noLifeDec;
   var normalList2;
   var onEgde;
   var onEnterFrame;
   var onHit;
   var opp;
   var opp_hight2;
   var opp_width2;
   var p;
   var player_type;
   var powerDecType;
   var powerDecType2;
   var powerObj;
   var powerPoint_max;
   var record_frame;
   var record_skill;
   var record_skill_totalFrame;
   var redBlood;
   var replay_timer;
   var roleName;
   var run_snd;
   var scale;
   var shadow_mc;
   var skillCount;
   var skillObj;
   var skillPonit;
   var skillSuperMapping;
   var skill_last;
   var skill_last0;
   var skill_loader;
   var skill_mc;
   var skill_now;
   var sound_mc;
   var stage_with;
   var startX;
   var startY;
   var status_end;
   var superList;
   var superMaxList;
   var superPoint;
   var superSkill;
   var toAction_temp;
   var toSkill_temp;
   var toStatus_temp;
   var u;
   var winPoseArray;
   var frameCount_temp = 0;
   var record_action_totalFrame = ["stand","walk_f","walk_b","dash_f","dash_b","land","land2","squat"];
   var record_filter_array = ["stand","walk_f","walk_b","land","land2","squat"];
   var frameOffset = 1;
   var inReplay = false;
   var hurtX = 10;
   var hurtY = 10;
   var normalmode = "normal";
   var hurtPrev = "stand";
   var auto = ["squat","punch_l","punch","kick","kick_l","squatPunch","squatKick","squatPunch_l","squatKick_l","heavyHit"];
   var squatAct = ["squatPunch","squatKick","squatPunch_l","squatKick_l","squat","hold_d","shurt1","shurt2"];
   var skillName = [];
   var skillNum = [];
   var powerNum = 1;
   var status_1 = "stand";
   var status_2 = "land";
   var status_3 = "normal";
   var status_4 = "normal";
   var status_5 = "normal";
   var status_6 = "normal";
   var status_7 = "normal";
   var status_8 = "normal";
   var nosh = false;
   var normalList = ["getup_dizzy","stand","stand2","squat","walk_f","walk_b","dash_b","roll_down","dash_f","dash_ex","roll_f","roll_b","roll_ex","hold_u","hold_d","jump","jump_f","jump_b","punch","kick","punch_l","punch_lc","kick_l","kick_lc","jumpSkill_punch","jumpSkill_kick","jumpSkill_punch_l","jumpSkill_kick_l","punch2","kick1","kick2","punch_l2","kick_s2","kick_l2","squatPunch","squatKick","squatPunch_l","squatKick_l","pitch","pitch2","jumpSkill_heavyHit","heavyHit","hurt1","hurt2","hurt3","hurt_crash","hurt4","hurt5","hurt6","hurt_crash2","hurt_qyyang","hurt_qyyin","hurt_xuanfeng","hurt_xuanfeng2","getup1","getup2","land","land2","land3","shurt1","shurt2","breakDefend","breakCatch","end","end2","end3","lose","kneeldown","tx","tx2","breakCatch1","breakCatch2"];
   var normalPunchlKickList = ["punch","kick","punch_l","punch_lc","kick_l","kick_lc","punch2","kick1","kick2","punch_l2","kick_s2","kick_l2","squatPunch","squatKick","squatPunch_l","squatKick_l","heavyHit"];
   var bdCombo = false;
   var holdFreeze = false;
   var delaySkill = "";
   var hitID = "nohit";
   var countObj = true;
   var canBreakCatch = true;
   var inRecord = false;
   var opp_hight = 55;
   var dir = 1;
   var dirs = 0;
   var frame_t = 33;
   var frame_t2 = 80;
   var noCatch = false;
   var noCatchT2 = 12;
   var farJump = false;
   var farJumpT2 = 10;
   var hitDownRoll = true;
   var getUpDizzy = false;
   var dizzied = false;
   var hitDownFar = false;
   var KO_checked = false;
   var winTimes = 0;
   var control = false;
   var control2 = true;
   var checkTouch_stop = false;
   var side_offset = 15;
   var depth_shadow = 55;
   var airHits_max = 4;
   var power_skillSuper = 60;
   var power_skillBurst = 150;
   var power_cancle = 30;
   var roleMode = 1;
   var bloodPower = false;
   var ashPower = false;
   var kyoPower = false;
   var armor_mode = false;
   var att_mode = false;
   var power_mode = false;
   var nonSkill = false;
   var wireAttack = false;
   var wireTrue = true;
   var compOpenPose = false;
   var judgeDoubleHits = false;
   var glowFromMc = false;
   var _pause = false;
   var baiHeZhe = false;
   var nobody = false;
   var eAsh = false;
   var dash_ex_enabled = false;
   var roll_ex_enabled = false;
   var charge_enabled = false;
   function Role()
   {
      super();
      this.lifeObj = {target:this};
      this.powerObj = {target:this};
      this.hitsObj = {target:this};
      this.hitsArray = new Array();
      this.winPoseArray = new Array("end");
      this.skillObj = new Object();
      this.normalList2 = new Array();
      this.freeze_timer = this.createEmptyMovieClip("freeze_timer",124);
      this.skill_loader = this._parent.createEmptyMovieClip("skill_loader",200);
      this.effect_loader = this._parent.createEmptyMovieClip("effect_loader",201);
      this.replay_timer = this.createEmptyMovieClip("replay_timer",135);
      this.Vg = _level0.g;
      this.Va = 3;
      this.colorObj = new Object();
      this.colorObj.normal = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire = {ra:"100",rb:"255",ga:"100",gb:"110",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.white = {ra:"100",rb:"255",ga:"100",gb:"255",ba:"100",bb:"255",aa:"100",ab:"255"};
      this.colorObj.fire_blue = {ra:"100",rb:"100",ga:"50",gb:"0",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.light2 = {ra:"-65",rb:"200",ga:"-65",gb:"200",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.light1 = {ra:"-65",rb:"200",ga:"-65",gb:"200",ba:"-100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.dian2 = {ra:"-65",rb:"200",ga:"-65",gb:"200",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.dian1 = {ra:"-65",rb:"200",ga:"-65",gb:"200",ba:"-100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.green2 = {ra:"15",rb:"43",ga:"75",gb:"217",ba:"15",bb:"0",aa:"100",ab:"0"};
      this.colorObj.green1 = {ra:"50",rb:"-255",ga:"-50",gb:"255",ba:"0",bb:"0",aa:"100",ab:"0"};
      this.colorObj.black2 = {ra:"-25",rb:"25",ga:"-25",gb:"25",ba:"-25",bb:"25",aa:"100",ab:"0"};
      this.colorObj.black1 = {ra:"15",rb:"0",ga:"15",gb:"0",ba:"15",bb:"0",aa:"100",ab:"0"};
      this.colorObj.nonSkill2 = {ra:"50",rb:"0",ga:"50",gb:"75",ba:"50",bb:"130",aa:"100",ab:"0"};
      this.colorObj.nonSkill1 = {ra:"50",rb:"0",ga:"50",gb:"50",ba:"50",bb:"130",aa:"100",ab:"0"};
      this.colorObj.fire_red2 = {ra:"100",rb:"255",ga:"100",gb:"80",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_red1 = {ra:"-45",rb:"255",ga:"-100",gb:"200",ba:"-100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_blue2 = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.fire_blue1 = {ra:"-100",rb:"178",ga:"-100",gb:"96",ba:"-100",bb:"239",aa:"100",ab:"0"};
      this.colorObj.ice1 = {ra:"-100",rb:"255",ga:"-50",gb:"255",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.purple2 = {ra:"-16",rb:"139",ga:"-21",gb:"97",ba:"-11",bb:"170",aa:"100",ab:"0"};
      this.colorObj.purple1 = {ra:"2",rb:"129",ga:"-24",gb:"110",ba:"-5",bb:"140",aa:"100",ab:"0"};
      this._to_PK = this.to_PK;
      this._to_BC = this.to_BC;
      this._to_PK_l = this.to_PK_l;
      this._to_key_s = this.to_key_s;
      this._to_key_s2 = this.to_key_s2;
      this._to_kick = this.to_kick;
      this._to_kick_l = this.to_kick_l;
      this._to_punch = this.to_punch;
      this._to_punch_l = this.to_punch_l;
      this._to_double_f = this.to_double_f;
      this._to_double_b = this.to_double_b;
      this._to_double_d = this.to_double_d;
      this._to_double_u = this.to_double_u;
      this._to_key_h = this.to_key_h;
      this.input_pre = new Object();
      this.input_pre.roll_f = 8;
      this.input_pre.roll_b = 8;
      this.input_pre.land = 3;
      this.input_pre.land2 = 3;
      this.input_pre.land3 = 3;
      this.input_pre.getup1 = 20;
      this.input_pre.getup2 = 20;
      this.input_pre.roll_down = 6;
      this.input_pre.roll_ab = 6;
      this.input_pre.hurt6 = 8;
      this.onEnterFrame = function()
      {
         if(this.currentLabel == "ready" || this.currentLabel == "ready2")
         {
            this.compOpenPose = true;
            delete this.onEnterFrame;
         }
      };
      this.control2 = true;
      _level0.actionSet_status_P1 = "control";
      _level0.actionSet_status_P2 = "control";
   }
   function begin()
   {
      this.gotoAndStop("begin");
   }
   function begin2()
   {
      this.gotoAndStop("begin2");
   }
   function begin3()
   {
      this.gotoAndStop("begin3");
   }
   function begin4()
   {
      this.gotoAndStop("begin4");
   }
   function begin5()
   {
      this.gotoAndStop("begin5");
   }
   function stand(goStand)
   {
      var _loc3_ = "";
      if(this.status_1 == "hold_u" || this.status_1 == "hold_d")
      {
         if(this.mc.toDefendEnd() != undefined && goStand != true)
         {
            _loc3_ = this.mc.toDefendEnd();
         }
      }
      if(!(this._y = this.land_Y))
      {
         this.status_2 = "air";
         this.jump_uu();
      }
      this.opp_hight2 = this.opp_hight;
      this.statusClear();
      this.countEnd();
      this.nosh = false;
      this.colorNormal();
      if(_root.role_mc.opp.status_3 != "attack" && _root.role_mc.opp.status_6 == "normal" && _root.role_mc.opp.status_2 == "land")
      {
         _level0.zoomControl_mc.doZoomY(100,0.5);
         _level0.zoomControl_mc.zoomBack(0.5);
         _level0.stageControl_mc.startControl();
         if(_root.role_mc.opp._y = this.land_Y)
         {
            _level0.char_mc._y = 0;
         }
      }
      if(_loc3_ == "")
      {
         if(this.roleMode == 2)
         {
            _loc3_ = "stand2";
         }
         else
         {
            _loc3_ = "stand";
         }
         this.gotoAndStop(_loc3_);
      }
      else
      {
         this.mc.gotoAndPlay(_loc3_);
      }
   }
   function jump_uu()
   {
      this.status_1 = "jump";
      this.status_2 = "air";
      this.status_3 = "normal";
      this.status_4 = "normal";
      if(this.inRecord)
      {
         this.skill_record("jump");
      }
      this.opp_hight2 = this.opp_hight;
      this.Vx = 0;
      this.Vy = this.Vjump_y;
      this.gotoAndStop("jump");
      this.status_1 = "jump";
   }
   function walk_f()
   {
      if(_level0.KO)
      {
         this.status_1 = "stand";
         this.status_3 = "stand";
         this.gotoAndStop("stand");
         return false;
      }
      if(this.status_2 != "land" || this.status_3 != "normal" || this.status_1 == "squat" || this.holdFreeze || this.status_6 != "normal")
      {
         return false;
      }
      this.opp_hight2 = this.opp_hight;
      this.status_4 = "normal";
      this.Vx = this.dir * this.Vwalk;
      this.gotoAndStop("walk_f");
      this.status_1 = "walk_f";
      this.move_walkRun();
   }
   function walk_b()
   {
      if(this.holdFreeze)
      {
         return false;
      }
      if(_level0.KO)
      {
         this.status_1 = "stand";
         this.status_3 = "stand";
         this.gotoAndStop("stand");
         return false;
      }
      if(this.status_1 == "squat" && (this.opp.status_3 == "attack" && this.opp.status_6 == "normal" || this.opp.hasObj()) && (this.opp.status_1 != "pitch" || this.opp.status_1 != "pitch2"))
      {
         if(!Key.isDown(this.d))
         {
            this.hold_u();
            return undefined;
         }
         this.hold_d();
         return undefined;
      }
      if(this.status_2 != "land" || this.status_3 != "normal" || this.status_1 == "squat" || this.status_6 != "normal")
      {
         return false;
      }
      if(this.opp.status_3 == "attack" && this.opp.status_6 == "normal" || this.opp.hasObj() && (this.opp.status_1 != "pitch" || this.opp.status_1 != "pitch2"))
      {
         if(Key.isDown(this.d))
         {
            this.hold_d();
            return undefined;
         }
         this.hold_u();
         return undefined;
      }
      this.opp_hight2 = this.opp_hight;
      this.status_4 = "normal";
      this.Vx = this.dir * (- this.Vwalk);
      this.gotoAndStop("walk_b");
      this.status_1 = "walk_b";
      this.move_walkRun();
   }
   function dash_f()
   {
      if(_level0.KO)
      {
         this.status_1 = "stand";
         this.status_3 = "stand";
         this.gotoAndStop("stand");
         return false;
      }
      if(this.status_2 != "land" || this.status_3 != "normal" || this.status_1 == "squat" || this.holdFreeze || this.status_6 != "normal")
      {
         return false;
      }
      this.opp_hight2 = this.opp_hight - 25;
      this.status_4 = "normal";
      this.Vx = this.dir * this.Vdash;
      this.gotoAndStop("dash_f");
      this.status_1 = "dash_f";
      this.move_walkRun();
   }
   function dash_b()
   {
      if(_level0.KO)
      {
         this.status_1 = "stand";
         this.status_3 = "stand";
         this.gotoAndStop("stand");
         return false;
      }
      if(this.status_2 != "land" || this.status_3 != "normal" || this.status_1 == "squat" || this.holdFreeze || this.status_6 != "normal")
      {
         return false;
      }
      this.gotoAndStop("dash_b");
      this.status_1 = "dash_b";
      this.opp_hight2 = this.opp_hight;
      this.status_4 = "normal";
      this.Vx = -26;
      this.Vy = 17;
   }
   function dash_ex()
   {
      if(this.status_2 != "land" || this.status_3 != "normal" || this.status_1 == "squat" || this.holdFreeze || this.status_6 != "nonormalmove")
      {
         return false;
      }
      this.opp_hight2 = this.opp_hight;
      this.status_4 = "normal";
      this.Vx = 28;
      this.Vy = 10;
      this.gotoAndStop("dash_ex");
      this.status_1 = "dash_ex";
   }
   function roll_f()
   {
      if(_level0.KO)
      {
         this.status_1 = "stand";
         this.status_3 = "stand";
         this.gotoAndStop("stand");
         return false;
      }
      if(this.status_2 == "air" && this.status_3 == "hurt" && this.status_7 != "normal")
      {
         if(this.hitDownRoll && this._y >= 380 && !this.inFreeze)
         {
            this.hurtValue.end_status = "roll_down";
            return true;
         }
         return false;
      }
      if(this.status_1 == "getup1" || this.status_1 == "getup2")
      {
         if(this.mc._currentframe < 4 && this.status_5 == "hitDown" && this.hitDownRoll)
         {
            this.roll_down();
            return true;
         }
         return false;
      }
      if(this.status_4 == "air" && this._y > 350 && this.inFreeze != true && this.hitDownRoll)
      {
         this.roll_down();
         return true;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.holdFreeze && this.status_1 != "breakDefend")
      {
         if(this.inBurst)
         {
            this.powerObj.action = "burstdec";
            if(this.burst_mode == "defend")
            {
               this.powerObj.decNum = _level0.power_holdRoll;
            }
            else
            {
               this.powerObj.decNum = 80;
            }
         }
         else
         {
            if(this == _level0.P1_role && _level0.LP_P1.powerPoint_num == 0 || this == _level0.P2_role && _level0.LP_P2.powerPoint_num == 0)
            {
               return false;
            }
            this.powerObj.action = "dec";
         }
         this.nosh = true;
         this.powerControl(this.powerObj);
         this.changeColorSelf("white",30);
         this.noCatchT2 = 12;
         clearInterval(this.noCatchT);
         this.noCatchT = setInterval(this,"noCatchTimer",10);
         this.holdFreeze = false;
         this.stop_hurtBack();
         if(this == _level0.P2_role)
         {
            _level0.showMsg("defendCancel",_level0.stage_with - 150,220);
         }
         else
         {
            _level0.showMsg("defendCancel",50,220);
         }
      }
      else if(this.status_3 != "normal" || this.status_6 != "normal")
      {
         return false;
      }
      if(this.status_1 == "dash_f")
      {
         this.Vx = 23;
      }
      else
      {
         this.Vx = 19;
      }
      this.status_6 = "normal";
      this.status_1 = "roll_f";
      this.status_3 = "roll";
      this.status_4 = "normal";
      this.gotoAndStop("roll_f");
   }
   function roll_b()
   {
      if(_level0.KO)
      {
         this.status_1 = "stand";
         this.status_3 = "stand";
         this.gotoAndStop("stand");
         return false;
      }
      if(this.status_2 == "air" && this.status_3 == "hurt" && this.status_7 != "normal")
      {
         if(this.hitDownRoll && this._y >= 380 && !this.inFreeze)
         {
            this.hurtValue.end_status = "roll_down";
            return true;
         }
         return false;
      }
      if(this.status_1 == "getup1" || this.status_1 == "getup2")
      {
         if(this.mc._currentframe < 4 && this.status_5 == "hitDown" && this.hitDownRoll)
         {
            this.roll_down();
            return true;
         }
         return false;
      }
      if(this.status_4 == "air" && this._y > 350 && this.inFreeze != true && this.hitDownRoll)
      {
         this.roll_down();
         return true;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.holdFreeze && this.status_1 != "breakDefend")
      {
         if(this.inBurst)
         {
            this.powerObj.action = "burstdec";
            if(this.burst_mode == "defend")
            {
               this.powerObj.decNum = _level0.power_holdRoll;
            }
            else
            {
               this.powerObj.decNum = 80;
            }
         }
         else
         {
            if(this == _level0.P1_role && _level0.LP_P1.powerPoint_num == 0 || this == _level0.P2_role && _level0.LP_P2.powerPoint_num == 0)
            {
               return false;
            }
            this.powerObj.action = "dec";
         }
         this.nosh = true;
         this.powerControl(this.powerObj);
         this.changeColorSelf("white",30);
         this.noCatchT2 = 12;
         clearInterval(this.noCatchT);
         this.noCatchT = setInterval(this,"noCatchTimer",10);
         this.holdFreeze = false;
         this.stop_hurtBack();
         if(this == _level0.P2_role)
         {
            _level0.showMsg("defendCancel",_level0.stage_with - 150,220);
         }
         else
         {
            _level0.showMsg("defendCancel",50,220);
         }
      }
      else if(this.status_3 != "normal" || this.status_6 != "normal")
      {
         return false;
      }
      this.Vx = -20;
      this.gotoAndStop("roll_b");
      this.status_6 = "normal";
      this.status_1 = "roll_b";
      this.status_3 = "roll";
      this.status_4 = "normal";
   }
   function roll_ex()
   {
      if(this.status_1 == "getup1" || this.status_1 == "getup2")
      {
         if(this.mc._currentframe < 4 && this.status_5 == "hitDown" && this.hitDownRoll)
         {
            this.roll_down();
            return true;
         }
         return false;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.status_3 != "normal" || this.holdFreeze)
      {
         return false;
      }
      this.gotoAndStop("roll_ex");
      this.status_6 = "normal";
      this.status_1 = "roll_ex";
      this.status_3 = "roll";
      this.status_4 = "normal";
   }
   function roll_down()
   {
      if(this == _level0.P2_role)
      {
         _level0.showMsg("roll_down",_level0.stage_with - 150,220);
      }
      else
      {
         _level0.showMsg("roll_down",50,220);
      }
      delete this.onEnterFrame;
      if(this._y != 445)
      {
         return false;
      }
      trace(this.hitDownRoll);
      this.checkSide_abs();
      this.hitDownRoll = true;
      this.status_2 = "";
      this.nosh = true;
      this._y = this.land_Y;
      this.Vx = -20;
      this.colorNormal();
      this.gotoAndStop("roll_ab");
      this.status_1 = "roll_ab";
      this.status_3 = "roll";
      this.status_4 = "normal";
      this.status_6 = "all";
   }
   function hold_u()
   {
      if(_level0.KO)
      {
         this.status_1 = "stand";
         this.status_3 = "stand";
         this.gotoAndStop("stand");
         return false;
      }
      if(this.status_2 != "land" || this.status_3 != "normal" || this.status_6 != "normal")
      {
         return false;
      }
      this.opp_hight2 = this.opp_hight;
      this.nobody = false;
      this.status_6 = "normal";
      this.gotoAndStop("hold_u");
      this.status_1 = "hold_u";
      this.status_4 = "hold";
      this.move_hold();
   }
   function hold_d()
   {
      if(_level0.KO)
      {
         this.status_1 = "stand";
         this.status_3 = "stand";
         this.gotoAndStop("stand");
         return false;
      }
      if(this.status_2 != "land" || this.status_3 != "normal" || this.status_6 != "normal")
      {
         return false;
      }
      this.opp_hight2 = this.opp_hight - 40;
      this.nobody = false;
      this.status_6 = "normal";
      this.gotoAndStop("hold_d");
      this.status_1 = "hold_d";
      this.status_4 = "hold";
      this.move_hold();
   }
   function squat()
   {
      if(_level0.KO)
      {
         this.status_1 = "stand";
         this.status_3 = "stand";
         this.gotoAndStop("stand");
         return false;
      }
      this.farJumpT2 = 10;
      clearInterval(this.farJumpT);
      this.farJumpT = setInterval(this,"farJumpTimer",10);
      if(this.status_2 != "land" || this.status_3 != "normal" || this.holdFreeze || this.status_6 != "normal")
      {
         return false;
      }
      if(this.check_hold_d())
      {
         return undefined;
      }
      if((Key.isDown(this.b) && this.dir == 1 || Key.isDown(this.f) && this.dir == -1) && (this.opp.status_3 == "attack" && this.opp.status_6 == "normal" || this.opp.hasObj()) && (this.opp.status_1 != "pitch" || this.opp.status_1 != "pitch2"))
      {
         this.hold_d();
         return undefined;
      }
      this.status_end = "stand";
      this.opp_hight2 = this.opp_hight - 40;
      this.status_4 = "normal";
      this.move_squat();
      this.gotoAndStop("squat");
      this.status_1 = "squat";
   }
   function jump()
   {
      if(_level0.KO && (this.status_2 == "land" || this.status_2 == "toLand"))
      {
         this.status_1 = "stand";
         this.status_3 = "stand";
         this.gotoAndStop("stand");
         return false;
      }
      this.nobody = false;
      if(this.status_1 == "dash_f" || this.farJump == true && (Key.isDown(this.f) && this.dir == 1 || Key.isDown(this.b) && this.dir == -1))
      {
         if(this.status_2 != "land" || this.holdFreeze || this.status_3 != "normal" || this.status_6 != "normal")
         {
            return false;
         }
         this.status_2 = "air";
         this.opp_hight2 = this.opp_hight;
         this.Vx = this.Vjump_far * 1.15;
         this.Vy = this.Vjump_y;
         this.gotoAndStop("jump_f");
         this.status_1 = "jump_f";
      }
      else if(this.farJump == true && (Key.isDown(this.b) && this.dir == 1 || Key.isDown(this.f) && this.dir == -1))
      {
         if(this.status_2 != "land" || this.holdFreeze || this.status_3 != "normal" || this.status_6 != "normal")
         {
            return false;
         }
         this.status_2 = "air";
         this.opp_hight2 = this.opp_hight;
         this.Vx = (- this.Vjump_far) * 1.15;
         this.Vy = this.Vjump_y;
         this.gotoAndStop("jump_b");
         this.status_1 = "jump_b";
      }
      else if(Key.isDown(this.f))
      {
         if(this.dir == 1)
         {
            this.jump_f();
         }
         else
         {
            this.jump_b();
         }
      }
      else if(Key.isDown(this.b))
      {
         if(this.dir == -1)
         {
            this.jump_f();
         }
         else
         {
            this.jump_b();
         }
      }
      else
      {
         this.jump_u();
      }
   }
   function jump_u()
   {
      if(this.status_2 != "land" || this.holdFreeze || this.status_3 != "normal" || this.status_6 != "normal")
      {
         return false;
      }
      this.status_2 = "air";
      if(this.inRecord)
      {
         this.skill_record("jump");
      }
      this.opp_hight2 = this.opp_hight;
      this.Vx = 0;
      this.Vy = this.Vjump_y;
      this.gotoAndStop("jump");
      this.status_1 = "jump";
      this.status_4 = "normal";
   }
   function jump_f()
   {
      if(_level0.KO && (this.status_2 == "land" || this.status_2 == "toLand"))
      {
         this.status_1 = "stand";
         this.status_3 = "stand";
         this.gotoAndStop("stand");
         return false;
      }
      if(this.status_2 != "land" || this.holdFreeze || this.status_3 != "normal" || this.status_6 != "normal")
      {
         return false;
      }
      this.status_2 = "air";
      if(this.inRecord)
      {
         this.skill_record("jump_f");
      }
      this.opp_hight2 = this.opp_hight;
      this.Vx = this.Vjump_x;
      this.Vy = this.Vjump_y;
      this.gotoAndStop("jump_f");
      this.status_1 = "jump_f";
      this.status_4 = "normal";
   }
   function jump_b()
   {
      if(_level0.KO && (this.status_2 == "land" || this.status_2 == "toLand"))
      {
         this.status_1 = "stand";
         this.status_3 = "stand";
         this.gotoAndStop("stand");
         return false;
      }
      if(this.status_2 != "land" || this.holdFreeze || this.status_3 != "normal" || this.status_6 != "normal")
      {
         return false;
      }
      this.status_2 = "air";
      if(this.inRecord)
      {
         this.skill_record("jump_b");
      }
      this.opp_hight2 = this.opp_hight;
      this.Vx = - this.Vjump_x;
      this.Vy = this.Vjump_y;
      this.gotoAndStop("jump_b");
      this.status_1 = "jump_b";
      this.status_4 = "normal";
   }
   function land()
   {
      this.opp_hight2 = this.opp_hight;
      this.baiHeZhe = false;
      this.status_2 = "toLand";
      this.status_3 = "normal";
      this.status_4 = "normal";
      this.status_1 = "land";
      this.gotoAndStop("land");
      _level0.effect_mc.downEff("down1",this._x,this._y,this.dir);
   }
   function land2()
   {
      this.status_4 = "normal";
      this.opp_hight2 = this.opp_hight;
      this.baiHeZhe = false;
      this.status_2 = "toLand";
      this.status_3 = "normal";
      this.status_1 = "land2";
      this.gotoAndStop("land2");
      _level0.effect_mc.downEff("down1",this._x,this._y,this.dir);
   }
   function land3()
   {
      this.status_4 = "normal";
      this.opp_hight2 = this.opp_hight;
      this.baiHeZhe = false;
      this.status_2 = "toLand";
      this.status_3 = "normal";
      this.status_1 = "land3";
      this.gotoAndStop("land3");
      _level0.effect_mc.downEff("down1",this._x,this._y,this.dir);
   }
   function getup1()
   {
      this.status_4 = "normal";
      this.opp_hight2 = this.opp_hight - 30;
      this.nosh = false;
      this.status_2 = "air";
      this.status_3 = "down";
      this.status_1 = "getup1";
      _level0.shake_mc.shakeStart(1,5);
      this.nobody = false;
      this.gotoAndStop("getup1");
   }
   function getup2()
   {
      this.status_4 = "normal";
      this.opp_hight2 = this.opp_hight - 30;
      this.nosh = false;
      this.status_2 = "air";
      this.status_3 = "down";
      this.status_1 = "getup2";
      _level0.shake_mc.shakeStart(1,5);
      this.nobody = false;
      this.gotoAndStop("getup2");
   }
   function hurt3()
   {
      this.opp_hight2 = this.opp_hight + 40;
      this.status_1 = "hurt3";
      this.status_3 = "hurt";
      this.status_2 = "air";
      this.gotoAndStop(this.status_1);
   }
   function hurt1()
   {
      this.opp_hight2 = this.opp_hight;
      this.status_1 = "hurt1";
      this.status_3 = "hurt";
      this.status_2 = "land";
      this.gotoAndStop(this.status_1);
   }
   function hurt2()
   {
      this.opp_hight2 = this.opp_hight;
      this.status_1 = "hurt2";
      this.status_3 = "hurt";
      this.status_2 = "land";
      this.gotoAndStop(this.status_1);
   }
   function shurt1()
   {
      this.opp_hight2 = this.opp_hight - 40;
      this.status_1 = "hurt1";
      this.status_3 = "hurt";
      this.status_2 = "land";
      this.gotoAndStop("shurt1");
   }
   function shurt2()
   {
      this.opp_hight2 = this.opp_hight - 40;
      this.status_1 = "hurt2";
      this.status_3 = "hurt";
      this.status_2 = "land";
      this.gotoAndStop("shurt2");
   }
   function hurt_crash()
   {
      this.opp_hight2 = this.opp_hight + 40;
      this.status_1 = "hurt_crash";
      this.status_3 = "hurt";
      this.status_2 = "air";
      this.gotoAndStop(this.status_1);
   }
   function hurt_crash2()
   {
      this.opp_hight2 = this.opp_hight;
      this.status_1 = "hurt_crash2";
      this.status_3 = "hurt";
      this.status_2 = "air";
      this.gotoAndStop("hurt_crash");
   }
   function hurt_crash5()
   {
      this.opp_hight2 = this.opp_hight;
      this.status_1 = "hurt_crash5";
      this.status_3 = "hurt";
      this.status_2 = "air";
      this.gotoAndStop("hurt_crash");
   }
   function hurt4()
   {
      this.opp_hight2 = this.opp_hight + 40;
      this.status_1 = "hurt4";
      this.status_3 = "hurt";
      this.status_2 = "air";
      this.gotoAndStop(this.status_1);
   }
   function hurt5()
   {
      this.opp_hight2 = this.opp_hight + 40;
      this.status_1 = "hurt5";
      this.status_3 = "hurt";
      this.status_2 = "air";
      this.gotoAndStop(this.status_1);
   }
   function hurt6()
   {
      this.opp_hight2 = this.opp_hight + 40;
      this.status_1 = "hurt6";
      this.status_3 = "hurt";
      this.status_2 = "air";
      this.status_6 = "all";
      this.gotoAndStop(this.status_1);
   }
   function breakDefend()
   {
      this.bdCombo = true;
      this.opp_hight2 = this.opp_hight;
      this.status_1 = "breakDefend";
      this.status_3 = "hurt";
      this.status_2 = "land";
      this.status_4 = "normal";
      this.gotoAndStop(this.status_1);
   }
   function breakCatch()
   {
      this.opp_hight2 = this.opp_hight;
      this.status_1 = "breakCatch";
      this.status_3 = "attack";
      this.status_2 = "land";
      this.status_4 = "normal";
      this.gotoAndStop("breakCatch1");
      this.start_move_X2(-30);
   }
   function breakCatch2()
   {
      this.opp_hight2 = this.opp_hight;
      this.status_1 = "breakCatch";
      this.status_3 = "attack";
      this.status_2 = "land";
      this.status_4 = "normal";
      this.gotoAndStop("breakCatch2");
      this.start_move_X2(-30);
   }
   function hurt_qyyang()
   {
      this.opp_hight2 = this.opp_hight + 40;
      this.status_1 = "hurt_qyyang";
      this.status_3 = "hurt";
      this.status_2 = "land";
      this.gotoAndStop(this.status_1);
   }
   function hurt_qyyin()
   {
      this.opp_hight2 = this.opp_hight - 40;
      this.status_1 = "hurt_qyyin";
      this.status_3 = "hurt";
      this.status_2 = "land";
      this.gotoAndStop(this.status_1);
   }
   function hurt_xuanfeng()
   {
      this.opp_hight2 = this.opp_hight + 40;
      this.status_1 = "hurt_xuanfeng";
      this.status_3 = "hurt";
      this.status_2 = "air";
      this.gotoAndStop(this.status_1);
   }
   function hurt_xuanfeng2()
   {
      this.opp_hight2 = this.opp_hight + 40;
      this.status_1 = "hurt_xuanfeng2";
      this.status_3 = "hurt";
      this.status_2 = "air";
      this.gotoAndStop(this.status_1);
   }
   function getup_dizzy()
   {
      this.opp_hight2 = this.opp_hight;
      this.status_1 = "getup_dizzy";
      this.status_3 = "hurt";
      this.status_2 = "land";
      this.status_4 = "normal";
      this.gotoAndStop(this.status_1);
   }
   function kneeldown()
   {
      this.opp_hight2 = this.opp_hight;
      this.status_1 = "kneeldown";
      this.status_3 = "hurt";
      this.status_2 = "land";
      this.status_4 = "normal";
      this.gotoAndStop(this.status_1);
   }
   function tx()
   {
      if(this.status_2 != "land" || this.status_3 != "normal")
      {
         return false;
      }
      this.status_1 = "tx";
      this.status_3 = "attack";
      this.status_6 = "move";
      this.gotoAndStop(this.status_1);
      if(this.roleMode == 2)
      {
         this.gotoAndStop("tx2");
      }
   }
   function tx2()
   {
      if(this.status_2 != "land" || this.status_3 != "normal")
      {
         return false;
      }
      this.status_1 = "tx2";
      this.status_3 = "attack";
      this.status_6 = "move";
      this.gotoAndStop(this.status_1);
   }
   function punch()
   {
      if(this.status_2 == "air")
      {
         return false;
      }
      this.opp_hight2 = this.opp_hight;
      this.status_1 = "punch";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
      this.status_4 = "normal";
   }
   function punch2()
   {
      if(this.status_2 == "air")
      {
         return false;
      }
      this.opp_hight2 = this.opp_hight;
      this.status_1 = "punch2";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
      this.status_4 = "normal";
   }
   function punch_l()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.opp_hight2 = this.opp_hight;
      this.status_1 = "punch_l";
      this.gotoAndStop(this.status_1);
      this.mc.gotoAndPlay(1);
      this.status_3 = "attack";
      this.status_4 = "normal";
   }
   function kick()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.opp_hight2 = this.opp_hight;
      this.status_1 = "kick";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
      this.status_4 = "normal";
   }
   function kick2()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.opp_hight2 = this.opp_hight;
      this.gotoAndStop("kick2");
      this.status_1 = "kick2";
      this.status_3 = "attack";
      this.status_4 = "normal";
   }
   function kick_l()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.opp_hight2 = this.opp_hight;
      this.gotoAndStop("kick_l");
      this.mc.gotoAndPlay(1);
      this.status_1 = "kick_l";
      this.status_3 = "attack";
      this.status_4 = "normal";
   }
   function squatPunch()
   {
      if(this.status_2 == "air")
      {
         return false;
      }
      this.opp_hight2 = this.opp_hight - 40;
      this.status_1 = "squatPunch";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
      this.status_4 = "normal";
   }
   function squatPunch_l()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.opp_hight2 = this.opp_hight - 40;
      this.status_1 = "squatPunch_l";
      this.gotoAndStop(this.status_1);
      this.mc.gotoAndPlay(1);
      this.status_3 = "attack";
      this.status_4 = "normal";
   }
   function squatKick()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.opp_hight2 = this.opp_hight - 40;
      this.status_1 = "squatKick";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
      this.status_4 = "normal";
   }
   function squatKick_l()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.opp_hight2 = this.opp_hight - 40;
      this.gotoAndStop("squatKick_l");
      this.mc.gotoAndPlay(1);
      this.status_1 = "squatKick_l";
      this.status_3 = "attack";
      this.status_4 = "normal";
   }
   function jumpSkill(act)
   {
      if(_level0.inPause)
      {
         return false;
      }
      if(this.status_3 != "normal")
      {
         return false;
      }
      if(this.mc._currentframe <= 3)
      {
         this.mc.nextFrame();
         this.jumpSkill(act);
      }
      if(this.inRecord)
      {
         this.skill_record(act);
      }
      this.mc.gotoAndPlay(act);
      this.status_3 = "attack";
      this.status_1 = "jumpSkill_" + act;
      if(this.player_type == "player")
      {
         this.skill_last = this.skill_last0;
         this.skill_last0 = this.status_1;
         this.skillToEqual(this.skill_last0);
      }
      else
      {
         this.skill_last = this.skill_now;
         this.skill_now = this.status_1;
         this.skillToEqual(this.skill_now);
      }
      this.opp.checkDefend();
   }
   function pitch(kick)
   {
      if(kick == undefined || kick == null)
      {
         kick = false;
      }
      var _loc2_;
      var _loc4_;
      if((this.opp.status_1 == "pitch" || this.opp.status_1 == "pitch2") && this.opp.mc._currentframe < 6 && this.canBreakCatch == true)
      {
         _loc2_ = (this._x + this.opp._x) / 2;
         if(_level0.char_mc._x + _loc2_ > this.egde_max)
         {
            _loc2_ = this.egde_max - _level0.char_mc._x;
         }
         if(_level0.char_mc._x + _loc2_ < this.egde_min)
         {
            _loc2_ = this.egde_min - _level0.char_mc._x;
         }
         _loc4_ = this.land_Y - 150;
         _level0.effect_mc.hitFire("hitFire3",_loc2_,_loc4_);
         this._x = this.opp._x + 60 * this.opp.dir;
         this._y = this.land_Y;
         this.breakCatch2();
         this.Va = 5;
         this.start_move_X2(-30);
         this.opp._y = this.land_Y;
         this.opp.breakCatch();
         this.opp.Va = 5;
         this.opp.start_move_X2(-30);
         return undefined;
      }
      if(this.status_3 != "normal" || this.status_1 == "land2" || this.status_1 == "land3" || this.status_2 != "land")
      {
         return false;
      }
      if(this.catch_check())
      {
         if(!kick)
         {
            this.nosh = true;
            this.gotoAndStop("pitch");
            this.status_1 = "pitch";
            this.skill_last = "";
            this.skill_last0 = "pitch";
            if(this.status_2 == "air")
            {
               this.skill_last0 += "_air";
            }
            this.skillToEqual(this.skill_last0);
         }
         else
         {
            this.nosh = true;
            this.gotoAndStop("pitch2");
            this.status_1 = "pitch2";
            this.skill_last = "";
            this.skill_last0 = "pitch2";
            if(this.status_2 == "air")
            {
               this.skill_last0 += "_air";
            }
            this.skillToEqual(this.skill_last0);
         }
         this.nosh = true;
         this.status_3 = "attack";
         this.status_4 = "normal";
         this.status_6 = "catch";
         return true;
      }
   }
   function pitchAir(kick)
   {
      if(kick == undefined || kick == null)
      {
         kick = false;
      }
      if(this.status_3 != "normal" || this.status_1 == "land2" || this.status_1 == "land3")
      {
         return false;
      }
      if(this.catch_checkAir())
      {
         if(!kick)
         {
            this.gotoAndStop("pitchAir");
            this.status_1 = "pitchAir";
         }
         else
         {
            this.gotoAndStop("pitchAir2");
            this.status_1 = "pitchAir2";
         }
         this.status_3 = "attack";
         this.status_4 = "normal";
         return true;
      }
   }
   function burst(type)
   {
      if(this.inBurst)
      {
         return false;
      }
      if(this.status_2 != "land" || this.status_3 != "normal" || this.holdFreeze || this.status_6 != "normal")
      {
         return false;
      }
      if(this.superPoint != this.powerPoint_max)
      {
         if(!(this.redBlood && this.superPoint > 0))
         {
            return false;
         }
      }
      this.status_4 = "normal";
      this.status_3 = "attack";
      this.inBurst = true;
      if(type == "attack")
      {
         this.burst_mode = "attack";
         this.status_1 = "burst";
         this.gotoAndStop("burst");
      }
      else if(type == "defend")
      {
         this.burst_defend = true;
         this.burst_mode = "defend";
         this.status_1 = "burst2";
         this.gotoAndStop("burst2");
      }
      else if(type == "power")
      {
         this.burst_mode = "power";
         this.status_1 = "burst";
         this.gotoAndStop("burst3");
      }
      return true;
   }
   function burst_a()
   {
      if(this.inBurst)
      {
         return false;
      }
      if(this.status_2 != "land" || this.status_3 != "normal" || this.holdFreeze || this.status_6 != "normal")
      {
         return false;
      }
      if(this.superPoint != this.powerPoint_max)
      {
         if(!(this.redBlood && this.superPoint > 0))
         {
            return false;
         }
      }
      this.status_3 = "attack";
      this.status_6 = "burst";
      this.inBurst = true;
      this.burst_mode = "attack";
      this.status_1 = "burst";
      this.gotoAndStop("burst");
      return true;
   }
   function burst_d()
   {
      if(this.inBurst)
      {
         return undefined;
      }
      if(this.status_2 != "land" || this.status_3 != "normal" || this.holdFreeze || this.status_6 != "normal")
      {
         return undefined;
      }
      if(this.superPoint != this.powerPoint_max)
      {
         if(!(this.redBlood && this.superPoint > 0))
         {
            return undefined;
         }
      }
      this.status_3 = "attack";
      this.inBurst = true;
      this.burst_defend = true;
      this.burst_mode = "defend";
      this.status_1 = "burst2";
      this.gotoAndStop("burst2");
      return true;
   }
   function burst_p()
   {
      if(this.inBurst)
      {
         return undefined;
      }
      if(this.status_2 != "land" || this.status_3 != "normal" || this.holdFreeze || this.status_6 != "normal")
      {
         return undefined;
      }
      if(this.superPoint != this.powerPoint_max)
      {
         if(!(this.redBlood && this.superPoint > 0))
         {
            return undefined;
         }
      }
      this.status_3 = "attack";
      this.status_6 = "burst";
      this.inBurst = true;
      this.burst_mode = "power";
      this.status_1 = "burst3";
      this.gotoAndStop("burst3");
      return true;
   }
   function sk_busrt_a()
   {
      if(this.inBurst != true && !this.inReplay)
      {
         return false;
      }
      if(this.toStatus(this.skillObj.busrt_a) == false)
      {
         return false;
      }
      this.status_3 = "attack";
      this.powerObj.action = "burstdec";
      this.powerObj.decNum = 80;
      this.powerControl(this.powerObj);
   }
   function sk_busrt_d()
   {
      if(this.inBurst != true && !this.inReplay)
      {
         return false;
      }
      if(this.toStatus(this.skillObj.busrt_d) == false)
      {
         return false;
      }
      this.status_3 = "attack";
      this.powerObj.action = "burstdec";
      this.powerObj.decNum = 80;
      this.powerControl(this.powerObj);
   }
   function sk_record()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.skill_replay_start();
   }
   function heavyHit()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.opp_hight2 = this.opp_hight;
      this.status_1 = "heavyHit";
      this.status_3 = "attack";
      this.status_4 = "normal";
      this.gotoAndStop(this.status_1);
   }
   function move_walkRun()
   {
      if(this == _level0.P1_role && _level0.actionSet_status_P1 != "control" || this == _level0.P2_role && _level0.actionSet_status_P2 != "control")
      {
         this.control2 = false;
      }
      this.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(this.inFreeze)
         {
            return undefined;
         }
         if(_level0.KO)
         {
            delete this.onEnterFrame;
            this.stand();
         }
         if(this == _level0.P1_role && _level0.actionSet_status_P1 != "control" || this == _level0.P2_role && _level0.actionSet_status_P2 != "control")
         {
            this.do_move(this.Vx);
            return undefined;
         }
         if(this.status_2 != "land" || this.status_3 != "normal" || this.status_6 != "normal")
         {
            delete this.onEnterFrame;
            return undefined;
         }
         if(Key.isDown(this.d))
         {
            this.squat();
         }
         else if(Key.isDown(this.f))
         {
            if((this.opp.status_3 == "attack" && this.opp.status_6 == "normal" || this.opp.hasObj()) && (this.opp.status_1 != "pitch" || this.opp.status_1 != "pitch2") && this.dir == -1 && !Key.isDown(this.b))
            {
               this.hold_u();
               return undefined;
            }
            this.do_move(this.Vx);
         }
         else if(Key.isDown(this.b))
         {
            if((this.opp.status_3 == "attack" && this.opp.status_6 == "normal" || this.opp.hasObj()) && (this.opp.status_1 != "pitch" || this.opp.status_1 != "pitch2") && this.dir == 1 && !Key.isDown(this.f))
            {
               this.hold_u();
               return undefined;
            }
            this.do_move(this.Vx);
         }
         else
         {
            delete this.onEnterFrame;
            this.stand();
         }
      };
   }
   function move_squat()
   {
      this.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(this.inFreeze)
         {
            return undefined;
         }
         if(_level0.KO && this.status_1 == "squat" && this.status_3 != "attack" && this.status_6 == "normal")
         {
            delete this.onEnterFrame;
            this.toStatus_switch(this.status_end);
         }
         if(this.check_hold_d())
         {
            delete this.onEnterFrame;
         }
         if(!Key.isDown(this.d) && this.status_1 == "squat" && this.status_3 != "attack" && this.status_6 == "normal")
         {
            delete this.onEnterFrame;
            this.toStatus_switch(this.status_end);
         }
      };
   }
   function check_hold_d()
   {
      if((this.opp.status_3 == "attack" && this.opp.status_6 == "normal" || this.opp.hasObj()) && (this.opp.status_1 != "pitch" || this.opp.status_1 != "pitch2"))
      {
         if(this.dir == 1 && Key.isDown(this.b) || this.dir == -1 && Key.isDown(this.f))
         {
            this.hold_d();
            return true;
         }
      }
   }
   function move_hold()
   {
      var f = this.f;
      var b = this.b;
      var d = this.d;
      var opp = this.opp;
      var dir = this.dir;
      var owner = this;
      this.mc.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(owner.inFreeze)
         {
            return undefined;
         }
         if(_level0.KO)
         {
            owner.status_3 = "normal";
            owner.status_6 = "normal";
            owner.toStatus_switch("stand");
         }
         if(opp.status_3 == "attack" && opp.status_6 == "normal" || opp.hasObj())
         {
            if(this == _level0.P1_role && _level0.actionSet_status_P1 != "control")
            {
               if(_level0.actionSet_status_P1 == "hold_u")
               {
                  owner.hold_u();
               }
               else if(_level0.actionSet_status_P1 == "hold_d")
               {
                  owner.hold_d();
               }
            }
            else if(this == _level0.P2_role && _level0.actionSet_status_P2 != "control")
            {
               if(_level0.actionSet_status_P2 == "hold_u")
               {
                  owner.hold_u();
               }
               else if(_level0.actionSet_status_P2 == "hold_d")
               {
                  owner.hold_d();
               }
            }
            else if(Key.isDown(f) && dir == -1)
            {
               if(owner.status_1 == "hold_u" && Key.isDown(d))
               {
                  owner.hold_d();
               }
               else if(owner.status_1 == "hold_d" && !Key.isDown(d))
               {
                  owner.hold_u();
               }
            }
            else if(Key.isDown(b) && dir == 1)
            {
               if(owner.status_1 == "hold_u" && Key.isDown(d))
               {
                  owner.hold_d();
               }
               else if(owner.status_1 == "hold_d" && !Key.isDown(d))
               {
                  owner.hold_u();
               }
            }
            else if(!owner.holdFreeze)
            {
               owner.status_3 = "normal";
               owner.status_6 = "normal";
               owner.toStatus_switch("stand");
            }
         }
         else if(!owner.holdFreeze)
         {
            owner.status_3 = "normal";
            owner.status_6 = "normal";
            owner.toStatus_switch("stand");
         }
      };
   }
   function do_holdFreeze(f)
   {
      this.holdFreeze = true;
      var f_t = f;
      var owner = this;
      this.delaySkill = "";
      this.freeze_timer.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(owner.inFreeze)
         {
            return undefined;
         }
         if(f_t <= 0)
         {
            delete this.onEnterFrame;
         }
         f_t--;
         this.holdFreeze = true;
      };
   }
   function hold_end()
   {
      this.holdFreeze = false;
   }
   function do_move(Vx)
   {
      this.do_move2(Vx);
   }
   function do_move2(Vx)
   {
      if(this.egdecheck(Vx))
      {
         return undefined;
      }
      this._x += Vx;
   }
   function start_move_X1(v, obj)
   {
      var Vx;
      if(this.status_3 != "hurt")
      {
         Vx = v != 0 ? this.dir * v : this.dir * this.Vx;
      }
      else
      {
         Vx = v != 0 ? this.opp.dir * v : this.opp.dir * this.Vx;
      }
      var _loc3_ = this;
      this.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(this.inFreeze)
         {
            return undefined;
         }
         this.do_move(Vx);
         if(obj.Vx == undefined)
         {
            delete this.onEnterFrame;
         }
      };
   }
   function stop_move_X1(obj)
   {
      delete obj.onEnterFrame;
   }
   function start_move_X2(v)
   {
      this.Vx = v;
      this.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(this.inFreeze)
         {
            return undefined;
         }
         if(this.status_3 == "hurt")
         {
            delete this.onEnterFrame;
         }
         this.do_move(this.dir * this.Vx);
         if(this.Vx >= 0)
         {
            this.Vx -= this.Va;
            if(this.Vx <= 0)
            {
               delete this.onEnterFrame;
            }
         }
         else
         {
            this.Vx += this.Va;
            if(this.Vx >= 0)
            {
               delete this.onEnterFrame;
            }
         }
      };
   }
   function start_move_X3(v, flag)
   {
      if(this._xscale == this.opp._xscale)
      {
         this.Vx = v * -1;
      }
      else
      {
         this.Vx = v;
      }
      this.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(this.inFreeze)
         {
            return undefined;
         }
         if(this.Vx >= 0)
         {
            this.do_move(this.Vx * this.dir * -1);
            this.Vx -= 2;
            if(this.Vx <= 0)
            {
               this.mc.gotoAndPlay(flag);
               delete this.onEnterFrame;
            }
         }
         else
         {
            this.do_move(this.Vx * this.dir * -1);
            this.Vx += 2;
            if(this.Vx >= 0)
            {
               this.mc.gotoAndPlay(flag);
               delete this.onEnterFrame;
            }
         }
      };
   }
   function stop_move_X2()
   {
      delete this.onEnterFrame;
   }
   function start_move_Y1(y, x, end, g)
   {
      this.status_2 = "air";
      this.Vy = y;
      this.Vx = this.dir * x;
      var Vg2;
      if(g != 0 && g != null)
      {
         Vg2 = g;
      }
      else if(this.status_1 == "jump" || this.status_1 == "jump_f" || this.status_1 == "jump_b")
      {
         Vg2 = 4.5;
      }
      else
      {
         Vg2 = this.Vg;
      }
      this.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(this.inFreeze)
         {
            return undefined;
         }
         this.do_move(this.Vx);
         this._y -= this.Vy;
         this.Vy -= Vg2;
         if(this.status_3 == "hurt")
         {
            delete this.onEnterFrame;
         }
         if(this._y > this.land_Y)
         {
            this.stop_move_Y1(end);
         }
      };
   }
   function start_move_Y2_onland(y, x, end, g)
   {
      this.status_2 = "toLand";
      this.Vy = y;
      this.Vx = this.dir * x;
      var Vg2;
      if(g != 0 && g != null)
      {
         Vg2 = g;
      }
      else
      {
         Vg2 = this.Vg;
      }
      this.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(this.inFreeze)
         {
            return undefined;
         }
         this.do_move(this.Vx);
         this._y -= this.Vy;
         this.Vy -= Vg2;
         if(this._y > this.land_Y)
         {
            this.stop_move_Y1(end);
         }
      };
   }
   function stop_move_Y1(end)
   {
      delete this.onEnterFrame;
      this._y = this.land_Y;
      this.status_2 = "land";
      if(!end || end == "")
      {
         this.land();
      }
      else if(end == "none")
      {
         this.mc.play();
         this.status_2 = "land";
      }
      else if(end.indexOf("frame") != -1)
      {
         this.mc.gotoAndPlay(end);
         this.status_2 = "land";
      }
      else if(this.mc.nextSkill != undefined)
      {
         this.toStatus(this.mc.nextSkill);
      }
      else
      {
         this.toStatus(end);
      }
   }
   function hurtBack(f_r)
   {
      this.Vx = this.hurtValue.Vx;
      var status_now = this.mc;
      var ft = this.hurtValue.freezeTime2;
      this.status_5 = "hitBack";
      if((this.status_1 == "hold_u" || this.status_1 == "hold_d") && this.Vx > 21)
      {
         this.Vx = 21;
      }
      if(this.status_1 == "hold_d" && this.opp.status_1 == "squatKick")
      {
         this.Vx = 20;
      }
      if(this.hurtValue.defendBackCustom != 0 && (this.status_1 == "hold_u" || this.status_1 == "hold_d"))
      {
         this.Vx = this.hurtValue.defendBackCustom;
      }
      this.egdecheck(this.Vx * this.opp.dir);
      if(this._parent.dirs == 1 || this._parent.dirs == -1)
      {
         this.Vx *= this.dirs;
      }
      this.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(_level0.inFreeze)
         {
            return undefined;
         }
         if(this.inFreeze)
         {
            return undefined;
         }
         if(ft > 0)
         {
            status_now.stop();
            ft--;
            return undefined;
         }
         if(ft <= 0)
         {
            status_now.play();
            ft = -1;
         }
         if(this.Vx != 0)
         {
            if(this.hurtValue.edgeNotBack == undefined)
            {
               this.hurtValue.edgeNotBack = false;
            }
            if(this.onEgde && !this.hurtValue.isObj && this.status_2 == "land" && !this.hurtValue.edgeNotBack)
            {
               this.opp.do_move((- this.Vx) * this.opp.dir);
            }
            else if(this.baiHeZhe)
            {
               this.do_move((- this.Vx) * this.dir);
            }
            else
            {
               this.do_move(this.Vx * this.opp.dir);
            }
         }
         var _loc2_;
         if(this.hurtValue.a != 0 && this.hurtValue.a != undefined)
         {
            _loc2_ = this.hurtValue.a;
         }
         else
         {
            _loc2_ = this.Va;
         }
         this.Vx -= _loc2_;
         if(this.Vx <= 0)
         {
            delete this.onEnterFrame;
            status_now.play();
         }
      };
   }
   function holdBack()
   {
      this.holdFreeze = true;
      this.noCatch = true;
      this.Vx = this.hurtValue.Vx;
      var status_now = this.mc;
      var ft = 0;
      if(this.hurtValue.freezeTimehold == undefined || this.hurtValue.freezeTimehold == 0)
      {
         if(this.hurtValue.hurtBack == "hurt1")
         {
            if(this.hurtValue.flag == "1" || this.hurtValue.flag == 1)
            {
               ft += 3;
            }
            else
            {
               ft += 2;
            }
         }
         else if(this.hurtValue.hurtBack == "hurt2")
         {
            if(this.hurtValue.flag == "1" || this.hurtValue.flag == 1)
            {
               ft += 2;
            }
            else
            {
               ft += 1;
            }
         }
         else if(this.hurtValue.hurtBack == "")
         {
            if(this.hurtValue.hurtAway == "hurt3")
            {
               ft += 4;
            }
            else if(this.hurtValue.hurtAway == "hurt4")
            {
               ft += 5;
            }
            else if(this.hurtValue.hurtAway == "hurt5")
            {
               ft += 3;
            }
            else
            {
               ft += 4;
            }
         }
         else
         {
            ft += 4;
         }
         if(this.hurtValue.freezeTime2 < 2)
         {
            ft += this.hurtValue.freezeTime2;
         }
         else if(this.hurtValue.freezeTime2 < 5)
         {
            ft += 2;
         }
         else if(this.hurtValue.freezeTime2 > 4)
         {
            ft += 3;
         }
         if(this.hurtValue.freezeTime < 5)
         {
            ft += 2;
         }
         else if(this.hurtValue.freezeTime < 8)
         {
            ft += 3;
         }
         else if(this.hurtValue.freezeTime > 7)
         {
            ft += 4;
         }
      }
      else
      {
         ft = this.hurtValue.freezeTimehold;
      }
      this.status_5 = "hitBack";
      if((this.status_1 == "hold_u" || this.status_1 == "hold_d") && this.Vx > 21)
      {
         this.Vx = 21;
      }
      if(this.status_1 == "hold_d" && this.opp.status_1 == "squatKick")
      {
         this.Vx = 20;
      }
      if(this.normalPunchlKickList.join().indexOf(this.opp.status_1) > -1 && (this.status_1 == "hold_u" || this.status_1 == "hold_d") && Math.abs(this._x - this.opp._x) < 250)
      {
         this.Vx += 3;
         if(_level0.play_type == "1PVS2P" && this.inBurst && this.burst_mode == "defend")
         {
            this.Vx += 3;
         }
      }
      else if(this.opp.status_1.indexOf("jumpSkill_heavyHit") > -1)
      {
         this.Vx += 2;
         ft += 7;
         if(_level0.play_type == "1PVS2P" && this.inBurst && this.burst_mode == "defend" && (this.status_1 == "hold_u" || this.status_1 == "hold_d") && Math.abs(this._x - this.opp._x) < 250)
         {
            this.Vx += 3;
         }
      }
      else if(this.opp.status_1.indexOf("jumpSkill") > -1)
      {
         ft += 5;
         this.Vx += 2;
         if(_level0.play_type == "1PVS2P" && this.inBurst && this.burst_mode == "defend" && (this.status_1 == "hold_u" || this.status_1 == "hold_d") && Math.abs(this._x - this.opp._x) < 250)
         {
            this.Vx += 3;
         }
      }
      if(this.hurtValue.defendBackCustom != 0 && (this.status_1 == "hold_u" || this.status_1 == "hold_d"))
      {
         this.Vx = this.hurtValue.defendBackCustom;
      }
      if(this.hurtValue.isObj)
      {
         this.Vx *= 0.6666666666666666;
      }
      this.egdecheck(this.Vx * this.opp.dir);
      if(this._parent.dirs == 1 || this._parent.dirs == -1)
      {
         this.Vx *= this.dirs;
      }
      this.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(_level0.inFreeze)
         {
            return undefined;
         }
         if(this.inFreeze)
         {
            return undefined;
         }
         this.noCatch = true;
         if(this.Vx > 0)
         {
            status_now.stop();
            if(this.hurtValue.edgeNotBack == undefined)
            {
               this.hurtValue.edgeNotBack = false;
            }
            if(this.onEgde && !this.hurtValue.isObj && this.status_2 == "land" && !this.hurtValue.edgeNotBack)
            {
               this.opp.do_move((- this.Vx) * this.opp.dir);
            }
            else if(this.baiHeZhe)
            {
               this.do_move((- this.Vx) * this.dir);
            }
            else
            {
               this.do_move(this.Vx * this.opp.dir);
            }
         }
         var _loc2_;
         if(this.hurtValue.a != 0 && this.hurtValue.a != undefined)
         {
            _loc2_ = this.hurtValue.a + 0.5;
         }
         else
         {
            _loc2_ = this.Va + 0.5;
         }
         this.Vx -= _loc2_;
         if(ft > 0)
         {
            status_now.stop();
            ft--;
         }
         if(this.status_1 == "hold_u" || this.status_1 == "hold_d")
         {
            if(ft == 4)
            {
               if(this.mc.toDefendEnd() != undefined)
               {
                  this.mc.goStand = true;
                  this.mc.gotoAndPlay(this.mc.toDefendEnd());
               }
            }
         }
         if(this.Vx <= 0 && ft <= 0)
         {
            this.holdFreeze = false;
            delete this.onEnterFrame;
            status_now.play();
            this.noCatchT2 = 12;
            clearInterval(this.noCatchT);
            this.noCatchT = setInterval(this,"noCatchTimer",10);
            return undefined;
         }
      };
   }
   function stop_hurtBack()
   {
      delete this.onEnterFrame;
      this.mc.play();
   }
   function noCatchTimer(t)
   {
      if(_level0.inPause)
      {
         return undefined;
      }
      if(_level0.inFreeze)
      {
         return undefined;
      }
      if(this.inFreeze)
      {
         return undefined;
      }
      if(this.noCatchT2 <= 0)
      {
         this.noCatch = false;
         clearInterval(this.noCatchT);
         return undefined;
      }
      this.noCatch = true;
      this.noCatchT2 = this.noCatchT2 - 1;
      return undefined;
   }
   function farJumpTimer(t)
   {
      if(_level0.inPause)
      {
         return undefined;
      }
      if(_level0.inFreeze)
      {
         return undefined;
      }
      if(this.inFreeze)
      {
         return undefined;
      }
      if(this.farJumpT2 <= 0)
      {
         this.farJump = false;
         clearInterval(this.farJumpT);
         return undefined;
      }
      this.farJump = true;
      this.farJumpT2 = this.farJumpT2 - 1;
      return undefined;
   }
   function hurtAway()
   {
      this.status_4 = "air";
      if(this.hurtValue.freezeTimeair == undefined || this.hurtValue.freezeTimeair == 0)
      {
         var dirs = 1;
         if(this.hurtValue.dirs == -1)
         {
            dirs = -1;
         }
         else if(this.hurtValue.dirs == 1)
         {
            dirs = 1;
         }
         else
         {
            dirs = 0;
         }
         this.status_2 = "air";
         if(this.hurtValue.hurtAway == "hurt6")
         {
            this.hurtValue.Vy = 35;
            this.hurtValue.Vx = 10;
            this.hurtValue.a = 3;
            this.hurtValue.g = 4.5;
            this.Vy = 35;
            this.Vx = 10;
         }
         if(this.hurtValue.dirs == 1 || this.hurtValue.dirs == -1)
         {
            this.Vx = this.hurtValue.Vx * dirs;
         }
         else if(this.dir == this.opp.dir)
         {
            this.Vx = this.hurtValue.Vx * this.dir;
         }
         else
         {
            this.Vx = this.hurtValue.Vx * this.dir * -1;
         }
         this.Vy = this.hurtValue.Vy;
         if(this.onEgde && !this.hurtValue.isObj && this.opp.status_2 == "land")
         {
            this.opp.do_move(- this.Vx);
         }
         this.enterHurtAway();
      }
      else
      {
         var dirs = 1;
         var status_now = this.mc;
         if(this.hurtValue.dirs == -1)
         {
            dirs = -1;
         }
         else if(this.hurtValue.dirs == 1)
         {
            dirs = 1;
         }
         else
         {
            dirs = 0;
         }
         if(this._y == 445)
         {
         }
         var ft = -1;
         if(this.hurtValue.freezeTimeair == undefined || this.hurtValue.freezeTimeair == 0)
         {
            ft = -1;
         }
         else
         {
            ft = this.hurtValue.freezeTimeair;
         }
         this.onEnterFrame = function()
         {
            if(_level0.inPause)
            {
               return undefined;
            }
            if(_level0.inFreeze)
            {
               return undefined;
            }
            if(ft > 0)
            {
               status_now.stop();
               ft--;
               return undefined;
            }
            if(ft <= 0)
            {
               if(this.hurtValue.hurtAway == "hurt1" || this.hurtValue.hurtAway == "hurt2")
               {
                  this.toStatus("hurt3");
                  this.mc.gotoAndPlay(this.hurtValue.flagair);
               }
               status_now.play();
               ft = -1;
               this.status_2 = "air";
               if(this.hurtValue.dirs == 1 || this.hurtValue.dirs == -1)
               {
                  this.Vx = this.hurtValue.Vx * dirs;
               }
               else if(this.dir == this.opp.dir)
               {
                  this.Vx = this.hurtValue.Vx * this.dir;
               }
               else
               {
                  this.Vx = this.hurtValue.Vx * this.dir * -1;
               }
               this.Vy = this.hurtValue.Vy;
               if(this.onEgde && !this.hurtValue.isObj && this.opp.status_2 == "land")
               {
                  this.opp.do_move(- this.Vx);
               }
               this.enterHurtAway();
            }
         };
      }
   }
   function hurtAway_self(v1, v2, end)
   {
      this.status_2 = "air";
      if(this._xscale == this.opp._xscale)
      {
         this.Vx = v1 * this.dir;
      }
      else
      {
         this.Vx = v1 * this.dir * -1;
      }
      this.Vy = v2;
      this.hurtValue.Vy = v2;
      this.hurtValue.end_status = end;
      this.enterHurtAway();
   }
   function enterHurtAway()
   {
      this.onEnterFrame = function()
      {
         if(this.status_1 == "hurt_crash3")
         {
            this.status_1 = "hurt_crash4";
            if(this.dir == 1)
            {
               this.chageSide2();
            }
            else
            {
               this.chageSide1();
            }
         }
         this.do_hurtAway();
      };
   }
   function do_hurtAway()
   {
      if(_level0.inPause)
      {
         return undefined;
      }
      if(_level0.inFreeze)
      {
         return undefined;
      }
      if(this.inFreeze)
      {
         return undefined;
      }
      this.do_move(this.Vx);
      this._y -= this.Vy;
      if(this.onEgde == true && this.status_3 != "down")
      {
         this.opp_hight2 = this.opp_hight + 180;
      }
      else if(this.status_1 == "hurt_crash2")
      {
         this.opp_hight2 = this.opp_hight;
      }
      else if(this.status_3 != "down")
      {
         this.opp_hight2 = this.opp_hight + 40;
      }
      else
      {
         this.opp_hight2 = this.opp_hight - 40;
      }
      var _loc2_;
      if(this.hurtValue.zeroGrav == undefined)
      {
         this.hurtValue.zeroGrav = false;
      }
      if(this.hurtValue.g != 0 && this.hurtValue.g != undefined)
      {
         _loc2_ = this.hurtValue.g;
      }
      else if(this.hurtValue.g == 0 && this.hurtValue.zeroGrav == true)
      {
         _loc2_ = 0;
      }
      else
      {
         _loc2_ = this.Vg;
      }
      this.Vy -= _loc2_;
      if(this._y > this.land_Y)
      {
         this.stop_hurtAway();
      }
      if(this.status_1 == "hurt_crash" && this.mc._currentframe > 1 && (this._x + _level0.char_mc._x > _level0.stage_with - 75 || this._x + _level0.char_mc._x < 75))
      {
         delete this.onEnterFrame;
         this.status_1 = "hurt_crash3";
         this.hurtValue.end_status = "getup2";
         this.hurtValue.Vx = -10;
         this.hurtValue.Vy = 60;
         this.hurtValue.a = 3;
         this.hurtValue.g = 5;
         this.hurtAway();
         if(this._x + _level0.char_mc._x < 75)
         {
            _level0.effect_mc.downEff("crash_eff",this._x - 40,this._y - 75,1);
         }
         else
         {
            _level0.effect_mc.downEff("crash_eff",this._x + 80,this._y - 75,-1);
         }
         this.mc.gotoAndPlay("hit");
      }
      else if(this.status_1 == "hurt_crash2" && this.mc._currentframe > 1 && (this._x + _level0.char_mc._x > _level0.stage_with - 55 || this._x + _level0.char_mc._x < 55))
      {
         delete this.onEnterFrame;
         this.status_1 = "hurt_crash3";
         this.hurtValue.end_status = "getup2";
         this.hurtValue.freezeTimeair = 6;
         this.hurtValue.Vx = -25;
         this.hurtValue.Vy = 19;
         this.hurtValue.a = 1;
         this.hurtValue.g = 1.2;
         this.mc.gotoAndPlay("hit");
         this.hurtAway();
      }
      else if(this.status_1 == "hurt_crash5" && this.mc._currentframe > 1 && (this._x + _level0.char_mc._x > _level0.stage_with - 55 || this._x + _level0.char_mc._x < 55))
      {
         delete this.onEnterFrame;
         this.status_1 = "hurt_crash3";
         this.hurtValue.end_status = "getup2";
         this.hurtValue.Vx = -5;
         this.hurtValue.Vy = 5;
         this.hurtValue.a = 3;
         this.hurtValue.g = 5;
         this.mc.gotoAndPlay("hit");
         this.hurtAway();
      }
   }
   function stop_hurtAway()
   {
      delete this.onEnterFrame;
      this.opp_hight2 = this.opp_hight - 40;
      this.status_2 = "";
      this._y = this.land_Y;
      if(this.status_1 == "hurt6")
      {
         this.status_3 = "";
         this.toStatus_switch("stand");
      }
      else if(this.status_1 == "kneeldown")
      {
         this.toStatus("getup2");
         this.mc.gotoAndPlay("down");
         _level0.shake_mc.shakeStart(1,5);
         this.status_5 = "hitDown";
      }
      else if(this.hurtValue.end_status == "none")
      {
         this.mc.play();
         _level0.shake_mc.shakeStart(1,5);
      }
      else if(this.hurtValue.end_status == "")
      {
         this.hurtValue.g = 5;
         if(this.Vx > 25 || this.Vx < -25)
         {
            this.toStatus("getup2");
         }
         else
         {
            this.toStatus("getup1");
         }
         _level0.shake_mc.shakeStart(1,5);
         this.status_5 = "hitDown";
      }
      else
      {
         this.hurtValue.g = 5;
         this.toStatus(this.hurtValue.end_status);
         _level0.shake_mc.shakeStart(1,5);
         this.status_5 = "hitDown";
      }
      if(this.hurtValue.Vy < 0)
      {
         _level0.effect_mc.downEff("down3",this._x,this._y,this.dir);
      }
      else
      {
         _level0.effect_mc.downEff("down2",this._x,this._y,this.dir);
      }
   }
   function do_hitTest(obj)
   {
      if(this.dir == 1)
      {
         if(this.opp._x - this._x - 30 <= obj._width)
         {
            return true;
         }
      }
      else if(this._x - this.opp._x - 30 <= obj._width)
      {
         return true;
      }
      if(this.opp.status_3 == "down")
      {
         if(obj.hitTest(this.opp.mc))
         {
            return true;
         }
      }
   }
   function do_hitTest2(obj)
   {
      if(this.dir == 1)
      {
         if(this.opp._x - this._x - 30 <= obj._width && this.opp._x >= this._x)
         {
            return true;
         }
      }
      else if(this._x - this.opp._x - 30 <= obj._width && this.opp._x <= this._x)
      {
         return true;
      }
      if(this.opp.status_3 == "down")
      {
         if(obj.hitTest(this.opp.mc))
         {
            return true;
         }
      }
   }
   function move_HitTest(obj, attFrame, endFrame, S, v, oppNotInStatus)
   {
      var opp = this.opp;
      var role = this;
      var status_mc = this.mc;
      var Sx = S;
      var Vx = v;
      obj.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(role.inFreeze)
         {
            return undefined;
         }
         if(_level0.inFreeze)
         {
            return undefined;
         }
         role.do_move(role.dir * Vx);
         Sx -= Vx;
         if(this.hitTest(opp.mc.body))
         {
            if(oppNotInStatus && opp.status_3 == "down")
            {
               status_mc.gotoAndPlay(endFrame);
            }
            else
            {
               status_mc.gotoAndPlay(attFrame);
            }
            delete this.onEnterFrame;
         }
         else if(Sx < 0)
         {
            status_mc.gotoAndPlay(endFrame);
            delete this.onEnterFrame;
         }
      };
   }
   function catch_check()
   {
      if((this.opp.status_1 == "hold_u" || this.opp.status_1 == "hold_d") && this.opp.status_5 == "hitBack")
      {
         return false;
      }
      if(this.opp.noCatch == true && this.opp.status_3 != "hurt")
      {
         return false;
      }
      if(this.opp.nosh == true)
      {
         return false;
      }
      if(!_level0.inPause && this.status_1 != "dash_f" && this.status_1 != "dash_ex" && this.status_2 != "toLand" && this.opp.status_2 != "air" && this.opp.status_3 != "hurt" && this.opp.status_3 != "down" && !this.opp.holdFreeze && !this.holdFreeze)
      {
         if(this.checkTouch3())
         {
            if(this.opp.status_3 != "normal" || this.opp.status_2 != "land")
            {
               this.opp.canBreakCatch = false;
            }
            else
            {
               this.opp.canBreakCatch = true;
            }
            return true;
         }
      }
   }
   function catch_checkAir()
   {
      if(!_level0.inPause && this.status_1 != "dash_f" && this.status_1 != "dash_ex" && this.status_2 != "toLand" && this.opp.status_2 != "land" && this.opp.status_3 != "hurt" && this.opp.status_3 != "down" && !this.opp.holdFreeze)
      {
         if(this.checkTouch(80 * this.dir,true))
         {
            return true;
         }
      }
   }
   function catch_HitTest(obj, status_c, flag, condition_land, condition_hurt, downHit, superMoveEffect, visibility, changeDir, id, hitID)
   {
      if(this.opp.noCatch == true && this.opp.status_3 != "hurt")
      {
         return false;
      }
      if(condition_land)
      {
         if(this.opp.status_2 == "air")
         {
            return undefined;
         }
      }
      if(condition_hurt)
      {
         if(!(this.opp.status_3 == "hurt" || this.opp.status_3 == ""))
         {
            if(!(this.opp.status_3 == "down" && this.onHit))
            {
               return undefined;
            }
         }
      }
      if(downHit == false)
      {
         if(this.opp.status_3 == "down")
         {
            return undefined;
         }
      }
      var _loc2_ = this._x + obj._x * this.dir;
      if(_level0.char_mc._x + _loc2_ > this.egde_max)
      {
         _loc2_ = this.egde_max - _level0.char_mc._x;
         this.opp._x = _loc2_;
      }
      if(_level0.char_mc._x + _loc2_ < this.egde_min)
      {
         _loc2_ = this.egde_min - _level0.char_mc._x;
         this.opp._x = _loc2_;
      }
      var _loc3_;
      if(obj.hitTest(this.opp.mc))
      {
         delete this.opp.onEnterFrame;
         this.opp.toStatus(status_c);
         this.opp.gotoAndStop(status_c);
         this.opp.mc.gotoAndStop(flag);
         this.opp.status_2 = "land";
         this.opp.status_3 = "hurt";
         this.onHit = true;
         this.status_4 = "normal";
         this.ida = id;
         this.opp.status_7 = this.ida;
         hitID = this.ida;
         hitID = id;
         _loc3_ = this._y + obj._y;
         this.opp._x = _loc2_;
         this.opp.inCount = false;
         this.opp.countEnd();
         this.opp.countTimes = 0;
         if(changeDir && this.dir == this.opp.dir)
         {
            if(this.dir == 1)
            {
               this.opp.chageSide2();
            }
            else
            {
               this.opp.chageSide1();
            }
         }
         if(visibility == undefined)
         {
            visibility = true;
         }
         if(visibility)
         {
            if(superMoveEffect)
            {
               _level0.effect_mc.hitFire("hitFire3_super",_loc2_,_loc3_);
            }
            else
            {
               _level0.effect_mc.hitFire("hitFire3",_loc2_,_loc3_);
            }
         }
         this.topLayer();
         this.onEnterFrame = function()
         {
            this.opp.mc.stop();
            if(this.opp.status_1 != status_c)
            {
               this.opp.mc.play();
               delete this.onEnterFrame;
            }
         };
      }
      else
      {
         this.onHit = false;
         if(this.status_1 == "pitch")
         {
            this.toStatus("punch");
         }
         else if(this.status_1 == "pitch2")
         {
            this.toStatus("kick");
         }
         else
         {
            this.toStatus("stand");
         }
      }
   }
   function catch_HitTest2(obj, status_c, flag, condition_land, condition_hurt, downHit, rollhit, holdhit, superMoveEffect, visibility, changeDir, id, hitID, nohitflag, nohit_status)
   {
      if(_level0.inPause)
      {
         return undefined;
      }
      if(this.opp.nosh == true || !this.opp.mc.body && this.opp.status_3 != "roll")
      {
         this.onHit = false;
         this.gotoAndPlay(nohitflag);
         return undefined;
      }
      if(condition_land)
      {
         if(this.opp.status_2 == "air")
         {
            this.onHit = false;
            this.gotoAndPlay(nohitflag);
            return undefined;
         }
      }
      if(condition_hurt)
      {
         if(!(this.opp.status_3 == "hurt" || this.opp.status_3 == ""))
         {
            if(!(this.opp.status_3 == "down" && this.onHit))
            {
               this.onHit = false;
               this.gotoAndPlay(nohitflag);
               return undefined;
            }
         }
      }
      if(downHit == false)
      {
         if(this.opp.status_3 == "down")
         {
            this.onHit = false;
            this.gotoAndPlay(nohitflag);
            return undefined;
         }
      }
      else if(this.opp.status_3 == "down" && !this.opp.mc.body)
      {
         this.onHit = false;
         this.gotoAndPlay(nohitflag);
         return undefined;
      }
      if(!rollhit && this.opp.status_3 == "roll")
      {
         this.onHit = false;
         this.gotoAndPlay(nohitflag);
         return undefined;
      }
      if(!holdhit && this.opp.noCatch == true && this.opp.status_3 != "hurt")
      {
         this.onHit = false;
         this.gotoAndPlay(nohitflag);
         return undefined;
      }
      var _loc2_;
      if(nohit_status.length > 0)
      {
         for(var _loc7_ in nohit_status)
         {
            _loc2_ = nohit_status[_loc7_];
            if(this.opp.status_1 == _loc2_)
            {
               return undefined;
            }
            if(this.opp.status_2 == _loc2_)
            {
               return undefined;
            }
         }
      }
      if(!(this.dir == 1 && this.opp._x - this._x <= obj._width && this.opp._x >= this._x - 30 && obj.hitTest(this.opp.mc)))
      {
         if(!(this.dir == -1 && this._x - this.opp._x <= obj._width && this.opp._x <= this._x + 30 && obj.hitTest(this.opp.mc)))
         {
            this.onHit = false;
            this.gotoAndPlay(nohitflag);
            return undefined;
         }
      }
      delete this.opp.onEnterFrame;
      this.opp.toStatus(status_c);
      this.opp.gotoAndStop(status_c);
      this.opp.mc.gotoAndStop(flag);
      this.opp.status_2 = "land";
      this.opp.status_3 = "hurt";
      this.onHit = true;
      this.opp.countEnd();
      this.ida = id;
      this.nosh = true;
      this.opp.status_7 = this.ida;
      hitID = this.ida;
      hitID = id;
      var _loc4_ = this._x + obj._x * this.dir;
      var _loc8_ = this._y + obj._y;
      if(_level0.char_mc._x + _loc4_ > this.egde_max)
      {
         _loc4_ = this.egde_max - _level0.char_mc._x;
      }
      else if(_level0.char_mc._x + _loc4_ < this.egde_min)
      {
         _loc4_ = this.egde_min - _level0.char_mc._x;
      }
      this.opp._x = _loc4_;
      if(changeDir && this.dir == this.opp.dir)
      {
         if(this.dir == 1)
         {
            this.opp.chageSide2();
         }
         else
         {
            this.opp.chageSide1();
         }
      }
      if(visibility == undefined)
      {
         visibility = true;
      }
      if(visibility)
      {
         if(superMoveEffect)
         {
            _level0.effect_mc.hitFire("hitFire3_super",_loc4_,_loc8_);
         }
         else
         {
            _level0.effect_mc.hitFire("hitFire3",_loc4_,_loc8_);
         }
      }
      this.topLayer();
      this.onEnterFrame = function()
      {
         this.opp.mc.stop();
         if(this.opp.status_1 != status_c)
         {
            this.opp.mc.play();
            delete this.onEnterFrame;
         }
      };
   }
   function catch_HitTest3(obj, status_c, flag, condition_land, condition_hurt, downHit, rollhit, holdhit, superMoveEffect, visibility, changeDir, id, hitID, hitflag, nohit_status, Vx, f)
   {
      var num = f;
      var nohit = true;
      this.onEnterFrame = function()
      {
         if(_level0.inPause || _level0.inFreeze)
         {
            return undefined;
         }
         num--;
         if(num < 0)
         {
            delete this.onEnterFrame;
            return undefined;
         }
         if(this.status_3 == "hurt" || this.status_3 == "down")
         {
            return undefined;
         }
         if(Vx > 0)
         {
            this.do_move(this.dir * Vx);
         }
         if(this.opp.nosh == true || !this.opp.mc.body && this.opp.status_3 != "roll")
         {
            return undefined;
         }
         if(condition_land)
         {
            if(this.opp.status_2 == "air")
            {
               return undefined;
            }
         }
         if(condition_hurt)
         {
            if(!(this.opp.status_3 == "hurt" || this.opp.status_3 == ""))
            {
               if(!(this.opp.status_3 == "down" && this.onHit))
               {
                  return undefined;
               }
            }
         }
         if(downHit == false)
         {
            if(this.opp.status_3 == "down")
            {
               return undefined;
            }
         }
         else if(!this.opp.mc.body)
         {
            return undefined;
         }
         if(!rollhit && this.opp.status_3 == "roll")
         {
            return undefined;
         }
         if(!holdhit && this.opp.noCatch == true && this.opp.status_3 != "hurt")
         {
            return undefined;
         }
         var _loc2_;
         if(nohit_status.length > 0)
         {
            for(var _loc4_ in nohit_status)
            {
               _loc2_ = nohit_status[_loc4_];
               if(this.opp.status_1 == _loc2_)
               {
                  return undefined;
               }
               if(this.opp.status_2 == _loc2_)
               {
                  return undefined;
               }
            }
         }
         if(this.dir == 1 && this.opp._x - this._x <= obj._width && this.opp._x >= this._x - 30 && obj.hitTest(this.opp.mc))
         {
            nohit = false;
         }
         else
         {
            if(!(this.dir == -1 && this._x - this.opp._x <= obj._width && this.opp._x <= this._x + 30 && obj.hitTest(this.opp.mc)))
            {
               return undefined;
            }
            nohit = false;
         }
         var _loc3_;
         var _loc5_;
         if(nohit == false)
         {
            delete this.onEnterFrame;
            delete this.opp.onEnterFrame;
            this.opp.toStatus(status_c);
            this.opp.gotoAndStop(status_c);
            this.opp.mc.gotoAndStop(flag);
            this.opp.status_2 = "land";
            this.opp.status_3 = "hurt";
            this.onHit = true;
            this.opp.countEnd();
            this.ida = id;
            this.nosh = true;
            this.opp.status_7 = this.ida;
            hitID = this.ida;
            hitID = id;
            _loc3_ = this._x + obj._x * this.dir;
            _loc5_ = this._y + obj._y;
            if(_level0.char_mc._x + _loc3_ > this.egde_max)
            {
               _loc3_ = this.egde_max - _level0.char_mc._x;
            }
            else if(_level0.char_mc._x + _loc3_ < this.egde_min)
            {
               _loc3_ = this.egde_min - _level0.char_mc._x;
            }
            this.opp._x = _loc3_;
            if(changeDir && this.dir == this.opp.dir)
            {
               if(this.dir == 1)
               {
                  this.opp.chageSide2();
               }
               else
               {
                  this.opp.chageSide1();
               }
            }
            if(visibility == undefined)
            {
               visibility = true;
            }
            if(visibility)
            {
               if(superMoveEffect)
               {
                  _level0.effect_mc.hitFire("hitFire3_super",_loc3_,_loc5_);
               }
               else
               {
                  _level0.effect_mc.hitFire("hitFire3",_loc3_,_loc5_);
               }
            }
            this.topLayer();
            this.opp.mc.stop();
            this.mc.gotoAndPlay(hitflag);
            nohit = false;
         }
      };
   }
   function catch_oppPos(obj, status_c, flag, land, hurt)
   {
      if(this.opp.nosh == true)
      {
         return undefined;
      }
      if(this.opp.status_2 == "air" && land)
      {
         return undefined;
      }
      if(this.opp.status_3 != "hurt" && this.opp.status_3 != "down" && hurt)
      {
         return undefined;
      }
      var _loc2_;
      var _loc3_;
      if(obj.hitTest(this.opp.mc.body))
      {
         this.opp.nosh = false;
         this.onHit = true;
         this.opp.status_3 = "hurt";
         this.opp.status_6 = "normal";
         this.opp.toStatus(status_c);
         this.opp.mc.gotoAndStop(flag);
         _loc2_ = this._x + obj._x * this.dir;
         _loc3_ = this._y + obj._y;
         if(_level0.char_mc._x + _loc2_ > this.egde_max)
         {
            _loc2_ = this.egde_max - _level0.char_mc._x;
         }
         else if(_level0.char_mc._x + _loc2_ < this.egde_min)
         {
            _loc2_ = this.egde_min - _level0.char_mc._x;
         }
         this.opp._x = _loc2_;
         this.opp._y = _loc3_;
         if(this.dir == this.opp.dir)
         {
            if(this.dir == 1)
            {
               this.opp.chageSide2();
            }
            else
            {
               this.opp.chageSide1();
            }
         }
      }
      else
      {
         this.onHit = false;
      }
   }
   function catch_oppPos2(obj, obj2, status_c, flag, condition_land, condition_hurt, downHit, oppDirChange, rollHit, condition_air, hitID)
   {
      if(this.opp.nosh == true)
      {
         return undefined;
      }
      if(condition_air)
      {
         if(this.opp.status_2 == "air" || this.opp.status_1 == "hurt6")
         {
            return undefined;
         }
      }
      if(condition_land)
      {
         if(this.opp.status_2 == "air" || this.opp.status_1 == "hurt6")
         {
            return undefined;
         }
      }
      if(condition_hurt)
      {
         if(!(this.opp.status_3 == "hurt" || this.opp.status_3 == ""))
         {
            if(!(this.opp.status_3 == "down" && this.onHit))
            {
               return undefined;
            }
         }
      }
      if(!downHit)
      {
         if(this.opp.status_3 == "down")
         {
            return undefined;
         }
      }
      var _loc5_;
      var _loc2_;
      var _loc4_;
      var _loc3_;
      if(obj.hitTest(this.opp.mc.body) || rollHit && obj.hitTest(this.opp) && this.opp.status_3 == "roll")
      {
         this.opp.nosh = false;
         this.onHit = true;
         this.opp.status_3 = "hurt";
         this.opp.toStatus(status_c);
         this.opp.mc.gotoAndStop(flag);
         this.opp.skillCount = false;
         this.opp.inCount = false;
         this.opp.status_7 = hitID;
         this.opp.status_2 = "land";
         delete this.opp.onEnterFrame;
         _loc5_ = Func.lToG(obj2);
         _loc2_ = _loc5_.x;
         _loc4_ = _loc5_.y;
         if(_level0._xscale != 100)
         {
            if(_loc2_ > this.egde_max * _level0._xscale)
            {
               _loc2_ = this.egde_max * _level0._xscale;
            }
            else if(_loc2_ < this.egde_min)
            {
               _loc2_ = this.egde_min;
            }
            _loc3_ = new Object();
            _loc3_.x = _loc2_;
            _loc3_.y = _loc4_;
            _level0.char_mc.globalToLocal(_loc3_);
            this.opp._x = _loc3_.x;
            this.opp._y = _loc3_.y;
         }
         else
         {
            if(_loc2_ > this.egde_max)
            {
               _loc2_ = this.egde_max;
            }
            else if(_loc2_ < this.egde_min)
            {
               _loc2_ = this.egde_min;
            }
            _loc3_ = new Object();
            _loc3_.x = _loc2_;
            _loc3_.y = _loc4_;
            _level0.char_mc.globalToLocal(_loc3_);
            this.opp._x = _loc3_.x;
            this.opp._y = _loc3_.y;
         }
         if(this.dir == this.opp.dir)
         {
            if(this.dir == 1)
            {
               this.opp.chageSide2();
            }
            else
            {
               this.opp.chageSide1();
            }
         }
         return true;
      }
      this.onHit = false;
   }
   function catch_oppPos21(obj, obj2, status_c, flag, condition_land, condition_hurt, downHit, oppDirChange, rollHit, condition_air, hitID)
   {
      if(this.opp.nosh == true)
      {
         return undefined;
      }
      if(condition_land)
      {
         if(this.opp.status_2 == "air" || this.opp.status_1 == "hurt6")
         {
            return undefined;
         }
      }
      if(condition_hurt)
      {
         if(!(this.opp.status_3 == "hurt" || this.opp.status_3 == ""))
         {
            if(!(this.opp.status_3 == "down" && this.onHit))
            {
               return undefined;
            }
         }
      }
      if(!downHit)
      {
         if(this.opp.status_3 == "down")
         {
            return undefined;
         }
      }
      var _loc5_;
      var _loc2_;
      var _loc4_;
      var _loc3_;
      if(obj.hitTest(this.opp.mc.body) || rollHit && obj.hitTest(this.opp) && this.opp.status_3 == "roll" || obj.hitTest(this.opp.mc))
      {
         this.opp.nosh = false;
         this.onHit = true;
         this.opp.status_3 = "hurt";
         this.opp.toStatus(status_c);
         this.opp.mc.gotoAndStop(flag);
         this.opp.skillCount = false;
         this.opp.inCount = false;
         this.opp.status_7 = hitID;
         this.opp.status_2 = "land";
         delete this.opp.onEnterFrame;
         _loc5_ = Func.lToG(obj2);
         _loc2_ = _loc5_.x;
         _loc4_ = _loc5_.y;
         if(_level0._xscale != 100)
         {
            if(_loc2_ > this.egde_max * _level0._xscale)
            {
               _loc2_ = this.egde_max * _level0._xscale;
            }
            else if(_loc2_ < this.egde_min)
            {
               _loc2_ = this.egde_min;
            }
            _loc3_ = new Object();
            _loc3_.x = _loc2_;
            _loc3_.y = _loc4_;
            _level0.char_mc.globalToLocal(_loc3_);
            this.opp._x = _loc3_.x;
            this.opp._y = _loc3_.y;
         }
         else
         {
            if(_loc2_ > this.egde_max)
            {
               _loc2_ = this.egde_max;
            }
            else if(_loc2_ < this.egde_min)
            {
               _loc2_ = this.egde_min;
            }
            _loc3_ = new Object();
            _loc3_.x = _loc2_;
            _loc3_.y = _loc4_;
            _level0.char_mc.globalToLocal(_loc3_);
            this.opp._x = _loc3_.x;
            this.opp._y = _loc3_.y;
         }
         if(this.dir == this.opp.dir)
         {
            if(this.dir == 1)
            {
               this.opp.chageSide2();
            }
            else
            {
               this.opp.chageSide1();
            }
         }
         return true;
      }
      this.onHit = false;
   }
   function catch_oppPos22(obj, obj2, status_c, flag, condition_land, condition_hurt, downHit, oppDirChange, rollHit, ID)
   {
      if(this.opp.nosh == true)
      {
         return undefined;
      }
      if(condition_land)
      {
         if(this.opp.status_2 == "air" || this.opp.status_1 == "hurt6")
         {
            return undefined;
         }
      }
      if(condition_hurt)
      {
         if(!(this.opp.status_3 == "hurt" || this.opp.status_3 == ""))
         {
            if(!(this.opp.status_3 == "down" && this.onHit))
            {
               return undefined;
            }
         }
      }
      if(!downHit)
      {
         if(this.opp.status_3 == "down")
         {
            return undefined;
         }
      }
      var _loc5_;
      var _loc2_;
      var _loc4_;
      var _loc3_;
      if(obj.hitTest(this.opp.mc.body) || obj.hitTest(this.opp) && this.opp.status_3 == "roll")
      {
         this.opp.nosh = false;
         this.onHit = true;
         this.hitID = ID;
         this.opp.status_3 = "hurt";
         this.opp.toStatus(status_c);
         this.opp.mc.gotoAndStop(flag);
         this.opp.skillCount = false;
         this.opp.inCount = false;
         this.opp.status_2 = "land";
         delete this.opp.onEnterFrame;
         _loc5_ = Func.lToG(obj2);
         _loc2_ = _loc5_.x;
         _loc4_ = _loc5_.y;
         if(_level0._xscale != 100)
         {
            if(_loc2_ > this.egde_max * _level0._xscale)
            {
               _loc2_ = this.egde_max * _level0._xscale;
            }
            else if(_loc2_ < this.egde_min)
            {
               _loc2_ = this.egde_min;
            }
            _loc3_ = new Object();
            _loc3_.x = _loc2_;
            _loc3_.y = _loc4_;
            _level0.char_mc.globalToLocal(_loc3_);
            this.opp._x = _loc3_.x;
            this.opp._y = _loc3_.y;
         }
         else
         {
            if(_loc2_ > this.egde_max)
            {
               _loc2_ = this.egde_max;
            }
            else if(_loc2_ < this.egde_min)
            {
               _loc2_ = this.egde_min;
            }
            _loc3_ = new Object();
            _loc3_.x = _loc2_;
            _loc3_.y = _loc4_;
            _level0.char_mc.globalToLocal(_loc3_);
            this.opp._x = _loc3_.x;
            this.opp._y = _loc3_.y;
         }
         if(this.dir == this.opp.dir)
         {
            if(this.dir == 1)
            {
               this.opp.chageSide2();
            }
            else
            {
               this.opp.chageSide1();
            }
         }
         return true;
      }
      this.onHit = false;
      this.hitID = "nohit";
   }
   function throw_oppPos(obj, status_c, flag, land, hurt)
   {
      this.onHit = true;
      this.opp.status_2 = "air";
      this.opp.status_3 = "hurt";
      this.opp.toStatus(status_c);
      this.opp.mc.gotoAndStop(flag);
      var _loc2_ = this._x + obj._x * this.dir;
      var _loc4_ = this._y + obj._y;
      if(_level0.char_mc._x + _loc2_ > this.egde_max)
      {
         _loc2_ = this.egde_max - _level0.char_mc._x;
      }
      else if(_level0.char_mc._x + _loc2_ < this.egde_min)
      {
         _loc2_ = this.egde_min - _level0.char_mc._x;
      }
      this.opp._x = _loc2_;
      this.opp._y = _loc4_;
      if(obj.sameDir)
      {
         this.opp._xscale = this._xscale;
      }
      this.opp._rotation = obj._rotation;
      delete this.onEnterFrame;
   }
   function throw_hit(hurtV, obj)
   {
      this.opp._rotation = 0;
      this.opp.checkSide_abs();
      var _loc2_ = this._x + obj._x * this.dir;
      var _loc4_ = this._y + obj._y;
      if(_level0.char_mc._x + _loc2_ > this.egde_max)
      {
         _loc2_ = this.egde_max - _level0.char_mc._x;
      }
      else if(_level0.char_mc._x + _loc2_ < this.egde_min)
      {
         _loc2_ = this.egde_min - _level0.char_mc._x;
      }
      this.opp._x = _loc2_;
      this.opp._y = _loc4_;
      this.opp.hurtValue = hurtV;
      this.opp.toStatus(hurtV.hurtAway);
      this.opp.mc.gotoAndPlay(hurtV.flag);
      this.opp.hurtAway();
      this.powerObj.inc = 5 * hurtV.d_rate;
      this.powerObj.action = "inc";
      this.powerControl(this.powerObj);
   }
   function flyingObjHit(hitValue)
   {
      this.flyingObj.play();
   }
   function doHit(obj, a)
   {
      this.onHit = true;
      this.hitValue = obj;
      this.d_rate22 = a;
      if(this.hitValue.powerNum == undefined || this.hitValue.powerNum == undefined >= 1)
      {
         this.powerObj.inc = 5 * this.hitValue.d_rate * this.powerNum;
      }
      else
      {
         this.powerObj.inc = 5 * this.hitValue.d_rate * this.hitValue.powerNum * this.powerNum;
      }
      this.powerObj.action = "inc";
      this.powerControl(this.powerObj);
   }
   function doHurt(obj)
   {
      this.hurtValue = obj;
      this.checkHurt();
      this.opp.hitFire();
      if(this.hurtValue.shake != 0)
      {
         this.shakeCheck();
      }
      this.opp.topLayer();
      if(this.isKO && !this.KO_checked)
      {
         this.KO_checked = true;
         if(this.opp.superSkill || this.opp.isBurstSkill)
         {
            _level0.effect_mc.KO_Freeze(40,2);
         }
         else
         {
            _level0.effect_mc.KO_Freeze(40,1);
         }
      }
      else if(this.hurtValue.freezeTime > 0)
      {
         _level0.effect_mc.hitFreeze(this.hurtValue.freezeTime,this,this.hurtValue.slowTime);
      }
      _level0.hurter = this;
      if(!this.inCount)
      {
         this.delaySkill = "";
      }
   }
   function checkHurt()
   {
      this.nobody = false;
      if(this.countCheck())
      {
         if(!this.noLifeDec)
         {
            this.lifeObj.d_rate = 0.3;
            this.lifeControl(this.lifeObj);
         }
         if(!this.isKO)
         {
            return undefined;
         }
      }
      var _loc5_;
      var _loc4_;
      var _loc2_;
      var _loc3_;
      if(!(this.hurtValue.hitPos == "down" && this.status_1 == "hold_u"))
      {
         if(!(this.hurtValue.hitPos == "up" && this.status_1 == "hold_d"))
         {
            if(this.hurtValue.hitPos != "all")
            {
               if(this.status_1 == "hold_u" || this.status_1 == "hold_d")
               {
                  if(this.hurtValue.breakDefend == true)
                  {
                     this.hurtValue.freezeTime = this.hurtValue.breakFreezeTime;
                     this.hurtValue.freezeTime2 = this.hurtValue.breakFreezeTime2;
                  }
                  _loc5_ = this.hurtValue.freezeTime + this.hurtValue.freezeTime2;
                  if(_loc5_ == undefined)
                  {
                     _loc5_ = 6;
                  }
                  else if(_loc5_ < 5)
                  {
                     _loc5_ = 4;
                  }
                  else if(_loc5_ < 7)
                  {
                     _loc5_ = 6;
                  }
                  else if(_loc5_ > 6)
                  {
                     _loc5_ = 8;
                  }
                  if(this.hurtValue.breakDefend == true)
                  {
                     if(this == _level0.P1_role)
                     {
                        _level0.showMsg("breakDefend",_level0.stage_with - 150,220);
                     }
                     else
                     {
                        _level0.showMsg("breakDefend",50,220);
                     }
                     this.breakDefend();
                     if(this.hurtValue.breakVx > 0)
                     {
                        this.hurtValue.Vx = this.hurtValue.breakVx;
                     }
                     else
                     {
                        this.hurtValue.Vx = 0;
                     }
                  }
                  else
                  {
                     this.status_4 = "hold";
                     this.mc.toDefend();
                  }
                  this.noCatch = true;
                  _loc4_ = false;
                  this.do_holdFreeze(_loc5_);
                  this.holdBack();
                  if(this.burst_defend)
                  {
                     return undefined;
                  }
                  _loc2_ = 0;
                  while(_loc2_ < this.opp.normalList2.length)
                  {
                     if(this.hurtValue.status_1 == this.opp.normalList2[_loc2_])
                     {
                        _loc4_ = true;
                        this.lifeObj.d_rate = 0;
                        return undefined;
                     }
                     _loc2_ = _loc2_ + 1;
                  }
                  _loc3_ = 0;
                  while(_loc3_ < this.opp.normalList.length)
                  {
                     if(this.hurtValue.status_1 == this.opp.normalList[_loc3_])
                     {
                        _loc4_ = true;
                        this.lifeObj.d_rate = 0;
                        return undefined;
                     }
                     _loc3_ = _loc3_ + 1;
                  }
                  if(_loc4_ == true)
                  {
                     return undefined;
                  }
                  if(this.noLifeDec)
                  {
                     return undefined;
                  }
                  if(this.opp.d_rate22 == 0.1 || this.opp.d_rate22 == "" || this.opp.d_rate22 == undefined)
                  {
                     this.lifeObj.d_rate = this.hurtValue.d_rate * 0.1;
                  }
                  else
                  {
                     this.lifeObj.d_rate = this.hurtValue.d_rate * this.opp.d_rate22;
                  }
                  if(_loc4_ == false)
                  {
                     this.lifeControl(this.lifeObj);
                  }
                  if(!this.ashPower)
                  {
                     this.powerObj.inc = 3 * this.hurtValue.d_rate;
                     this.powerObj.action = "inc";
                     this.powerControl(this.powerObj);
                  }
                  if(this.isKO && (this.hurtValue.hurtBack == "hurt1" || this.hurtValue.hurtBack == "hurt2"))
                  {
                     this.hurtValue.hurtBack = "hurt2";
                     this.hurtValue.end_status = "getup2";
                     this.hurtValue.Vx = 20;
                     this.toStatus("kneeldown");
                     this.hurtBack();
                  }
                  return undefined;
               }
            }
         }
      }
      if(this.opp.burst_mode == "power" && this.opp.inBurst)
      {
         this.lifeObj.d_rate = this.hurtValue.d_rate * 1.15;
      }
      else if(this.opp.burst_mode == "defend" && this.opp.inBurst)
      {
         this.lifeObj.d_rate = this.hurtValue.d_rate * 1;
      }
      else
      {
         this.lifeObj.d_rate = this.hurtValue.d_rate;
      }
      if(this.armor_mode)
      {
         this.lifeObj.d_rate *= 0.7;
      }
      if(_level0.pvp_BossNamelist.join().indexOf(this.opp._roleName) > -1 && _level0.player_type == "1PVS2P")
      {
         if(this.opp._roleName == "Orochi" || this.opp._roleName == "Mizuchi" || this.opp._roleName == "Igniz")
         {
            this.lifeObj.d_rate *= 0.8;
         }
         else if(this.opp._roleName == "Rugal" || this.opp._roleName == "Goenitz")
         {
            this.lifeObj.d_rate *= 0.8;
         }
         else if(this.opp._roleName == "Krizalid" || this.opp._roleName == "CKrizalid")
         {
            this.lifeObj.d_rate *= 0.8;
         }
         else if(this.opp._roleName == "Iori" && this.opp._roleMode == 3)
         {
            this.lifeObj.d_rate *= 0.9;
         }
         else if(this.opp._roleName == "Ash" && this.opp._roleMode == 2)
         {
            this.lifeObj.d_rate *= 0.8;
         }
         else if(this.opp._roleName == "Zero" || this.opp._roleName == "CZero")
         {
            this.lifeObj.d_rate *= 0.9;
         }
      }
      if(this.bdCombo == true)
      {
         this.lifeObj.d_rate *= 0.6;
      }
      if(this.opp.bloodPower == true || this.opp.ashPower == true || this.opp.kyoPower == true)
      {
         this.lifeObj.d_rate *= 0.5;
      }
      if(this.status_3 == "attack" && _level0.getCounter())
      {
         if(this.normalList.join().indexOf(this.status_1) == -1)
         {
            if(this == _level0.P1_role)
            {
               _level0.showMsg("counter",_level0.stage_with - 150,220);
            }
            else
            {
               _level0.showMsg("counter",50,220);
            }
            this.lifeObj.d_rate *= 1.2;
         }
      }
      this.lifeControl(this.lifeObj);
      if(!this.ashPower)
      {
         this.powerObj.inc = 6 * this.hurtValue.d_rate;
         this.powerObj.action = "inc";
         this.powerControl(this.powerObj);
      }
      this.opp.powerObj.inc = 4 * this.hurtValue.d_rate;
      this.opp.powerObj.action = "inc";
      this.opp.powerControl(this.opp.powerObj);
      var _loc9_ = this.opp.superCheck2(this.opp.status_1) == "notSuperSkill" && this.opp.burstCheck2(this.opp.status_1) == "notBurstSkill" && this.opp.skillSuperCheckNew(this.opp.status_1) == false;
      var _loc7_;
      var _loc6_;
      var _loc8_;
      if(this.armor_mode != true || this.status_3 == "hurt" || this.status_3 == "down" || !_loc9_ || this.isKO)
      {
         this.status_4 = "normal";
         if(!(this.hurtValue.hurtBack == "none" && this.hurtValue.hurtAway == "none"))
         {
            this.status_3 = "hurt";
         }
         this.hurtStatus();
         this.mc.hitSkillName = this.opp.status_1;
         if(this.checkTouch_stop)
         {
            this.checkTouch_stop = false;
            this.bodyTouch();
         }
         if(Math.random() < 0.1)
         {
            _loc7_ = this.hurtSoundArray.length;
            _loc6_ = int(Math.random() * _loc7_);
            _loc8_ = this.hurtSoundArray[_loc6_];
            _loc8_.start();
         }
      }
   }
   function hurtStatus()
   {
      if(this.hurtValue.hurtBack == "none" && this.hurtValue.hurtAway == "none")
      {
         return undefined;
      }
      delete this.onEnterFrame;
      this.status_6 = "normal";
      this.holdFreeze = false;
      if(this.status_2 == "toLand")
      {
         this.status_2 = "land";
      }
      if(this.status_2 == "air" && this._y == this.land_Y && (this.status_1 == "jump" || this.status_1 == "jump_f" || this.status_1 == "jump_b" || this.status_1 == "dash_b"))
      {
         this.status_2 = "land";
      }
      if(this.status_1 == "dash_ex" || this.status_3 == "down")
      {
         this.hurtValue.hurtBack = "";
      }
      this.noCatch = false;
      var _loc3_;
      var _loc2_;
      var _loc4_;
      if(this.hurtValue.hurtBack != "")
      {
         if(this.isKO)
         {
            this.hurtValue.hurtAway = "hurt3";
            this.hurtValue.end_status = "getup2";
            this.hurtValue.Vx = 16;
            this.hurtValue.Vy = 30;
            this.toStatus(this.hurtValue.hurtAway);
            this.mc.gotoAndPlay(1);
            this.hurtAway();
         }
         else if(this.status_2 == "air" || this.status_3 == "down")
         {
            this.toStatus(this.hurtValue.hurtAway);
            this.mc.gotoAndPlay(this.hurtValue.flag);
            if(this.hurtValue.hurtAway == "hurt1" || this.hurtValue.hurtAway == "hurt2")
            {
               if(this.hurtValue.hurtToLand_oppSync)
               {
                  this._y = this.opp._y;
               }
               else
               {
                  this._y = this.land_Y;
               }
               this.status_2 = "land";
            }
            else
            {
               if(this.hurtValue.flagair == undefined || this.hurtValue.flagair == 0)
               {
                  this.mc.gotoAndPlay(this.hurtValue.flag);
               }
               else
               {
                  this.mc.gotoAndPlay(this.hurtValue.flagair);
               }
               if(this.hurtValue.Vy == 0 || this.hurtValue.Vy == undefined)
               {
                  this.hurtValue.Vy = 30;
               }
               this.hurtAway();
            }
         }
         else
         {
            if(this.hurtValue.hurtBack == "hurt1" || this.hurtValue.hurtBack == "hurt2")
            {
               _loc3_ = false;
               _loc2_ = 0;
               while(_loc2_ <= this.squatAct.length)
               {
                  if(this.status_1 == this.squatAct[_loc2_])
                  {
                     _loc3_ = true;
                  }
                  _loc2_ = _loc2_ + 1;
               }
               if((_loc3_ == true || this.opp_hight2 == this.opp_hight - 40) && this.hurtValue.isStand != true && this.status_5 != "hitDown")
               {
                  this.toStatus("s" + this.hurtValue.hurtBack);
                  this.mc.gotoAndPlay(this.hurtValue.flag);
               }
               else
               {
                  _loc4_ = false;
                  if(this.hurtValue.isSquat == true)
                  {
                     _loc2_ = 0;
                     while(_loc2_ <= this.squatAct.length)
                     {
                        if(this.hurtPrev == this.squatAct[_loc2_])
                        {
                           _loc4_ = true;
                        }
                        _loc2_ = _loc2_ + 1;
                     }
                  }
                  if(_loc4_ == true && this.hurtValue.isStand != true)
                  {
                     this.toStatus("s" + this.hurtValue.hurtBack);
                     this.mc.gotoAndPlay("s" + this.hurtValue.flag);
                  }
                  else
                  {
                     this.toStatus(this.hurtValue.hurtBack);
                     this.mc.gotoAndPlay(this.hurtValue.flag);
                  }
               }
            }
            else
            {
               this.toStatus(this.hurtValue.hurtBack);
               this.mc.gotoAndPlay(this.hurtValue.flag);
            }
            if(this.hurtValue.hurtAway == "hurt1" || this.hurtValue.hurtAway == "hurt2")
            {
               if(this.hurtValue.freezeTimeair == undefined || this.hurtValue.freezeTimeair == 0)
               {
                  this.hurtBack();
               }
               else
               {
                  this.hurtAway();
               }
            }
            else
            {
               this.hurtBack();
            }
         }
      }
      else if(this.hurtValue.hurtBack == "" && this.hurtValue.hurtAway != "")
      {
         if(this.isKO && this.hurtValue.hurtAway == "hurt6")
         {
            this.hurtValue.hurtAway = "hurt3";
         }
         this.toStatus(this.hurtValue.hurtAway);
         if(this.hurtValue.flagair == undefined || this.hurtValue.flagair == 0)
         {
            this.mc.gotoAndPlay(this.hurtValue.flag);
         }
         else
         {
            this.mc.gotoAndPlay(this.hurtValue.flagair);
         }
         this.hurtAway();
      }
      else
      {
         this.toStatus(this.hurtValue.hurtBack);
         this.mc.gotoAndPlay(this.hurtValue.flag);
         this.hurtBack();
      }
      if(this.hurtValue.end_dizzy)
      {
         if(this.dizzied)
         {
            this.dizzied = false;
            this.getUpDizzy = false;
         }
         else
         {
            this.getUpDizzy = this.hurtValue.end_dizzy;
            this.dizzied = true;
         }
      }
      else
      {
         this.getUpDizzy = false;
      }
      if(this.glowFromMc)
      {
         this.filters = [];
         this.glowFromMc = false;
      }
   }
   function hitFire()
   {
      var _loc2_ = this.hitValue.hitType;
      var hitFire_x = this.opp._x;
      var hitFire_y = Func.lToG(this.hitValue.area).y;
      var _loc3_;
      var _loc4_;
      var _loc5_;
      if(this.opp.status_1 == "hold_u" || this.opp.status_1 == "hold_d" || this.opp.status_1 == "breakDefend")
      {
         if(this.opp.status_1 == "breakDefend")
         {
            _loc2_ = "BreakDefend";
            _loc3_ = 0;
            while(_loc3_ < this.normalList2.length)
            {
               if(this.hitValue.status_1 == this.normalList2[_loc3_])
               {
                  _loc2_ = "BreakDefend_l";
               }
               _loc3_ = _loc3_ + 1;
            }
            _loc4_ = 0;
            while(_loc4_ < this.normalList.length)
            {
               if(this.hitValue.status_1 == this.normalList[_loc4_])
               {
                  _loc2_ = "BreakDefend_l";
               }
               _loc4_ = _loc4_ + 1;
            }
         }
         else
         {
            _loc2_ = "hitFire2";
            _loc3_ = 0;
            while(_loc3_ < this.normalList2.length)
            {
               if(this.hitValue.status_1 == this.normalList2[_loc3_])
               {
                  _loc2_ = "hitFire2_l";
               }
               _loc3_ = _loc3_ + 1;
            }
            _loc4_ = 0;
            while(_loc4_ < this.normalList.length)
            {
               if(this.hitValue.status_1 == this.normalList[_loc4_])
               {
                  _loc2_ = "hitFire2_l";
               }
               _loc4_ = _loc4_ + 1;
            }
         }
         if(this.hitValue.hitTypeDefned != undefined && this.hitValue.hitTypeDefned != "")
         {
            _loc2_ = this.hitValue.hitTypeDefned;
         }
         if(this.hitValue.hitTypeBreak != undefined && this.hitValue.hitTypeBreak != "")
         {
            _loc2_ = this.hitValue.hitTypeBreak;
         }
      }
      else if(this.opp.inCount)
      {
         _loc2_ = "hitFire2count";
         if(this == _level0.P1_role)
         {
            _level0.showMsg("count",_level0.stage_with - 130,260);
         }
         else
         {
            _level0.showMsg("count",30,260);
         }
      }
      else
      {
         var hitEff = this.hitValue.hitEff;
         var owner = this;
         _loc5_ = function()
         {
            clearInterval(dd);
            owner.addEffect(hitEff,hitFire_x,hitFire_y);
         };
         if(this.hitValue.hitEff != "")
         {
            var dd = setInterval(_loc5_,40);
         }
         if(this.hitValue.calHits == undefined || this.hitValue.calHits == null)
         {
            this.hitValue.calHits = true;
         }
         if(this.hitValue.calHits)
         {
            this.hitsObj.x = hitFire_x;
            _level0.showHits(this.hitsObj);
            this.hits = this.hits + 1;
         }
         if(_level0.getFlashing())
         {
            if(this.hitValue.hitShinning)
            {
               _level0.effect_mc.bgShineHit(2);
            }
            else if(this.superSkill || this.isBurstSkill)
            {
               _level0.effect_mc.bgShineHit(1);
            }
         }
      }
      _level0.effect_mc.hitFire(_loc2_,hitFire_x,hitFire_y,this.dir);
      if(this.hitValue.hitSwitch && this.hitValue.flagHurt != "" && (this.opp.status_3 == "hurt" || this.opp.status_3 == "down") && !this.opp.inCount)
      {
         this.mc.gotoAndPlay(this.hitValue.flagHurt);
      }
      else if(this.hitValue.hitSwitch && this.hitValue.flagHit != "" && !(this.opp.status_3 == "hurt" || this.opp.status_3 == "down"))
      {
         this.mc.gotoAndPlay(this.hitValue.flagHit);
      }
   }
   function countStart(times, pos, lifeDecFalse, canCountObj)
   {
      if(lifeDecFalse == undefined || lifeDecFalse == false)
      {
         this.noLifeDec = false;
      }
      else if(lifeDecFalse == true)
      {
         this.noLifeDec = true;
      }
      if(canCountObj == undefined || canCountObj == true)
      {
         this.countObj = true;
      }
      else
      {
         this.countObj = false;
      }
      this.skillCount = true;
      this.countTimes = times;
      this.countPos = pos;
      if(this.countTimes == undefined)
      {
         this.countTimes = 1;
      }
   }
   function countEnd()
   {
      this.skillCount = false;
      this.noLifeDec = false;
   }
   function countCheck()
   {
      if(this.hurtValue.isObj && this.countObj == false)
      {
         this.countEnd();
         return false;
      }
      var _loc2_;
      if(this.skillCount)
      {
         if(this.countPos == "down" && this.hurtValue.hitPos == "up")
         {
            this.countEnd();
         }
         else if(this.countPos == "up" && this.hurtValue.hitPos == "down")
         {
            this.countEnd();
         }
         else if(this.countTimes > 0)
         {
            this.hurtValue.freezeTime += 6;
            this.inCount = true;
            this.countTimes = this.countTimes - 1;
            return true;
         }
      }
      else if(this.burst_defend && this.normalList.join().indexOf(this.status_1) == -1 && this.normalList2.join().indexOf(this.status_1) == -1)
      {
         if(this.inCount)
         {
            this.countEnd();
         }
         else if(this.hit_over() != true)
         {
            this.hurtValue.freezeTime += 7;
            _loc2_ = this.opp.superCheck2(this.opp.status_1) == "notSuperSkill" && this.opp.burstCheck2(this.opp.status_1) == "notBurstSkill" && this.opp.skillSuperCheckNew(this.opp.status_1) == false;
            if(!_loc2_)
            {
               this.inCount = false;
               this.countEnd();
               return false;
            }
            this.inCount = true;
            this.powerObj.action = "burstdec";
            this.powerObj.decNum = 40;
            this.powerControl(this.powerObj);
            this.changeColorSelf("white",30);
            return true;
         }
      }
      this.countTimes = 0;
      this.inCount = false;
   }
   function powerBurst()
   {
      this.inBurst = true;
      this.powerObj.action = "burst";
      this.powerControl(this.powerObj);
   }
   function burstEff()
   {
      if(this.burst_mode != "attack")
      {
         if(this.burst_mode == "defend")
         {
            this.burst_defend = true;
         }
      }
   }
   function superCancle()
   {
      if(this.inBurst && this.burst_mode == "attack")
      {
         return true;
      }
   }
   function burst_end()
   {
      this.inBurst = false;
      this.inCount = false;
      this.burst_defend = false;
      this.burst_mode = "";
   }
   function holdCount()
   {
      if(this.heavyHit() == false)
      {
         return false;
      }
      if(this.inBurst)
      {
         this.powerObj.action = "burstdec";
         if(this.burst_mode == "defend")
         {
            this.powerObj.decNum = _level0.power_holdCounter;
         }
         else
         {
            this.powerObj.decNum = 80;
         }
      }
      else
      {
         if(this == _level0.P1_role && _level0.LP_P1.powerPoint_num == 0 || this == _level0.P2_role && _level0.LP_P2.powerPoint_num == 0)
         {
            return false;
         }
         this.powerObj.action = "dec";
      }
      this.noCatch = false;
      this.powerControl(this.powerObj);
      this.changeColorSelf("white",30);
      this.noCatchT2 = 12;
      clearInterval(this.noCatchT);
      this.noCatchT = setInterval(this,"noCatchTimer",10);
      this.holdFreeze = false;
      this.nosh = true;
      this.stop_hurtBack();
      this.powerCD();
      if(this == _level0.P2_role)
      {
         _level0.showMsg("defendCancel",_level0.stage_with - 180,220);
      }
      else
      {
         _level0.showMsg("defendCancel",80,220);
      }
   }
   function powerCD()
   {
      this.status_1 = "powercd";
      this.mc.gotoAndPlay("powercd");
   }
   function hit_over()
   {
      if(this.status_3 != "attack" || this.status_6 != "normal")
      {
         return true;
      }
      _level0.out("hit_over   over_f:" + over_f + "   mc._currentframe:" + this.mc._currentframe + "   mc._totalframes:" + this.mc._totalframes);
      if(this.mc.area)
      {
         return false;
      }
      var over_f = this.comboClass.skill_over[this.status_1];
      if(over_f >= this.mc._totalframes - 6)
      {
         over_f = "error";
      }
      if(this.mc._currentframe > over_f && !isNaN(over_f))
      {
         return true;
      }
      if(this.mc._currentframe > this.mc._totalframes - 6 && isNaN(over_f))
      {
         return true;
      }
      return false;
   }
   function freeze_frame()
   {
      if(this.status_3 != "attack")
      {
         return 0;
      }
      var _loc3_ = this.mc._currentframe;
      var _loc2_ = this.mc._totalframes;
      var _loc4_ = _loc2_ - _loc3_;
      return _loc4_;
   }
   function superStart(superType, time_f, dx, dy, faceName, dir)
   {
      _level0.effect_mc.superStart(superType,time_f,dx,dy,faceName,dir);
   }
   function superCheck(action)
   {
      this.superSkill = false;
      if(this.superList[action] == 1)
      {
         if(this.superPoint > 0)
         {
            this.superSkill = true;
            this.powerDecType = "super";
            return true;
         }
         if(this.inBurst)
         {
            this.superSkill = true;
            this.powerDecType = "super";
            return true;
         }
         return false;
      }
      return "notSuperSkill";
   }
   function superCheck2(action)
   {
      if(this.superList[action] == 1)
      {
         if(this.superPoint > 0)
         {
            return true;
         }
         if(this.inBurst)
         {
            return true;
         }
         return false;
      }
      return "notSuperSkill";
   }
   function burstCheck(action)
   {
      this.isBurstSkill = false;
      if(this.burstList[action] == 1)
      {
         if(this.inBurst)
         {
            this.isBurstSkill = true;
            this.powerDecType = "burst";
            return true;
         }
         return false;
      }
      return "notBurstSkill";
   }
   function burstCheck2(action)
   {
      if(this.burstList[action] == 1)
      {
         if(this.inBurst)
         {
            return true;
         }
         return false;
      }
      return "notBurstSkill";
   }
   function skillSuperCheck(action)
   {
      var _loc2_ = this.skillSuperMapping[action];
      if(_loc2_ != undefined)
      {
         return _loc2_;
      }
      return "";
   }
   function skillSuperCheckNew(action)
   {
      var _loc2_ = this.superMaxList[action];
      if(_loc2_ == 1)
      {
         return true;
      }
      return false;
   }
   function powerDec(times)
   {
      if(times == undefined)
      {
         times = 1;
      }
      var _loc2_ = this.powerDecType;
      if(this.inBurst && _loc2_ == "burst")
      {
         this.powerObj.action = "burstdec";
         this.powerObj.decNum = this.power_skillBurst * times;
         this.powerControl(this.powerObj);
      }
      else if(this.inBurst && _loc2_ == "super")
      {
         this.powerObj.action = "burstdec";
         this.powerObj.decNum = this.power_skillSuper * times;
         this.powerControl(this.powerObj);
      }
      else if(!this.inBurst && _loc2_ == "super")
      {
         this.powerObj.action = "dec";
         this.powerControl(this.powerObj);
      }
      this.powerDecType = "";
   }
   function powerDec2()
   {
      var _loc3_ = this.powerDecType2;
      var _loc2_;
      if(this.inBurst && _loc3_ == "cancle")
      {
         this.powerObj.action = "burstdec";
         this.powerObj.decNum = this.power_cancle;
         this.powerControl(this.powerObj);
         _loc2_ = 0;
         while(_loc2_ < this.skillName.length)
         {
            this.skillNum[_loc2_] -= 1;
            if(this.skillNum[_loc2_] < 0)
            {
               this.skillNum[_loc2_] = 0;
            }
            _loc2_ = _loc2_ + 1;
         }
         this.checkSide_abs();
         this.nobody = false;
         this.opp_hight2 = this.opp_hight;
         this.status_4 = "normal";
         this.opp.checkTouch_stop = false;
         this.checkTouch_stop = false;
         this.opp.mc.catched = false;
         this.changeColorSelf("white",30);
         this.countEnd();
         _level0.zoomControl_mc.zoomBack(0.5);
         _level0.stageControl_mc.startControl();
         this.nosh = false;
         if(this._y == 445)
         {
            this.checkSide_abs();
         }
         if(this.opp._y != 445 && this.opp.status_2 == "land" && (this.opp.status_1 == "hurt1" || this.opp.status_1 == "hurt2"))
         {
            this.opp.toStatus("hurt3");
            this.opp.hurtAway();
         }
         if(this.opp.status_3 == "hurt")
         {
            if(this.superSkill)
            {
               _level0.showMsg("s_cancel",0);
            }
            else if(this.isBurstSkill)
            {
               _level0.showMsg("m_cancel",0);
            }
            else if(this == _level0.P1_role)
            {
               _level0.LP_P1.burst_mc.dc.play();
            }
            else
            {
               _level0.LP_P2.burst_mc.dc.play();
            }
         }
         this.powerDecType2 = "";
      }
   }
   function orochiTaoxin(obj, status_c, flag, condition_land, condition_hurt, downHit, rollhit, holdhit, superMoveEffect, visibility, changeDir, id, hitID, hitflag, nohit_status, Vx, f)
   {
      var num = f;
      var nohit = true;
      this.onEnterFrame = function()
      {
         if(_level0.inPause || _level0.inFreeze)
         {
            return undefined;
         }
         num--;
         if(num < 0)
         {
            delete this.onEnterFrame;
            return undefined;
         }
         if(this.status_3 == "hurt" || this.status_3 == "down")
         {
            return undefined;
         }
         this.do_move(this.dir * Vx);
         if(this.opp.nosh == true || !this.opp.mc.body && this.opp.status_3 != "roll")
         {
            return undefined;
         }
         if(condition_land)
         {
            if(this.opp.status_2 == "air")
            {
               return undefined;
            }
         }
         if(condition_hurt)
         {
            if(!(this.opp.status_3 == "hurt" || this.opp.status_3 == ""))
            {
               if(!(this.opp.status_3 == "down" && this.onHit))
               {
                  return undefined;
               }
            }
         }
         if(downHit == true)
         {
            if(this.opp.status_3 == "down")
            {
               nohit = false;
            }
         }
         else if(!this.opp.mc.body)
         {
            return undefined;
         }
         if(!rollhit && this.opp.status_3 == "roll")
         {
            return undefined;
         }
         if(!holdhit && this.opp.noCatch == true && this.opp.status_3 != "hurt")
         {
            return undefined;
         }
         var _loc2_;
         if(nohit_status.length > 0)
         {
            for(var _loc4_ in nohit_status)
            {
               _loc2_ = nohit_status[_loc4_];
               if(this.opp.status_1 == _loc2_)
               {
                  return undefined;
               }
               if(this.opp.status_2 == _loc2_)
               {
                  return undefined;
               }
            }
         }
         if(!(Math.abs(this.opp._x - this._x) <= obj._width && obj.hitTest(this.opp.mc)))
         {
            return undefined;
         }
         nohit = false;
         var _loc3_;
         var _loc5_;
         if(nohit == false)
         {
            delete this.onEnterFrame;
            delete this.opp.onEnterFrame;
            this.opp.toStatus(status_c);
            this.opp.gotoAndStop(status_c);
            this.opp.mc.gotoAndStop(flag);
            this.opp.status_2 = "land";
            this.opp.status_3 = "hurt";
            this.onHit = true;
            this.opp.countEnd();
            this.ida = id;
            this.nosh = true;
            this.opp.status_7 = this.ida;
            hitID = this.ida;
            hitID = id;
            _loc3_ = this._x + obj._x * this.dir;
            _loc5_ = this._y + obj._y;
            if(_level0.char_mc._x + _loc3_ > this.egde_max)
            {
               _loc3_ = this.egde_max - _level0.char_mc._x;
            }
            else if(_level0.char_mc._x + _loc3_ < this.egde_min)
            {
               _loc3_ = this.egde_min - _level0.char_mc._x;
            }
            this.opp._x = _loc3_;
            if(changeDir && this.dir == this.opp.dir)
            {
               if(this.dir == 1)
               {
                  this.opp.chageSide2();
               }
               else
               {
                  this.opp.chageSide1();
               }
            }
            if(visibility == undefined)
            {
               visibility = true;
            }
            if(visibility)
            {
               if(superMoveEffect)
               {
                  _level0.effect_mc.hitFire("hitFire3_super",_loc3_,_loc5_);
               }
               else
               {
                  _level0.effect_mc.hitFire("hitFire3",_loc3_,_loc5_);
               }
            }
            this.topLayer();
            this.opp.mc.stop();
            this.mc.gotoAndPlay(hitflag);
            nohit = false;
         }
      };
   }
   function addNonAtkEffect(e_name, src, e_x, e_y, isBlack, isGrey)
   {
      var _loc4_ = this.effect_loader.getNextHighestDepth();
      var _loc2_ = this.effect_loader.attachMovie(e_name,"effect" + _loc4_,_loc4_);
      var _loc3_ = Func.lToG(src);
      if(_loc3_.x > this.stage_with)
      {
         _loc3_.x = this.stage_with;
      }
      else if(_loc3_.x < 0)
      {
         _loc3_.x = 0;
      }
      this.effect_loader.globalToLocal(_loc3_);
      _loc2_._x = _loc3_.x;
      _loc2_._y = _loc3_.y;
      _loc2_.dir = this.dir;
      _loc2_._xscale = this.dir * this.scale;
      _loc2_.init();
      var _loc6_;
      var _loc7_;
      var _loc5_;
      if(isBlack)
      {
         _loc6_ = new Array(0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0,0,1,0);
         _loc7_ = new flash.filters.ColorMatrixFilter(_loc6_);
         _loc5_ = new Array();
         _loc5_.push(_loc7_);
         _loc2_.filters = _loc5_;
      }
      if(isGrey)
      {
         _loc6_ = new Array(0.3,0.6,0.08,0,0,0.3,0.6,0.08,0,0,0.3,0.6,0.08,0,0,0,0,0,1,0);
         _loc7_ = new flash.filters.ColorMatrixFilter(_loc6_);
         _loc5_ = new Array();
         _loc5_.push(_loc7_);
         _loc2_.filters = _loc5_;
         _loc2_.blendMode = "subtract";
      }
   }
   function addSkill(s_name, src, Vx, Va, isBlack, isGrey, isBack)
   {
      if(this.skill_mc && this.skill_mc.objName == s_name && this.skill_mc.allowNum == 1)
      {
         return undefined;
      }
      var _loc3_ = this.skill_loader.getNextHighestDepth();
      this.skill_mc = this.skill_loader.attachMovie(s_name,"skill" + _loc3_,_loc3_);
      this.skill_mc.objName = s_name;
      var _loc2_ = Func.lToG(src);
      this.skill_mc.isBack = isBack;
      if(_loc2_.x > this.stage_with)
      {
         _loc2_.x = this.stage_with;
      }
      else if(_loc2_.x < 0)
      {
         _loc2_.x = 0;
      }
      this.skill_loader.globalToLocal(_loc2_);
      this.skill_mc._x = _loc2_.x;
      this.skill_mc._y = _loc2_.y;
      this.skill_mc.dir = this.dir;
      this.skill_mc._xscale = this.dir * this.scale;
      this.skill_mc.role = this;
      this.skill_mc.opp = this.opp;
      this.skill_mc.action = this.status_1;
      this.skill_mc.init();
      this.skill_mc.dirs = this.dir;
      var _loc5_;
      var _loc6_;
      var _loc4_;
      if(isBlack)
      {
         _loc5_ = new Array(0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0,0,1,0);
         _loc6_ = new flash.filters.ColorMatrixFilter(_loc5_);
         _loc4_ = new Array();
         _loc4_.push(_loc6_);
         this.skill_mc.filters = _loc4_;
         this.skill_mc.isBlack = true;
      }
      if(isGrey)
      {
         _loc5_ = new Array(0.3,0.6,0.08,0,0,0.3,0.6,0.08,0,0,0.3,0.6,0.08,0,0,0,0,0,1,0);
         _loc6_ = new flash.filters.ColorMatrixFilter(_loc5_);
         _loc4_ = new Array();
         _loc4_.push(_loc6_);
         this.skill_mc.filters = _loc4_;
         this.skill_mc.blendMode = "subtract";
         this.skill_mc.isGrey = true;
      }
   }
   function addSkill_opp(e_name, src, e_x, e_y, isBlack, isGrey)
   {
      var _loc4_ = this.effect_loader.getNextHighestDepth();
      var _loc2_ = this.effect_loader.attachMovie(e_name,"skill" + _loc4_,_loc4_);
      var _loc3_ = Func.lToG(src);
      if(_loc3_.x > this.stage_with)
      {
         _loc3_.x = this.stage_with;
      }
      else if(_loc3_.x < 0)
      {
         _loc3_.x = 0;
      }
      this.effect_loader.globalToLocal(_loc3_);
      _loc2_._x = _loc3_.x;
      _loc2_._y = _loc3_.y;
      _loc2_.dir = this.opp.dir;
      _loc2_._xscale = this.opp.dir * this.scale;
      _loc2_.init();
      var _loc6_;
      var _loc7_;
      var _loc5_;
      if(isBlack)
      {
         _loc6_ = new Array(0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0,0,1,0);
         _loc7_ = new flash.filters.ColorMatrixFilter(_loc6_);
         _loc5_ = new Array();
         _loc5_.push(_loc7_);
         _loc2_.filters = _loc5_;
      }
      if(isGrey)
      {
         _loc6_ = new Array(0.3,0.6,0.08,0,0,0.3,0.6,0.08,0,0,0.3,0.6,0.08,0,0,0,0,0,1,0);
         _loc7_ = new flash.filters.ColorMatrixFilter(_loc6_);
         _loc5_ = new Array();
         _loc5_.push(_loc7_);
         _loc2_.filters = _loc5_;
         _loc2_.blendMode = "subtract";
      }
   }
   function addSkill_kulaStand(s_name, src, Vx, Va, isBlack, isGrey)
   {
      if(this.skill_mc && this.skill_mc.objName == s_name && this.skill_mc.allowNum == 1)
      {
         return undefined;
      }
      var _loc4_ = this.effect_loader.getNextHighestDepth();
      var _loc2_ = this.effect_loader.attachMovie(s_name,"effect" + _loc4_,_loc4_);
      var _loc3_ = Func.lToG(src);
      this.effect_loader.globalToLocal(_loc3_);
      _loc2_._x = _loc3_.x;
      _loc2_._y = _loc3_.y;
      _loc2_.dir = this.dir;
      _loc2_._xscale = this.dir * this.scale;
      _loc2_.init();
   }
   function addSkill2(s_name, src, Vx, Va)
   {
      var _loc4_ = this.skill_loader.getNextHighestDepth();
      var _loc3_ = this.skill_loader.attachMovie(s_name,"skill" + _loc4_,_loc4_);
      var _loc2_ = Func.lToG(src);
      if(_loc2_.x > this.stage_with)
      {
         _loc2_.x = this.stage_with;
      }
      else if(_loc2_.x < 0)
      {
         _loc2_.x = 0;
      }
      this.skill_loader.globalToLocal(_loc2_);
      _loc3_._x = _loc2_.x;
      _loc3_._y = _loc2_.y;
      _loc3_.dir = this.dir;
      _loc3_._xscale = this.dir * this.scale;
      _loc3_.opp = this.opp;
      _loc3_.init();
   }
   function addSkill_m(s_name, src, posx, posy)
   {
      var _loc4_ = this.skill_loader.getNextHighestDepth();
      var _loc2_ = this.skill_loader.attachMovie(s_name,"skill" + _loc4_,_loc4_);
      var _loc3_ = new Object();
      _loc3_.x = src._x;
      _loc3_.y = src._y;
      src._parent.localToGlobal(_loc3_);
      this.skill_loader.globalToLocal(_loc3_);
      _loc2_._x = posx;
      _loc2_._y = _loc3_.y;
      _loc2_.dir = this.dir;
      _loc2_._xscale = this.dir * this.scale;
      _loc2_.opp = this.opp;
      _loc2_.init();
      if(this.char_mc._x + _loc2_._x > this.stage_with)
      {
         _loc2_._x = this.stage_with - this.char_mc._x;
      }
      else if(this.char_mc._x + _loc2_._x < 0)
      {
         _loc2_._x = - this.char_mc._x;
      }
   }
   function addEffect(e_name, e_x, e_y)
   {
      var _loc3_ = this.effect_loader.getNextHighestDepth();
      var _loc2_ = this.effect_loader.attachMovie(e_name,"effect" + _loc3_,_loc3_);
      _loc2_._x = e_x;
      _loc2_._y = e_y;
      _loc2_.dir = this.dir;
      _loc2_._xscale = this.dir * this.scale;
   }
   function addShadow(shadow_name, src, start_alpha, end_alpha, d_alpha, _rb, _gb, _bb, followFrames)
   {
      if(followFrames == undefined || followFrames == null)
      {
         followFrames = false;
      }
      if(this.shadow_mc instanceof MovieClip != true)
      {
         this.shadow_mc = this._parent.createEmptyMovieClip("shadow_mc",this.depth_shadow);
      }
      trace("shadow_mc: " + this.shadow_mc);
      var _loc3_ = this.shadow_mc.getNextHighestDepth();
      var shadow = this.shadow_mc.attachMovie(shadow_name,"shadow_" + _loc3_,_loc3_);
      trace("shadow: " + shadow);
      shadow._x = src._x * this.dir + this._x;
      shadow._y = src._y + this._y;
      if(followFrames)
      {
         shadow.gotoAndPlay(this.mc._currentframe - 1);
      }
      shadow._alpha = start_alpha;
      shadow.end_alpha = end_alpha;
      shadow.d_alpha = d_alpha;
      shadow._xscale = this.dir * this.scale;
      shadow.colorObj = new Color(shadow);
      var _loc2_;
      var _loc4_;
      if(this.roleName == "Ash" && this.roleMode == 2)
      {
         if(_level0.ashShadow)
         {
            _loc2_ = {ra:"0",rb:"0",ga:"0",gb:_gb,ba:"0",bb:"0",aa:"100",ab:"0"};
            _loc4_ = new flash.filters.BlurFilter(25,25,1);
            shadow.filters = [_loc4_];
         }
         else
         {
            this.e_mode(shadow);
         }
      }
      else
      {
         shadow.colorObj = new Color(shadow);
         _loc2_ = {ra:"100",rb:_rb,ga:"100",gb:_gb,ba:"100",bb:_bb,aa:"100",ab:"0"};
      }
      shadow.colorObj.setTransform(_loc2_);
      this.e_mode(shadow);
      var onwer = this;
      this.e_mode(onwer);
      this.e_mode();
      shadow.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            shadow.stop();
            return undefined;
         }
         shadow.play();
         if(onwer.inFreeze)
         {
            if(followFrames)
            {
               this.stop();
            }
            if(this.roleName != "Ash" && this.roleMode != 2 && !_level0.ashShadow)
            {
               return undefined;
            }
         }
         else
         {
            shadow.play();
         }
         this._alpha -= this.d_alpha;
         if(this._alpha < this.end_alpha)
         {
            this.removeMovieClip();
         }
      };
   }
   function addShadow_obj(shadow_name, src, start_alpha, end_alpha, d_alpha, _rb, _gb, _bb, bMode)
   {
      if(this.shadow_mc instanceof MovieClip != true)
      {
         this.shadow_mc = this._parent.createEmptyMovieClip("shadow_mc",this.depth_shadow);
      }
      trace("shadow_mc: " + this.shadow_mc);
      var _loc3_ = this.shadow_mc.getNextHighestDepth();
      var _loc2_ = this.shadow_mc.attachMovie(shadow_name,"shadow_" + _loc3_,_loc3_);
      trace("shadow: " + _loc2_);
      _loc2_._x = src._x * this.dir + src._parent._x;
      _loc2_._y = src._y + _level0.land_Y;
      _loc2_.colorObj = new Color(_loc2_);
      var _loc5_ = {ra:"100",rb:_rb,ga:"100",gb:_gb,ba:"100",bb:_bb,aa:"100",ab:"0"};
      _loc2_.colorObj.setTransform(_loc5_);
      _loc2_._alpha = start_alpha;
      _loc2_.end_alpha = end_alpha;
      _loc2_.d_alpha = d_alpha;
      _loc2_._xscale = this.dir * this.scale;
      if(_level0.glowMode)
      {
         _loc2_.blendMode = bMode;
      }
      var onwer = this;
      _loc2_.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(onwer.inFreeze)
         {
            return undefined;
         }
         this._alpha -= this.d_alpha;
         if(this._alpha < this.end_alpha)
         {
            this.removeMovieClip();
         }
      };
   }
   function catchFire(e_name, e_x, e_y, dir)
   {
   }
   function start_move_Obj(Obj)
   {
      var _loc2_ = Obj;
      var owner = this;
      _loc2_.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(owner.inFreeze)
         {
            return undefined;
         }
         this._x += this.dir * this.Vx;
         this.Vx -= this.Va;
         if(this.Vx <= 0 || this._x > 700 || this._x < -50)
         {
            this.gotoAndPlay("end");
            delete this.onEnterFrame;
         }
      };
   }
   function skill_filter(action)
   {
      for(var _loc3_ in this.record_filter_array)
      {
         if(action == this.record_filter_array[_loc3_])
         {
            return true;
         }
      }
   }
   function check_countType(s)
   {
      for(var _loc3_ in this.record_skill_totalFrame)
      {
         if(String(s) == this.record_skill_totalFrame[_loc3_])
         {
            return true;
         }
      }
      for(_loc3_ in this.record_action_totalFrame)
      {
         if(String(s) == this.record_action_totalFrame[_loc3_])
         {
            return true;
         }
      }
      if(String(s).indexOf("jumpSkill_") != -1)
      {
         return true;
      }
   }
   function set_combo()
   {
      var _loc2_ = _level0.comboRecord_array[_level0.comboIndex];
      this.record_skill = _loc2_.data[0];
      this.record_frame = _loc2_.data[1];
      this.count_type = _loc2_.data[2];
   }
   function skill_record_ready()
   {
      this.inRecord = true;
      this.record_frame = [];
      this.record_skill = [];
      this.count_type = [];
   }
   function skill_record(skill)
   {
      if(this.record_skill.length == 0)
      {
         this.record_skill.push(skill);
         this.count_type.push("total");
         this.record_frame.push(1);
      }
      else
      {
         this.record_skill.push(skill);
         if(this.check_countType(this.status_1))
         {
            this.count_type.push("total");
            this.record_frame.push(this.frameCount_temp - this.frameOffset);
         }
         else
         {
            this.count_type.push("current");
            this.record_frame.push(this.mc._currentframe - 1);
         }
      }
      this.frameCount_temp = 1;
      var owner = this;
      this.replay_timer.onEnterFrame = function()
      {
         if(owner.inFreeze)
         {
            return undefined;
         }
         owner.frameCount_temp++;
      };
   }
   function skill_record_end(hits)
   {
      this.inRecord = false;
      delete this.replay_timer.onEnterFrame;
      if(this.record_skill.length == 0)
      {
         return undefined;
      }
      var _loc2_ = hits + " Combo";
      var _loc3_ = [this.record_skill,this.record_frame,this.count_type];
      _level0.combo_new({label:_loc2_,data:_loc3_});
   }
   function skill_replay_start()
   {
      trace("skill_replay_start: " + this.record_skill);
      this.inReplay = true;
      this.skillPonit = 0;
      this.toSkill(this.record_skill[this.skillPonit]);
      this.skillPonit = this.skillPonit + 1;
      this.skill_replay();
   }
   function skill_replay_end()
   {
      this.inReplay = false;
      delete this.replay_timer.onEnterFrame;
      this.powerObj.action = "burstdec";
      this.powerObj.decNum = 300;
      this.powerControl(this.powerObj);
   }
   function skill_replay()
   {
      var skill = this.record_skill[this.skillPonit];
      var frame = this.record_frame[this.skillPonit];
      var _loc2_ = this.count_type[this.skillPonit];
      var owner = this;
      if(this.skillPonit == this.record_skill.length)
      {
         this.skill_replay_end();
         return undefined;
      }
      _level0.out("下个动作：" + skill);
      _level0.out("开始帧数：" + frame);
      _level0.out("动作类型：" + _loc2_);
      _level0.out("当前动作：" + this.status_1);
      if(_loc2_ == "total")
      {
         this.frameCount_temp = 1;
         this.replay_timer.onEnterFrame = function()
         {
            if(owner.inFreeze)
            {
               return undefined;
            }
            if(owner.status_3 == "hurt")
            {
               owner.skill_replay_end();
            }
            owner.frameCount_temp++;
            if(owner.frameCount_temp > frame)
            {
               owner.toSkill(skill,true);
               owner.skillPonit++;
               owner.skill_replay();
            }
         };
         return undefined;
      }
      this.replay_timer.onEnterFrame = function()
      {
         if(owner.inFreeze)
         {
            return undefined;
         }
         if(owner.status_3 == "hurt")
         {
            owner.skill_replay_end();
         }
         if(owner.mc._currentframe > frame)
         {
            if(owner.status_1 == "jump" || owner.status_1 == "jump_b" || owner.status_1 == "jump_f")
            {
               owner.jumpSkill(skill);
            }
            else
            {
               owner.toSkill(skill,true);
            }
            owner.skillPonit++;
            owner.skill_replay();
         }
      };
      this.mc.onUnload = function()
      {
      };
   }
   function toGlobal(obj1, obj2)
   {
      var _loc1_ = new Object();
      _loc1_.x = obj1._x;
      _loc1_.y = obj1._y;
      obj2.localToGlobal(_loc1_);
      return _loc1_;
   }
   function getMc(src)
   {
      var _loc1_;
      for(var _loc3_ in src)
      {
         _loc1_ = src[_loc3_];
         trace("mc::: " + _loc1_);
         if(_loc1_ instanceof MovieClip)
         {
            trace("src:::::::::::" + src);
            trace("mc:::::::::::: " + _loc1_);
            return _loc1_;
         }
      }
   }
   function objStartMoveX1(v, obj)
   {
      var _loc2_ = v;
      this.objMove(_loc2_,obj);
   }
   function egdecheckObj(v, obj)
   {
      var _loc3_ = _level0.char_mc._x + obj._x;
      if(_loc3_ + v >= this.egde_max && v > 0)
      {
         obj._x = this.egde_max - _level0.char_mc._x;
         return true;
      }
      if(_loc3_ + v <= this.egde_min && v < 0)
      {
         obj._x = this.egde_min - _level0.char_mc._x;
         return true;
      }
   }
   function objStartMoveY1(y, x, end, g, obj)
   {
      var Vy = y;
      var Vx = x;
      var Vg2 = 0;
      if(g != 0 && g != null && g != undefined)
      {
         Vg2 = g;
      }
      obj.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(this.inFreeze)
         {
            return undefined;
         }
         this.objMove(Vx,obj);
         obj._y -= Vy;
         if(obj.Gravity == true)
         {
            Vy -= Vg2;
         }
         else
         {
            Vy -= Vg2;
            if(Vy <= 0)
            {
               Vy = 0;
            }
         }
         if(obj._y > this.land_Y)
         {
            this.objStopMoveY1(end,obj);
         }
      };
   }
   function objMove(Vx, obj)
   {
      if(this.egdecheckObj(Vx,obj))
      {
         return undefined;
      }
      obj._x += Vx * (obj._xscale / 100);
   }
   function objStopMoveY1(end, obj)
   {
      delete obj.onEnterFrame;
      obj._y = this.land_Y;
      obj.gotoAndPlay(end);
   }
   function objStartMoveX2(v, obj)
   {
      this.Vx = v;
      obj.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(this.inFreeze)
         {
            return undefined;
         }
         this.objMove(this.Vx,obj);
         this.Vx -= this.Va;
         if(this.Vx <= 0)
         {
            delete obj.onEnterFrame;
         }
      };
   }
   function clearLists()
   {
      if(this.hits == 0 || this.opp.status_3 == "attack" || this.opp.status_3 == "normal" || this.opp.status_3 == "roll")
      {
         this.skill_last = "";
         this.skill_last0 = "";
         this.skillName = [];
         this.skillNum = [];
      }
   }
   function skillToEqual(skill)
   {
      if(this.onHit == false)
      {
         if(this.opp.status_3 == "normal" || this.opp.status_3 == "attack")
         {
            return undefined;
         }
      }
      var _loc2_ = 0;
      while(_loc2_ < this.skillName.length)
      {
         if(skill == this.skillName[_loc2_])
         {
            this.skillNum[_loc2_] += 1;
            return undefined;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.skillName[this.skillName.length] = skill;
      this.skillNum[this.skillNum.length] = 1;
      if(this.skillName.length == 1)
      {
         this.skillToEqual(this.skill_last);
      }
   }
   function easySkillMapping()
   {
   }
   function soundInit()
   {
      this.sound_mc = _level0.createEmptyMovieClip("sound_mc",1100);
      this.run_snd = new Sound(this.sound_mc);
      this.run_snd.attachSound("run_snd");
      this.hurt1_snd = new Sound(this.sound_mc);
      this.hurt1_snd.attachSound("hurt1_snd_" + this.roleName);
      this.hurt2_snd = new Sound(this.sound_mc);
      this.hurt2_snd.attachSound("hurt2_snd_" + this.roleName);
      this.lose_snd = new Sound(this.sound_mc);
      this.lose_snd.attachSound("lose_snd_" + this.roleName);
      this.hurtSoundArray = new Array();
      this.hurtSoundArray = [this.hurt1_snd,this.hurt2_snd];
   }
   function stageInf(sw, emax, emin, x, y)
   {
      this.stage_with = sw;
      this.egde_max = emax;
      this.egde_min = emin;
      this.startX = x;
      this.startY = y;
      this.land_Y = y;
      this._x = x;
      this._y = y;
      this.checkSide_abs();
      this.soundInit();
   }
   function stageVar(l_max, s_Point, p_max, opponent, burst, lifenow)
   {
      if(this._roleName != this.roleName)
      {
      }
      this.life_max = l_max;
      if(lifenow != undefined)
      {
         this.life = lifenow;
      }
      else
      {
         this.life = this.life_max;
      }
      if(this == _level0.P2_role && _level0.serviceName == "life" && this.life > _level0.life_max)
      {
         this.life -= _level0.life_max;
      }
      this.superPoint = s_Point;
      this.powerPoint_max = p_max;
      this.opp = opponent;
      this.burst_mode = burst;
      this.power_skillSuper = _level0.power_skillSuper;
      this.power_skillBurst = _level0.power_skillBurst;
   }
   function start()
   {
      this.mc.play();
   }
   function reset()
   {
      this.statusClear();
      this.toSkill = this.noAct;
      this.toAction = this.noAct;
      this.toStatus = this.end_control;
      this.control = false;
      this.isKO = false;
      this.KO_checked = false;
      this.onEgde = false;
      if(_level0.moreVs != true)
      {
         this.redBlood = false;
         this.life = this.life_max;
      }
      if(this.roleMode == 3)
      {
         this.gotoAndStop("ready");
      }
      else if(this.roleMode == 2)
      {
         this.gotoAndStop("ready2");
      }
      else
      {
         this.gotoAndStop("ready");
      }
      if(this == _level0.P2_role && _level0.serviceName == "life" && this.life > _level0.life_max)
      {
         this.life -= _level0.life_max;
      }
      this._x = this.startX;
      this._y = this.startY;
      this.checkSide_abs();
      _level0.zoomControl_mc.zoomBack(0.5);
      this.onEnterFrame = function()
      {
         if(this.currentLabel == "ready" || this.currentLabel == "ready2")
         {
            this.compOpenPose = true;
            delete this.onEnterFrame;
         }
      };
   }
   function reset_error()
   {
      _level0.charToCenter();
      _level0.P1_role.reload();
      _level0.P2_role.reload();
      this.statusClear();
      this.start_control();
      this._x = this.startX;
      this._y = this.startY;
      this.checkSide_abs();
      this.onEgde = false;
      if(_level0.player_type == "trainning")
      {
         this.redBlood = false;
         this.life = this.life_max;
      }
      this.hitsArray = [];
      _level0.zoomControl_mc.zoomBack(0.5);
      _level0.char_mc._y = 0;
   }
   function noAct()
   {
   }
   function start_control()
   {
      this.control = true;
      this.toSkill = this.toSkill_temp;
      this.toAction = this.toAction_temp;
      this.toStatus = this.toStatus_temp;
      if(this.roleMode == 3)
      {
         this.toStatus_switch("stand");
      }
      else if(this.roleMode == 2)
      {
         this.toStatus_switch("stand2");
      }
      else
      {
         this.toStatus_switch("stand");
      }
   }
   function end_control(action)
   {
      this.toStatus_temp(action);
   }
   function do_end()
   {
      this.control = false;
      this.toSkill = this.noAct;
      this.toAction = this.noAct;
      this.toStatus = this.end_control;
      if(this.status_1 == "walk_f" || this.status_1 == "walk_b" || this.status_1 == "dash_f" || this.status_1 == "squat" || this.status_2 == "toLand")
      {
         delete this.onEnterFrame;
         this.status_1 = "stand";
         this.gotoAndStop("stand");
      }
   }
   function do_KO(loser)
   {
      this.isKO = true;
      if(this.status_4 == "hold" || this.status_1 == "breakDefend")
      {
         this.hurtValue.hurtBack = "hurt2";
         this.hurtValue.end_status = "getup2";
         this.hurtValue.Vx = 20;
         this.toStatus("kneeldown");
         this.hurtBack();
      }
      var _loc2_ = this.attachMovie("ko_snd_" + loser._roleName,"ko_snd",12545);
   }
   function do_win()
   {
      this.opp.isKO = true;
      var _loc2_ = int(Math.random() * this.winPoseArray.length);
      var _loc3_ = this.winPoseArray[_loc2_];
      this.opp.isKO = true;
      this.gotoAndStop(_loc3_);
      this.status_1 = "end";
      this.opp.showHits_end();
   }
   function do_lose()
   {
      this.isKO = true;
      this.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         this.isKO = true;
         if(this.status_2 == "land" && this.status_3 == "normal" && this.status_4 == "normal" && this.status_6 == "normal")
         {
            this.gotoAndStop("lose");
            this.status_1 = "lose";
            delete this.onEnterFrame;
         }
      };
   }
   function checkSide_abs()
   {
      if(this._x < this.opp._x - this.side_offset)
      {
         this._xscale = this.scale;
         this.dir = 1;
         this.newKeyControl.dir = 1;
         if(this.status_4 == "hold" && this.dir == this.opp.dir && !this.holdFreeze)
         {
            this.toStatus_switch("stand");
         }
      }
      else if(this._x > this.opp._x + this.side_offset)
      {
         this._xscale = - this.scale;
         this.dir = -1;
         this.newKeyControl.dir = -1;
         if(this.status_4 == "hold" && this.dir == this.opp.dir && !this.holdFreeze)
         {
            this.toStatus_switch("stand");
         }
      }
   }
   function checkSide_abs2()
   {
      if(this._x < this.opp._x - this.side_offset)
      {
         this._xscale = this.scale;
         this.dir = 1;
         this.newKeyControl.dir = 1;
      }
      else if(this._x > this.opp._x + this.side_offset)
      {
         this._xscale = - this.scale;
         this.dir = -1;
         this.newKeyControl.dir = -1;
      }
   }
   function checkSide()
   {
      if(this.status_2 == "toLand")
      {
         this.chageSide_arg();
         return undefined;
      }
      if(this.status_1 == "roll_f")
      {
         this.chageSide_arg();
         return undefined;
      }
      if(this.status_2 != "land")
      {
         return undefined;
      }
      if(this.status_3 != "normal")
      {
         return undefined;
      }
      if(this.status_6 != "normal")
      {
         return undefined;
      }
      if(this.status_1 == "dash_f")
      {
         return undefined;
      }
      if(this._x < this.opp._x - this.side_offset)
      {
         this.chageSide1();
      }
      else if(this._x > this.opp._x + this.side_offset)
      {
         this.chageSide2();
      }
   }
   function chageSide_arg()
   {
      if(this._x < this.opp._x - this.side_offset && this._xscale < 0)
      {
         this.newKeyControl.dir = 1;
         if(this.status_4 == "hold" && this.dir == this.opp.dir && !this.holdFreeze)
         {
            this.toStatus_switch("stand");
         }
      }
      else if(this._x > this.opp._x + this.side_offset && this._xscale > 0)
      {
         this.newKeyControl.dir = -1;
         if(this.status_4 == "hold" && this.dir == this.opp.dir && !this.holdFreeze)
         {
            this.toStatus_switch("stand");
         }
      }
   }
   function chageSide1()
   {
      this._xscale = this.scale;
      this.dir = 1;
      this.newKeyControl.dir = 1;
      if(this.status_4 == "hold" && this.dir == this.opp.dir && !this.holdFreeze)
      {
         this.toStatus_switch("stand");
      }
   }
   function chageSide2()
   {
      this._xscale = - this.scale;
      this.dir = -1;
      this.newKeyControl.dir = -1;
      if(this.status_4 == "hold" && this.dir == this.opp.dir && !this.holdFreeze)
      {
         this.toStatus_switch("stand");
      }
   }
   function lifeControl(obj, hpadd)
   {
      _level0.lifeControl(obj,hpadd);
   }
   function powerControl(obj)
   {
      _level0.powerControl(obj);
   }
   function showHits_end()
   {
      if(this.opp.hits == 0)
      {
         return undefined;
      }
      _level0.showHits_end(this.hitsObj);
      if(this.opp.inRecord)
      {
         this.opp.skill_record_end(this.opp.hits);
      }
      if(this.opp.hits > 0)
      {
         this.opp.hitsArray.push(this.opp.hits);
      }
      this.opp.hits = 0;
   }
   function toSkill(action, cancle)
   {
      if(action == undefined)
      {
         return undefined;
      }
      if(_level0.inPause)
      {
         return undefined;
      }
      if(this.skill_mc.action == action && this.skill_mc.allowNum == 1)
      {
         return undefined;
      }
      this.powerDecType = "";
      var _loc3_;
      var _loc6_;
      if((this.status_3 == "hurt" || this.status_3 == "") && this.status_6 != "all")
      {
         if((this.opp.status_1 == "pitch" || this.opp.status_1 == "pitch2") && this.opp.mc._currentframe < 6 && this.canBreakCatch == true && (action == "punch" || action == "kick" || action == "squatPunch" || action == "squatKick"))
         {
            _loc3_ = (this._x + this.opp._x) / 2;
            if(_level0.char_mc._x + _loc3_ > this.egde_max)
            {
               _loc3_ = this.egde_max - _level0.char_mc._x;
            }
            if(_level0.char_mc._x + _loc3_ < this.egde_min)
            {
               _loc3_ = this.egde_min - _level0.char_mc._x;
            }
            _loc6_ = this.land_Y - 150;
            _level0.effect_mc.hitFire("hitFire3",_loc3_,_loc6_);
            this._x = this.opp._x + 60 * this.opp.dir;
            this._y = this.land_Y;
            this.breakCatch2();
            this.Va = 5;
            this.start_move_X2(-30);
            this.opp._y = this.land_Y;
            this.opp.breakCatch();
            this.opp.Va = 5;
            this.opp.start_move_X2(-30);
         }
         return undefined;
      }
      if(this.status_3 == "down" || this.status_6 == "all")
      {
         if(this.delayCheck())
         {
            this.skill_delay(action);
         }
         return undefined;
      }
      if(this.holdFreeze)
      {
         if(this.inBurst || this == _level0.P1_role && _level0.LP_P1.powerPoint_num != 0 || this == _level0.P2_role && _level0.LP_P2.powerPoint_num != 0)
         {
            if(action == "heavyHit" && this.holdCount() == false)
            {
               return undefined;
            }
         }
         return undefined;
      }
      var _loc4_ = this.superCheck(action);
      if(_loc4_ == false)
      {
         return false;
      }
      var _loc5_;
      if(_loc4_ == true)
      {
         if(this.burst_mode == "power")
         {
            _loc5_ = this.skillSuperCheck(action);
            if(_loc5_ != "")
            {
               this.powerDecType = "super";
               action = _loc5_;
            }
         }
      }
      else if(this.superMaxList[action] == 1)
      {
         this.powerDecType = "super";
      }
      if(this.burstCheck(action) == false)
      {
         return undefined;
      }
      if(this.status_1 == action)
      {
         if(this.delayCheck())
         {
            this.skill_delay(action);
            return undefined;
         }
         if(this.comboClass.combo1[this.status_1][action] == undefined)
         {
            if(this.status_1 != "punch_l" && this.status_1 != "kick_l" && this.status_1 != "squatPunch_l" && this.status_1 != "squatKick_l")
            {
               return undefined;
            }
         }
      }
      if((this.status_3 == "attack" || this.status_6 == "nomove" || this.status_2 == "toLand") && !cancle)
      {
         if(this.comboClass.check_combo(this.status_1,action))
         {
            this.nosh = false;
            this.wireAttack = false;
            this.checkTouch_stop = false;
            return true;
         }
         if(this.delayCheck())
         {
            this.skill_delay(action);
            return undefined;
         }
         return undefined;
      }
      if(this.delayCheck())
      {
         this.skill_delay(action);
         return undefined;
      }
      if(this.status_3 == "roll")
      {
         return undefined;
      }
      if(this.skill_start(action) && this.status_6 != "nomove" && this.opp.status_6 != "nomove")
      {
         this.nosh = false;
         this.wireAttack = false;
         this.checkTouch_stop = false;
         this.opp.checkDefend();
         return true;
      }
      return undefined;
   }
   function autoToSkill(action)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.auto.length)
      {
         if(this.auto[_loc2_] == action)
         {
            this.checkSide_abs();
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function skill_start(action)
   {
      if(this[action] != undefined)
      {
         this.opp_hight2 = this.opp_hight;
         this.autoToSkill(action);
         if(this.toStatus(action))
         {
            this.countEnd();
            this.powerDec();
            this.powerDec2();
            this.skill_last = this.skill_last0;
            this.skill_last0 = action;
            if(this.status_2 == "air")
            {
               this.skill_last0 += "_air";
            }
            this.skillToEqual(this.skill_last0);
            return true;
         }
         this.powerDecType = "";
         this.powerDecType2 = "";
      }
      else if(this.status_2 == "land" && (this.status_3 == "normal" || this.status_3 == "attack"))
      {
         if(this.toStatus(action))
         {
            this.countEnd();
            this.powerDec();
            this.powerDec2();
            this.status_3 = "attack";
            this.status_4 = "normal";
            this.status_6 = "normal";
            this.nobody = false;
            this.opp_hight2 = this.opp_hight;
            this.skill_last = this.skill_last0;
            this.skill_last0 = action;
            this.skillToEqual(this.skill_last0);
            return true;
         }
         this.powerDecType = "";
         this.powerDecType2 = "";
      }
   }
   function switchSkill(action)
   {
      this.toSkill(action,true);
      this.wireAttack = false;
   }
   function toAction(action)
   {
      this.wireAttack = false;
      if(_level0.inPause)
      {
         return undefined;
      }
      this.toStatus(action);
      this.opp.actionDefend(action);
   }
   function keyUp(obj)
   {
      var _loc1_ = obj.upKey;
   }
   function reload()
   {
      this.skill_loader.removeMovieClip();
      this.effect_loader.removeMovieClip();
      this.skill_loader = this._parent.createEmptyMovieClip("skill_loader",200);
      this.effect_loader = this._parent.createEmptyMovieClip("effect_loader",201);
   }
   function statusClear()
   {
      this.status_1 = "stand";
      this.status_2 = "land";
      this.status_3 = "normal";
      this.status_4 = "normal";
      this.status_5 = "normal";
      this.status_6 = "normal";
      this.status_7 = "normal";
      this.status_8 = "normal";
      this.countEnd();
      this.holdFreeze = false;
      this.inCount = false;
      this.nosh = false;
      this.nobody = false;
      this.hitID = "nohit";
      this.powerDecType2 = "";
      this.powerDecType = "";
      this.onHit = false;
      this.checkTouch_stop = false;
      this.wireAttack = false;
      this.superSkill = false;
      this.isBurstSkill = false;
      this.opp_hight2 = this.opp_hight;
      this._y = this.land_Y;
      this.run_snd.stop();
      this.stop_hurtBack();
      this.clearLists();
      this.bdCombo = false;
   }
   function toStatus(_action)
   {
      var _loc2_ = _action;
      this.wireAttack = false;
      if(this == _level0.P1_role && _level0.actionSet_status_P1 == "control" || this == _level0.P2_role && _level0.actionSet_status_P2 == "control")
      {
         this.control2 = true;
      }
      else
      {
         this.control2 = false;
      }
      if(_level0.inPause)
      {
         return undefined;
      }
      if(this.nonSkill && this.normalList.join().indexOf(_loc2_) == -1 && this.normalList2.join().indexOf(_loc2_) == -1)
      {
         return undefined;
      }
      if(_level0.inFreeze && _loc2_ != "stand")
      {
         this.skill_delay(_loc2_);
         this.mc.stop();
         return undefined;
      }
      if(this[_loc2_] != undefined)
      {
         if(this[_loc2_]() == false)
         {
            return false;
         }
      }
      else
      {
         this.gotoAndStop(_loc2_);
         if(this.status_1 == _loc2_)
         {
            this.mc.gotoAndPlay(1);
         }
         this.status_1 = _loc2_;
      }
      this.run_snd.stop();
      return true;
   }
   function toStatus_switch(act)
   {
      if(this.status_3 == "hurt")
      {
         return undefined;
      }
      if((this.status_1 == "getup1" || this.status_1 == "getup2") && act == "stand")
      {
         this.noCatch = true;
         this.noCatchT2 = 12;
         clearInterval(this.noCatchT);
         this.noCatchT = setInterval(this,"noCatchTimer",10);
      }
      var _loc2_ = act;
      this.statusClear();
      this.checkSide();
      this.dizzied = false;
      this.showHits_end();
      if(!(this == _level0.P1_role && _level0.actionSet_status_P1 == "control" || this == _level0.P2_role && _level0.actionSet_status_P2 == "control"))
      {
         this.control2 = false;
         if(this == _level0.P1_role)
         {
            if(_level0.actionSet_status_P1 == "heavyHit")
            {
               this.toStatus("stand");
            }
            this.toStatus(_level0.actionSet_status_P1);
         }
         else
         {
            if(_level0.actionSet_status_P2 == "heavyHit")
            {
               this.toStatus("stand");
            }
            this.toStatus(_level0.actionSet_status_P2);
         }
         return undefined;
      }
      this.control2 = true;
      if(this.delaySkill != "")
      {
         if(this.toSkill(this.delaySkill))
         {
            this.delaySkill = "";
            return undefined;
         }
         this.delaySkill = "";
      }
      if(Key.isDown(this.u))
      {
         _loc2_ = "jump";
      }
      else if(Key.isDown(this.d))
      {
         _loc2_ = "squat";
      }
      else if(Key.isDown(this.f))
      {
         if(this.dir == 1)
         {
            _loc2_ = "walk_f";
         }
         else
         {
            if(this.opp.status_3 == "attack" && this.opp.status_6 != "nomove" || this.opp.hasObj())
            {
               this.hold_u();
               return undefined;
            }
            _loc2_ = "walk_b";
         }
      }
      else if(Key.isDown(this.b))
      {
         if(this.dir == 1)
         {
            if(this.opp.status_3 == "attack" && this.opp.status_6 != "nomove" || this.opp.hasObj())
            {
               this.hold_u();
               return undefined;
            }
            _loc2_ = "walk_b";
         }
         else
         {
            _loc2_ = "walk_f";
         }
      }
      else if(Key.isDown(this.p))
      {
         _loc2_ = "punch";
      }
      else if(Key.isDown(this.k))
      {
         _loc2_ = "kick";
      }
      this.toStatus(_loc2_);
   }
   function delayCheck()
   {
      var _loc2_ = this.input_pre[this.status_1];
      if(_loc2_ == undefined)
      {
         return false;
      }
      var _loc3_ = this.mc._currentframe;
      if(_loc3_ > _loc2_)
      {
         return true;
      }
   }
   function skill_delay(action)
   {
      this.delaySkill = action;
   }
   function skill_restart()
   {
      if(this.delaySkill != "")
      {
         if(this.toSkill(this.delaySkill))
         {
            this.powerDec();
            this.powerDec2();
         }
         else
         {
            this.powerDecType = "";
            this.powerDecType2 = "";
         }
         this.delaySkill = "";
      }
   }
   function shakeCheck()
   {
      _level0.shake_mc.shakeStart(this.hurtValue.shake,this.hurtValue.shake_int);
   }
   function checkTouch(dv, throwTrue)
   {
      if(this.checkTouch_stop || this.opp.checkTouch_stop)
      {
         return undefined;
      }
      if(this.status_2 != "air" && this.opp.status_2 == "air")
      {
         return undefined;
      }
      if(throwTrue)
      {
         if(this.hitTest(this.opp) && this.opp.status_3 == "roll")
         {
            return true;
         }
         if((this.opp.status_1 == "hold_u" || this.opp.status_1 == "hold_d") && this.opp.status_5 == "hitBack" || !this.opp.mc.body)
         {
            return false;
         }
         return true;
      }
      if(!throwTrue)
      {
         if(this.status_3 == "roll" || this.opp.status_3 == "roll" || this.status_1 == "roll_ab" || this.opp.status_1 == "roll_ab")
         {
            return undefined;
         }
      }
      var _loc5_;
      var _loc2_;
      var _loc4_;
      var _loc3_;
      if(this._y + this.opp_hight2 > this.opp._y - this.opp.opp_hight2 && this._y - this.opp_hight2 < this.opp._y + this.opp.opp_hight2 || this.status_2 != "air" && this.opp.status_3 == "down" || this.status_3 == "down" && this.opp.status_2 != "air")
      {
         _loc3_ = this.opp._x;
         _loc4_ = this._x + dv;
         if(this._xscale > 0)
         {
            if(_loc4_ > _loc3_ - this.opp_width2 && _loc4_ < _loc3_ + 10)
            {
               _loc5_ = _loc4_ - (_loc3_ - this.opp_width2);
               if(this.opp.onEgde)
               {
                  _loc2_ = _loc5_;
               }
               else
               {
                  _loc2_ = int(_loc5_ / 2);
               }
               this.do_move2(- _loc2_);
               this.opp.do_move2(_loc2_);
               return true;
            }
            if(_loc4_ >= _loc3_ + 10 && _loc4_ < _loc3_ + this.opp_width2)
            {
               _loc5_ = _loc4_ - (_loc3_ + this.opp_width2);
               if(this.opp.onEgde)
               {
                  _loc2_ = _loc5_;
               }
               else
               {
                  _loc2_ = int(_loc5_ / 2);
               }
               this.do_move2(- _loc2_);
               this.opp.do_move2(_loc2_);
               return true;
            }
         }
         else if(this._xscale < 0)
         {
            if(_loc4_ >= _loc3_ - 10 && _loc4_ < _loc3_ + this.opp_width2)
            {
               _loc5_ = _loc4_ - (_loc3_ + this.opp_width2);
               if(this.opp.onEgde)
               {
                  _loc2_ = _loc5_;
               }
               else
               {
                  _loc2_ = int(_loc5_ / 2);
               }
               this.do_move2(- _loc2_);
               this.opp.do_move2(_loc2_);
               return true;
            }
            if(_loc4_ > _loc3_ - this.opp_width2 && _loc4_ < _loc3_ - 10)
            {
               _loc5_ = _loc4_ - (_loc3_ - this.opp_width2);
               if(this.opp.onEgde)
               {
                  _loc2_ = _loc5_;
               }
               else
               {
                  _loc2_ = int(_loc5_ / 2);
               }
               this.do_move2(- _loc2_);
               this.opp.do_move2(_loc2_);
               return true;
            }
         }
      }
   }
   function checkTouch3()
   {
      if(!this.opp.mc.body && this.opp.status_3 != "roll")
      {
         return false;
      }
      if(this.dir == 1)
      {
         if(this.opp._x < this._x + 120)
         {
            return true;
         }
         return false;
      }
      if(this.opp._x > this._x - 120)
      {
         return true;
      }
      return false;
   }
   function bodyTouch()
   {
      var _loc2_ = this.checkTouch2();
      if(_loc2_ != undefined)
      {
         this.do_bodyTouch(_loc2_);
      }
   }
   function do_bodyTouch(v)
   {
      var Vx = v;
      var owner = this;
      this.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         Vx = int(Vx / 2);
         owner.do_move2(Vx);
         if(Vx == 0)
         {
            delete this.onEnterFrame;
         }
      };
   }
   function checkTouch2()
   {
      var _loc2_ = this._x - this.opp._x;
      var _loc3_;
      if(_loc2_ > -50 && _loc2_ < 0)
      {
         _loc3_ = -50 - _loc2_;
         return _loc3_;
      }
      if(_loc2_ < 50 && _loc2_ >= 0)
      {
         _loc3_ = 50 - _loc2_;
         return _loc3_;
      }
   }
   function egdecheck(v)
   {
      var _loc3_ = _level0.char_mc._x + this._x;
      if(_loc3_ + v >= this.egde_max && v > 0)
      {
         this.onEgde = true;
         this.egde = 1;
         this._x = this.egde_max - _level0.char_mc._x;
         return true;
      }
      if(_loc3_ + v <= this.egde_min && v < 0)
      {
         this.onEgde = true;
         this.egde = -1;
         this._x = this.egde_min - _level0.char_mc._x;
         return true;
      }
      this.onEgde = false;
      this.egde = 0;
   }
   function e_mode(target, blackAsh)
   {
      this.filters = [];
      if(target == undefined || target == null)
      {
         target = this;
      }
      this.filters = [];
      if((this.roleName == "Aah" || this._roleName == "Ash") && this.roleMode == 2)
      {
         if(this.normalmode == "normal")
         {
            this.hei(target,blackAsh);
         }
         else
         {
            if(this.normalmode == "black")
            {
               return undefined;
            }
            if(this.normalmode == "blue")
            {
               this.blue(target);
            }
            else if(this.normalmode == "green")
            {
               this.green(target);
            }
         }
      }
      else
      {
         if(this.normalmode == "normal")
         {
            return undefined;
         }
         if(this.normalmode == "black")
         {
            this.hei(target);
         }
         else if(this.normalmode == "blue")
         {
            this.blue(target);
         }
         else if(this.normalmode == "green")
         {
            this.green(target);
         }
      }
   }
   function hei(target, blackAsh)
   {
      var _loc5_ = new flash.filters.GlowFilter(1118481,1,20,20,1.5,3,false,false);
      var _loc4_ = new Array(0.3,0.6,0.08,0,0,0.3,0.6,0.08,0,0,0.3,0.6,0.08,0,0,0,0,0,1,0);
      var _loc3_ = new flash.filters.ColorMatrixFilter(_loc4_);
      var _loc2_ = new Array();
      if(_level0.glowMode && blackAsh)
      {
         this.colorChange("black1",target);
         _loc2_.push(_loc5_,_loc3_);
      }
      else
      {
         _loc2_.push(_loc3_);
      }
      target.filters = _loc2_;
   }
   function blue(target)
   {
      var _loc1_ = new Array();
      _loc1_ = _loc1_.concat([0.3,0.6,0.08,0,0]);
      _loc1_ = _loc1_.concat([0.3,0.6,0.08,0,0]);
      _loc1_ = _loc1_.concat([0.6,0.6,0.08,0,0]);
      _loc1_ = _loc1_.concat([0,0,0,1,0]);
      var _loc3_ = new flash.filters.ColorMatrixFilter(_loc1_);
      var _loc2_ = new Array();
      _loc2_.push(_loc3_);
      target.filters = _loc2_;
   }
   function green(target)
   {
      var _loc1_ = new Array();
      _loc1_ = _loc1_.concat([0.3,0.6,0.08,0,0]);
      _loc1_ = _loc1_.concat([0.6,0.6,0.08,0,0]);
      _loc1_ = _loc1_.concat([0.3,0.6,0.08,0,0]);
      _loc1_ = _loc1_.concat([1,0,0,1,0]);
      var _loc3_ = new flash.filters.ColorMatrixFilter(_loc1_);
      var _loc2_ = new Array();
      _loc2_.push(_loc3_);
      target.filters = _loc2_;
   }
   function colorChange(cc, target)
   {
      if(target == undefined || target == null)
      {
         target = this;
      }
      var _loc10_ = new Color(target);
      var _loc9_ = this.colorObj[cc];
      _loc10_.setTransform(_loc9_);
      if(!_level0.glowMode)
      {
         return undefined;
      }
      var _loc4_;
      var _loc3_ = ["fire_red2","fire_red1","purple2","purple1","fire_blue2","fire_blue1","light2","light1","ice2","ice1","green2","green1","black1","black2","ashPower2","ashPower1","nonSkill2","nonSkill1","huoFeng1","huoFeng2"];
      var _loc5_ = [16737792,26367,16711935,10027263,16711935,0,65535,16711680,65535,16777215,65280,39168,0,1118481,65280,65280,65535,65535,16711680,13369344];
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(cc == _loc3_[_loc2_])
         {
            _loc4_ = new flash.filters.GlowFilter(_loc5_[_loc2_],1,10,10,2,3,false,false);
         }
         _loc2_ = _loc2_ + 1;
      }
      var _loc8_ = new Array();
      _loc8_.push(_loc4_);
      target.filters = _loc8_;
   }
   function colorNormal(bAsh)
   {
      if(bAsh == undefined || bAsh == null)
      {
         bAsh = true;
      }
      if(_level0.inPause)
      {
         clearInterval(this.color_timer2);
         this.color_timer2 = setInterval(this,"colorNormal",100);
         return undefined;
      }
      var _loc4_ = new Color(this);
      var _loc3_ = this.colorObj.normal;
      _loc4_.setTransform(_loc3_);
      clearInterval(this.color_timer2);
      if(_level0.glow2P && _level0.charSelect_P1 == _level0.charSelect_P2)
      {
         if(_level0.P1_role.normalmode == _level0.P2_role.normalmode)
         {
            if(_level0.charSelect_P1 == "Zero" || _level0.charSelect_P1 == "KyoW" || _level0.charSelect_P1 == "Ash")
            {
               if(_level0.mode_role_P1 == _level0.mode_role_P2)
               {
                  this.e_mode(this,_level0.ashShadow);
                  _level0.P2_role.changeColor2P();
               }
               else
               {
                  this.e_mode(this,_level0.ashShadow);
               }
            }
            else
            {
               this.e_mode(this,_level0.ashShadow);
               _level0.P2_role.changeColor2P();
            }
         }
         else
         {
            this.e_mode(this,_level0.ashShadow);
         }
      }
      else
      {
         this.e_mode(this,_level0.ashShadow);
      }
   }
   function changeColor2P()
   {
      var _loc3_;
      if(_level0.glow2Ptype)
      {
         _loc3_ = new Array(2.938,-0.72,-0.72,0,0,-0.122,2.578,-0.122,0,0,-0.016,-0.016,2.483,0,0,0,0,0,1,0);
      }
      else
      {
         _loc3_ = new Array(0.838,-0.72,-0.72,0,0,-0.122,0.878,-0.122,0,0,-0.016,-0.016,0.783,0,0,0,0,0,1,0);
      }
      var _loc4_ = new flash.filters.ColorMatrixFilter(_loc3_);
      var _loc2_ = new Array();
      _loc2_.push(_loc4_);
      this.filters = _loc2_;
   }
   function changeColorSelf(cc, time_f)
   {
      clearInterval(this.color_timer2);
      var _loc3_ = new Color(this);
      var _loc2_ = this.colorObj[cc];
      _loc3_.setTransform(_loc2_);
      this.color_timer2 = setInterval(this,"backColorSelf",time_f);
   }
   function changeColor(cc, time_f)
   {
      this.opp.changeColorSelf(cc,time_f);
   }
   function backColorSelf()
   {
      if(_level0.inPause)
      {
         clearInterval(this.color_timer2);
         this.color_timer2 = setInterval(this,"backColorSelf",100);
         return undefined;
      }
      this.colorNormal(true);
   }
   function backColor()
   {
      var _loc3_ = new Color(this.opp);
      var _loc2_ = this.colorObj.normal;
      _loc3_.setTransform(_loc2_);
      clearInterval(this.color_timer);
   }
   function topLayer()
   {
      if(this._parent.getDepth() < this.opp._parent.getDepth())
      {
         this._parent.swapDepths(this.opp._parent);
      }
   }
   function hasObj()
   {
      if(this.skill_loader.getNextHighestDepth() > 0)
      {
         return true;
      }
      return false;
   }
   function getObj()
   {
      var _loc3_ = this.skill_loader.getNextHighestDepth() - 1;
      if(_loc3_ < 0)
      {
         return undefined;
      }
      var _loc2_ = this.skill_loader["skill" + _loc3_];
      if(!(_loc2_ instanceof MovieClip))
      {
         return undefined;
      }
      return _loc2_;
   }
   function getObjs()
   {
      var _loc4_ = [];
      var _loc6_ = this.skill_loader.getNextHighestDepth();
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < _loc6_)
      {
         _loc3_ = this.skill_loader["skill" + _loc2_];
         _loc4_.push(_loc3_);
         _loc2_ = _loc2_ + 1;
      }
      var _loc5_ = this.effect_loader.getNextHighestDepth();
      _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         _loc3_ = this.effect_loader["skill" + _loc2_];
         _loc4_.push(_loc3_);
         _loc2_ = _loc2_ + 1;
      }
      return _loc4_;
   }
   function getObjNum()
   {
      var _loc2_ = this.skill_loader.getNextHighestDepth();
      return _loc2_;
   }
   function getObjDis()
   {
      var _loc3_ = this.skill_loader.getNextHighestDepth() - 1;
      if(_loc3_ < 0)
      {
         return undefined;
      }
      var _loc2_ = this.skill_loader["skill" + _loc3_]._x;
      if(_loc2_ == undefined)
      {
         return undefined;
      }
      return Math.abs(_loc2_ - this.opp._x);
   }
   function getObjDisAI()
   {
      var _loc4_ = this.skill_loader.getNextHighestDepth() - 1;
      if(_loc4_ < 0)
      {
         return undefined;
      }
      if(posx == undefined)
      {
         return undefined;
      }
      _loc4_ = this.skill_loader.getNextHighestDepth();
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < _loc4_)
      {
         var posx = this.skill_loader["skill" + _loc2_]._x;
         if(_loc2_ > 0)
         {
            _loc3_ = this.skill_loader["skill" + (_loc2_ - 1)]._x;
         }
         if(posx != undefined)
         {
            if(_loc3_ != undefined && posx < _loc3_)
            {
               posx = _loc3_;
            }
         }
         _loc2_ = _loc2_ + 1;
      }
      return Math.abs(posx - this.opp._x);
   }
   function to_PK_l()
   {
      if(this.dir == 1)
      {
         if(Key.isDown(this.f))
         {
            this.toAction("roll_f");
         }
         else if(Key.isDown(this.b))
         {
            this.toAction("roll_b");
         }
         else
         {
            this.toAction("roll_f");
         }
      }
      else if(this.dir == -1)
      {
         if(Key.isDown(this.f))
         {
            this.toAction("roll_b");
         }
         else if(Key.isDown(this.b))
         {
            this.toAction("roll_f");
         }
         else
         {
            this.toAction("roll_f");
         }
      }
   }
   function to_PK()
   {
      if(this.status_1 == "jump_f" || this.status_1 == "jump_far" || this.status_1 == "jump" || this.status_1 == "jump_b")
      {
         this.jumpSkill("heavyHit");
         return undefined;
      }
      this.toSkill("heavyHit");
   }
   function to_HK()
   {
      if(this.status_1 == "jump_f" || this.status_1 == "jump_far" || this.status_1 == "jump" || this.status_1 == "jump_b")
      {
         this.jumpSkill("heavyHit");
         return undefined;
      }
      this.toSkill("heavyHit");
   }
   function to_key_s()
   {
      if(this.charge_enabled && this.superPoint == this.powerPoint_max)
      {
         this.toAction("charge");
         return undefined;
      }
      if(this.mode_key == "easy" && this.inBurst)
      {
         if(Key.isDown(this.f) && this.dir == 1)
         {
            this.toSkill(this.skillObj.busrt_a);
         }
         else if(Key.isDown(this.b) && this.dir == -1)
         {
            this.toSkill(this.skillObj.busrt_a);
         }
         else if(Key.isDown(this.f) && this.dir == -1)
         {
            this.toSkill(this.skillObj.busrt_d);
         }
         else if(Key.isDown(this.b) && this.dir == 1)
         {
            this.toSkill(this.skillObj.busrt_d);
         }
         else
         {
            this.toSkill(this.skillObj.busrt_a);
         }
      }
      else if(this.charge_enabled)
      {
         if(Key.isDown(this.f) && this.dir == 1)
         {
            this.toAction("burst_a");
         }
         else if(Key.isDown(this.b) && this.dir == -1)
         {
            this.toAction("burst_a");
         }
         else if(Key.isDown(this.f) && this.dir == -1)
         {
            this.toAction("burst_d");
         }
         else if(Key.isDown(this.b) && this.dir == 1)
         {
            this.toAction("burst_d");
         }
         else if(Key.isDown(this.d))
         {
            this.toAction("burst_p");
         }
         else
         {
            this.toAction("burst_p");
         }
      }
      else if(Key.isDown(this.f) && this.dir == 1)
      {
         this.toAction("burst_a");
      }
      else if(Key.isDown(this.b) && this.dir == -1)
      {
         this.toAction("burst_a");
      }
      else if(Key.isDown(this.f) && this.dir == -1)
      {
         this.toAction("burst_d");
      }
      else if(Key.isDown(this.b) && this.dir == 1)
      {
         this.toAction("burst_d");
      }
      else if(Key.isDown(this.d))
      {
         this.toAction("burst_p");
      }
      else
      {
         this.toAction("burst_p");
      }
   }
   function to_BC()
   {
      if(this.charge_enabled && this.superPoint == this.powerPoint_max)
      {
         this.toAction("charge");
         return undefined;
      }
      if(this.mode_key == "easy" && this.inBurst)
      {
         if(Key.isDown(this.f) && this.dir == 1)
         {
            this.toSkill(this.skillObj.busrt_a);
         }
         else if(Key.isDown(this.b) && this.dir == -1)
         {
            this.toSkill(this.skillObj.busrt_a);
         }
         else if(Key.isDown(this.f) && this.dir == -1)
         {
            this.toSkill(this.skillObj.busrt_d);
         }
         else if(Key.isDown(this.b) && this.dir == 1)
         {
            this.toSkill(this.skillObj.busrt_d);
         }
         else
         {
            this.toSkill(this.skillObj.busrt_a);
         }
      }
      else if(this.charge_enabled)
      {
         if(Key.isDown(this.f) && this.dir == 1)
         {
            this.toAction("burst_a");
         }
         else if(Key.isDown(this.b) && this.dir == -1)
         {
            this.toAction("burst_a");
         }
         else if(Key.isDown(this.f) && this.dir == -1)
         {
            this.toAction("burst_d");
         }
         else if(Key.isDown(this.b) && this.dir == 1)
         {
            this.toAction("burst_d");
         }
         else if(Key.isDown(this.d))
         {
            this.toAction("burst_p");
         }
         else
         {
            this.toAction("burst_p");
         }
      }
      else if(Key.isDown(this.f) && this.dir == 1)
      {
         this.toAction("burst_a");
      }
      else if(Key.isDown(this.b) && this.dir == -1)
      {
         this.toAction("burst_a");
      }
      else if(Key.isDown(this.f) && this.dir == -1)
      {
         this.toAction("burst_d");
      }
      else if(Key.isDown(this.b) && this.dir == 1)
      {
         this.toAction("burst_d");
      }
      else if(Key.isDown(this.d))
      {
         this.toAction("burst_p");
      }
      else
      {
         this.toAction("burst_p");
      }
   }
   function to_key_s2()
   {
      if(this.roll_ex_enabled)
      {
         this.toAction("roll_ex");
      }
      else if(this.dir == 1)
      {
         if(Key.isDown(this.f))
         {
            this.toAction("roll_f");
         }
         else if(Key.isDown(this.b))
         {
            this.toAction("roll_b");
         }
         else
         {
            this.toAction("roll_f");
         }
      }
      else if(this.dir == -1)
      {
         if(Key.isDown(this.f))
         {
            this.toAction("roll_b");
         }
         else if(Key.isDown(this.b))
         {
            this.toAction("roll_f");
         }
         else
         {
            this.toAction("roll_f");
         }
      }
   }
   function to_kick()
   {
   }
   function to_kick_l()
   {
   }
   function to_punch()
   {
   }
   function to_punch_l()
   {
   }
   function to_double_f()
   {
      if(this.dash_ex_enabled)
      {
         this.toAction("dash_ex");
      }
      else
      {
         this.toAction("dash_f");
      }
   }
   function to_double_b()
   {
      this.toAction("dash_b");
   }
   function to_double_d()
   {
      this.toAction("squat");
   }
   function to_double_u()
   {
      this.toAction("jump");
   }
   function to_key_h()
   {
      this.toAction("tx");
   }
}
