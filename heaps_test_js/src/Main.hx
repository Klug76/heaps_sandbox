package;

import h2d.Bitmap;
import haxe.ui.backend.heaps.HeapsApp;
import haxe.ui.components.Label;
import hxd.App;

import haxe.ui.Toolkit;
import haxe.ui.components.Button;
import haxe.ui.containers.VBox;
import haxe.ui.core.Screen;

class Main
{
	static var b: Bitmap;

	static function main()
	{
		hxd.Res.initEmbed();
		var app:HeapsApp = HeapsApp.getInstance();
		app.engine.backgroundColor = 0xffFFff;
		app.onInitialized = function()
		{
			trace("ENTER init");
			Toolkit.init();
			Screen.instance.init();
			onReady();
			trace("LEAVE init");
		};
	}

	static function onReady()
	{
		//trace("1");

		var main = new VBox();

		//var al: Label = new Label();
		//al.text = "foo";
		//main.addComponent(al);

		var button1 = new Button();
		button1.text = "Button 1";//!!!!!!!!!!!!crash
		main.addComponent(button1);

		Screen.instance.addComponent(main);

		//b = new h2d.Bitmap(h2d.Tile.fromColor(0xff0000, 128, 128));
		var tex = hxd.Res.hxlogo.toTexture();
		b = new h2d.Bitmap(h2d.Tile.fromTexture(tex));
		b.x = 150;
		b.y = 100;
		b.tile = b.tile.center();
		b.rotation = Math.PI / 4;

		HeapsApp.getInstance().s2d.addChildAt(b, 0);


		/*
		var main:Component = ComponentMacros.buildComponent("assets/ui/main.xml");
		Screen.instance.addComponent(main);

		var button:Button = main.findComponent("testButton2", null, true);
		button.onClick = function(e)
		{
			button.text = "Set from code!";
		}
		*/
		//trace("1_");
	}

	//override function update(dt:Float)
	//{
		//b.rotation += 0.01;
	//}

}
