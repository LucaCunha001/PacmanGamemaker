import pyperclip

codigos: list[str] = []

#for codigo in ["DailyMusicWorker.java", "..\\..\\..\\..\\AndroidManifest.xml"]:
#    codigos.append("android\\app\\src\\main\\java\\com\\luca\\loverplayer\\" + codigo)

# codigos.append("objects/obj_pacman/Create_0.gml")
# codigos.append("objects/obj_pacman/Step_0.gml")
codigos.append("objects/obj_power_pellet/Collision_obj_pacman.gml")
codigos.append("objects/obj_game_controller/Step_0.gml")
codigos.append("objects/obj_ghost/Step_0.gml")
codigos.append("objects/obj_ghost/Create_0.gml")
codigos.append("objects/obj_ghost/Draw_0.gml")
# codigos.append("scripts/choose_direction/choose_direction.gml")
# codigos.append("scripts/generate_maze/generate_maze.gml")
# codigos.append("scripts/scr_mov/scr_mov.gml")
# codigos.append("scripts/constantes/constantes.gml")

texto = ""

for codigo in codigos:
    with open(codigo, "r", encoding="utf-8") as f:
        extensao = "/".join(codigo.split("/")[-2:])
        texto += f"```{extensao}\n{f.read()}\n```\n\n"

pyperclip.copy(texto)
