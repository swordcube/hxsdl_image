package;

import sdl.SDL;
import sdl.Types;
import sdl_image.Image;

class Test {
	static function main() {
		SDL.init(VIDEO | EVENTS);

		var window:Window = SDL.createWindow(
			"SDL Test", 
			WindowPos.CENTERED, WindowPos.CENTERED, 
			1280, 720, 
			RESIZABLE | ALLOW_HIGHDPI
		);
		var renderer:Renderer = SDL.createRenderer(window, -1, ACCELERATED);

		var running:Bool = true;
		var event:Event = SDL.makeEvent(); // workaround function for making an empty pointer

		Image.init(EVERYTHING);

		var tex:Texture = Image.loadTexture(renderer, "assets/suffering.jpg");
		var texSize:Point = SDL.getTextureSize(tex);

		while(running) {
			SDL.pollEvent(event);

			SDL.setRenderDrawColor(renderer, 0, 0, 0, 0);
			SDL.renderClear(renderer);
			
			SDL.renderCopy(renderer, tex, 
				Rectangle.create(0, 0, texSize.x, texSize.y),
				Rectangle.create(30, 30, texSize.x, texSize.y),
			);
			
			SDL.renderPresent(renderer);

			switch(event.ref.type) {
				case QUIT:
					running = false;

				default:
			}
		}

		SDL.destroyRenderer(renderer);
		SDL.destroyWindow(window);
		SDL.quit();
		Image.quit();
	}
}