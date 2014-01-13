package  
{
	import adobe.utils.CustomActions;
	import org.flixel.*;
	import org.flixel.plugin.funstorm.FlxMovieClip;
	import flash.display.MovieClip;
	import org.flixel.plugin.photonstorm.FlxDelay;
	//import org.flixel.
	


	public class Player extends FlxMovieClip//FlxSprite
	{
		[Embed(source = '../lib/player/player.png')] private var playerPNG:Class;
		
		//private var playerArt:MovieClip;
		
		private var xSpeed:uint = 600;
		private var ySpeed:uint = 600;
		
		public var maxHealth:int = 1000;
		
		public var mana:int = 1000;
		public var maxMana:int = 1000;
		
		private var currentAnimation:String = "PlayerIdle";
		
		private var lastFacing:String = "Left";
		
		public function Player() 
		{
			super((1400 / 2), (770 / 2));
			//currentLevel = 1;
			//playerArt = new Nene;
			//playerArt = new playerPNG;
			
			loadGraphic(playerPNG, false, true, 108, 140, false);
			//loadMovieClip(playerArt , 108, 140, false, false);
			
			health = 1000;
			maxHealth = 1000;
			
			mana = 1000;
			maxMana = 1000;

			//loadEquipment();
		}
		
		override public function update():void
		{
			super.update();
			
			velocity.x = 0;
			velocity.y = 0;
			
			//Bound/Control checks
			if (FlxG.keys.LEFT || FlxG.keys.A)
			{
				velocity.x -= xSpeed;
				
				lastFacing = "Left";
			}
			
			else if (FlxG.keys.RIGHT || FlxG.keys.D)
			{
				velocity.x += xSpeed;
				
				lastFacing = "Right";
			}
			
			if (FlxG.keys.UP || FlxG.keys.W)
			{
				velocity.y -= ySpeed;
			}
			
			else if (FlxG.keys.DOWN || FlxG.keys.S)
			{
				velocity.y += ySpeed;
			}
			
			
			
			//Changing player movement animation
			/*if ((velocity.x < 0)&&(velocity.y == 0)&&(currentAnimation != "playerMovementW"))////
			{
				//changeAnimation("playerMovementW");
				playerArt.gotoAndPlay("playerMovementW");
				currentAnimation = "playerMovementW";
				//trace("Moving West");
			}
			if ((velocity.x > 0)&&(velocity.y == 0)&&(currentAnimation != "playerMovementE"))////
			{
				//changeAnimation("playerMovementE");
				playerArt.gotoAndPlay("playerMovementE");
				currentAnimation = "playerMovementE";
				//trace("Moving East");
			}
			if ((velocity.x == 0)&&(velocity.y < 0)&&(lastFacing=="Left")&&(currentAnimation != "playerMovementNLeft"))////
			{
				//changeAnimation("playerMovementNLeft");
				playerArt.gotoAndPlay("playerMovementNLeft");
				currentAnimation = "playerMovementNLeft";
				//trace("Moving North Left");
			}
			if ((velocity.x == 0)&&(velocity.y < 0)&&(lastFacing=="Right")&&(currentAnimation != "playerMovementNRight"))////
			{
				//changeAnimation("playerMovementNRight");
				playerArt.gotoAndPlay("playerMovementNRight");
				currentAnimation = "playerMovementNRight";
				//trace("Moving North Right");
			}
			if ((velocity.x == 0)&&(velocity.y > 0)&&(lastFacing=="Left")&&(currentAnimation != "playerMovementSLeft"))////
			{
				//changeAnimation("playerMovementSLeft");
				playerArt.gotoAndPlay("playerMovementSLeft");
				currentAnimation = "playerMovementSLeft";
				//trace("Moving South Left");
			}
			if ((velocity.x == 0)&&(velocity.y > 0)&&(lastFacing=="Right")&&(currentAnimation != "playerMovementSRight"))////
			{
				//changeAnimation("playerMovementSRight");
				playerArt.gotoAndPlay("playerMovementSRight");
				currentAnimation = "playerMovementSRight";
				//trace("Moving South Right");
			}
			if ((velocity.x > 0)&&(velocity.y < 0)&&(currentAnimation != "playerMovementNE"))////
			{
				//changeAnimation("playerMovementNE");
				playerArt.gotoAndPlay("playerMovementNE");
				currentAnimation = "playerMovementNE";
				//trace("Moving North");
			}
			if ((velocity.x > 0)&&(velocity.y > 0)&&(currentAnimation != "playerMovementSE"))////
			{
				//changeAnimation("playerMovementSE");
				playerArt.gotoAndPlay("playerMovementSE");
				currentAnimation = "playerMovementSE";
				//trace("Moving South");
			}
			if ((velocity.x < 0)&&(velocity.y < 0)&&(currentAnimation != "playerMovementNW"))////
			{
				//changeAnimation("playerMovementNW");
				playerArt.gotoAndPlay("playerMovementNW");
				currentAnimation = "playerMovementNW";
				//trace("Moving North");
			}
			if ((velocity.x < 0)&&(velocity.y > 0)&&(currentAnimation != "playerMovementSW"))////
			{
				//changeAnimation("playerMovementSW");
				playerArt.gotoAndPlay("playerMovementSW");
				currentAnimation = "playerMovementSW";
				//trace("Moving South");
			}
			if ((velocity.x == 0)&&(velocity.y == 0)&&(currentAnimation != "playerIdleLeft") && (lastFacing == "Left"))////
			{
				//changeAnimation("playerIdleLeft");
				playerArt.gotoAndPlay("playerIdleLeft");
				currentAnimation = "playerIdleLeft";
				//trace("Idle Left");
			}
			if ((velocity.x == 0)&&(velocity.y == 0)&&(currentAnimation != "playerIdleRight") && (lastFacing == "Right"))////
			{
				//changeAnimation("playerIdleRight");
				playerArt.gotoAndPlay("playerIdleRight");
				currentAnimation = "playerIdleRight";
				//trace("Idle Right");
			}*/
				
			
			//Player Level Bounds
			if (x < 10)
			{
				x = 10;
			}
			else if (x > 1400 - width)
			{
				x = 1400 - width;
			}
			if (y < 10)
			{
				y = 10;
			}
			else if (y > 770 - height)
			{
				y = 770 - height;
			}
			
		}
		
		public function enemyHitPlayer(enemy:FlxObject,player:FlxObject):void
		{
			hurt(enemy.damage);
			//enemy.kill();
				
			//FlxG.score -= 10;
		}
		
		/*public function goldHitPlayer(player:FlxObject, bullet:FlxObject):void
		{
			trace("Gold gained");
			GameConfig._currentGold += (bullet.damage * goldModifier);
			
			if (GameConfig._currentGold > GameConfig._maxGold)
			{
				GameConfig._maxGold == GameConfig._currentGold;
			}
			
			FlxG.score += bullet.damage;
			bullet.kill();
		}*/
	}
}