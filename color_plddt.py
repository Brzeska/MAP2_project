from pymol import cmd
cmd.hide("everything")
cmd.show("cartoon")
cmd.color("0xFF7D45","all")
cmd.color("0xFFDB13","b > 50")
cmd.color("0x65CBF3","b > 70")
cmd.color("0x0053D6","b > 90")
