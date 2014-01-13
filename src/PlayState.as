package  
{
	import flash.display.*;
	import org.flixel.*;
	import org.flixel.FlxG;
	import org.flixel.FlxCamera;

	//[SWF(width = "800", height = "500", backgroundColor = "#004466")]
	public class PlayState extends FlxState
	{
		//[Embed(source = '../lib/Stages.swf')] private var backgroundMC:Class;
		[Embed(source = "../lib/ui/game/TriggerBase.png")] private var triggerBarPNG:Class;
		
		[Embed(source = "../lib/ui/game/TriggerCenter.png")] private var triggerCenterPNG:Class;
		
		[Embed(source = "../lib/ui/game/Trigger.png")] private var triggerPNG:Class;
		
		[Embed(source = "../lib/ui/game/TriggerHit.png")] private var triggerHitPNG:Class;
		
		private var cameraClone:FlxSprite;
		
		//UI
		private var background:FlxSprite;
		private var triggerBar:FlxSprite;
		private var triggerCenter:FlxSprite;
		
		private var triggerHit:FlxSprite;
		private var trigger:FlxSprite;
		
		
		//GENERAL TEXT VARS
		private var debug:FlxText;
		private var timer:FlxText;
		private var playerScore:int = 0;
		
		private var eventPhase:String;
		
		private var playerAction:FlxText;
		private var chargeValue:FlxText;
		private var enemyHP:FlxText;
		private var playerHP:FlxText;
		
		
		//CLASS VARIABLES
		public static var player:Player;
		
		public var triggerSize:int = 50;
		public var triggerPosition:int = 0;
		public var triggerArray:Array;
		public var enemyAttackPatternA:Array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1];
		public var playerAttackPatternA:Array = [0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1];
		
		
		public var playerMin:int = 1;
		public var playerCurrent:int = 1;
		public var playerMax:int = 1;
		
		public var currentCharge:int = 0;
		public var maxCharge:int = 0;
		
			//Player
			
			//Health Stock
		public var playerMinHP:int = 1;
		public var playerCurrentHP:int = 100;
		public var playerMaxHP:int = 100;
			//Health Regeneration
			//Health Stock Bonus
			//Armor Type
			//Armor Value
			//Shield Type
			//Shield Value
			//Shield Regeneration
			
			//Weapon Type
			//Weapon Physical Damage
		public var playerMinDamage:int = 1;
		public var playerCurrentDamage:int = 1;
		public var playerMaxDamage:int = 100;
			//Weapon Spirit Damage
			//Weapon Trigger Speed
		public var playerMinAttackSpeed:int = 1;
		public var playerCurrentAttackSpeed:int = 1;
		public var playerMaxAttackSpeed:int = 1;
			//Weapon Trigger Count
		public var playerMinAttackCount:int = 0;
		public var playerCurrentAttackCount:int = 1;
		public var playerMaxAttackCount:int = 1;
			//Weapon Critical Hit rate
			//Weapon Critical Damage Modifier
			//Weapon Miss rate
			
			
			//Movement Speed
		public var playerMinMovementSpeed:int = 1;
		public var playerCurrentMovementSpeed:int = 2;
		public var playerMaxMovementSpeed:int = 2;
			//Movement Acceleration
			//Movement Velocity
			//Movement Friction
			
		
		
			//Enemy
			//Health
		public var enemyMinHP:int = 1;
		public var enemyCurrentHP:int = 100;
		public var enemyMaxHP:int = 100;
		
		//INITIALISES STATE
		public function PlayState() 
		{
			super();
		}
		
		override public function create():void 
		{
			super.create();
			
			//SETS THE BOUNDS FOR THE STAGE AND THE CAMERA
			FlxG.worldBounds.x = 0;
			FlxG.worldBounds.y = 0;
			FlxG.worldBounds.width = 800;
			FlxG.worldBounds.height = 600;
			FlxG.camera.setBounds(0, 0, 800, 600);
			
			//ADD TRIGGER BAR
			triggerBar = new FlxSprite(150, 200, triggerBarPNG);
			//triggerCenter = new FlxSprite(350, 200, triggerCenterPNG);
			//triggerBar.loadGraphic(triggerPNG, false, true, 108, 140, false);
			//add(triggerBar);
			//add(triggerCenter);
			
			eventPhase = "Attacking";
			triggerPlacement();
			
			triggerArray = playerAttackPatternA;
			
			for (var i:int = 0; i<playerAttackPatternA.length; i ++)
			{
				if (playerAttackPatternA[i] == 1)
				{
					triggerHit = new FlxSprite(150 + i * 4, 200, triggerHitPNG);
					add(triggerHit)
				}
			}
			//background = new FlxSprite(0, 0, backgroundPNG);
			//add(background);
			
			
			
			
			//SETS PARAMETERS FOR THE TEXT DISPLAYS
			debug = new FlxText(0, 0, 400, "");
			timer = new FlxText(0, 20, 400, "");
		
			//eventPhase = new FlxText(0, 40, 400, "");
		
			chargeValue = new FlxText(0, 60, 400, "");
			enemyHP = new FlxText(0, 80, 400, "");
			playerHP = new FlxText(0, 100, 400, "");
			
			//SETS THE TEXT SCROLL FACTORS TO 0 SO IT IS UNAFFECTED BY CAMERA MOVEMENT
			debug.scrollFactor.x = 0;
			debug.scrollFactor.y = 0;
			
			//INITIALISES CLASSES
			player = new Player;
			
			//ADDS CLASSES TO STATE
			add(player);
			
			//SETS THE CAMERA TO FOLLOW THE PLAYER OBJECT
			//FlxG.camera.follow(player, 3);
			
			//ADDS TEXT OBJECTS TO STAGE
			add(debug);
			add(timer);
		
			//add(eventPhase);
			
			add(chargeValue);
			add(enemyHP);
			add(playerHP);
		}
		
		override public function update():void
		{
			super.update();
			
			if (eventPhase == "Attacking")
			{
				triggerPosition += playerCurrentAttackSpeed;
				trigger.x = triggerPosition + 150;
			}
			
			if (triggerPosition > 200)
			{
				triggerPosition = 0;
			}
			
			if (FlxG.keys.pressed("SPACE"))
			{
				if (playerAttackPatternA[triggerPosition/4] == 1)
				{
					playerScore += playerCurrentDamage;
					
				}
				else if (playerAttackPatternA[triggerPosition/4] == 1)
				{
					playerScore -= playerCurrentDamage;
				}
			}
			
			//REGENERATE HP PER SECOND
			if (player.health != player.maxHealth && player.alive)
			{
				player.health = player.health + 1;
			}
			
			//REGENERATES MANA PER SECOND
			if (player.mana != player.maxMana && player.alive)
			{
				player.mana = player.mana + 1;
			}
			
			//CHANGES GAME STATE WHEN LEVEL IS COMPLETE
			/*if (level.event == "Completed")
			{
				changeStates();
			}*/
			
			//ENEMY COLLISIONS
			//FlxG.overlap(enemies, player, player.enemyHitPlayer);
			
			//CHEATS - ADD GOLD
			/*if (FlxG.keys.pressed("P"))
			{
				GameConfig._currentGold += 10000;
				GameConfig._maxGold += 10000;
			}*/
			
			//RESET CURRENT GAME STATE
			if (FlxG.keys.pressed("O"))
			{
				FlxG.resetState();
			}
			
			//SKIP STRAIGHT TO MENU STATE
			if (FlxG.keys.justPressed("ENTER"))
			{
				changeStates();
			}

			//UPDATE TEXT DISPLAYS
			debug.text = "Player current damage: " + playerScore;
			timer.text = "Trigger position: "+triggerPosition;
		
			//eventPhase.text = "Debug mode";
		
			chargeValue.text = "Debug mode";
			enemyHP.text = enemyCurrentHP + "/" + enemyMaxHP;
			playerHP.text = playerCurrentHP + "/" + playerMaxHP;
		
		}
		
		public function triggerPlacement():void
		{
			trigger = new FlxSprite(0, 200, triggerPNG);
			
			if (eventPhase == "Attacking")
			{
				trigger.x = 150;
			}
			else if (eventPhase == "Defending")
			{
				trigger.x = 650;
			}
			
			add(trigger);
		}
		
		//REMOVE THE PLAYSTATE CLASSES AND MOVE TO MENU STATE
		public function changeStates():void
		{
			//GameConfig.saveConfigToData();
			
			remove(player);
			
			//FlxG.switchState(new LevelState);
		}
	}
}