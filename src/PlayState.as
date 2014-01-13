package  
{
	import flash.display.*;
	import org.flixel.*;
	import org.flixel.FlxG;
	import org.flixel.FlxCamera;

	public class PlayState extends FlxState
	{
		//[Embed(source = '../lib/Stages.swf')] private var backgroundMC:Class;
		
		private var background:FlxSprite;
		
		private var cameraClone:FlxSprite;
		
		//GENERAL TEXT VARS
		private var debug:FlxText;
		
		//CLASS VARIABLES
		public static var player:Player;

		
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
			
			//background = new FlxSprite(0, 0, backgroundPNG);
			//add(background);
			
			//SETS PARAMETERS FOR THE TEXT DISPLAYS
			debug = new FlxText(0, 0, 400, "");
			
			//SETS THE TEXT SCROLL FACTORS TO 0 SO IT IS UNAFFECTED BY CAMERA MOVEMENT
			debug.scrollFactor.x = 0;
			debug.scrollFactor.y = 0;
			
			//INITIALISES CLASSES
			player = new Player;
			
			//ADDS CLASSES TO STATE
			add(player);
			
			//SETS THE CAMERA TO FOLLOW THE PLAYER OBJECT
			FlxG.camera.follow(player, 3);
			
			//ADDS TEXT OBJECTS TO STAGE
			add(debug);
		}
		
		override public function update():void
		{
			super.update();
			
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
			debug.text = "Debug mode";
		
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