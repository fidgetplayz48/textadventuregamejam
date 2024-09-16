extends Node

var dialogue : Dictionary = {
	"errorchar":"[color=red]Invalid character.[/color]",
	"errorcmd":"[color=red]Invalid command.[/color]",
	"errormove":"[color=red]Illegal move.[/color]",
	"errorview":"[color=red]Cannot execute while [color=#00FFFF]'view'[/color] is enabled.[/color]",
	
	"infoview":"[color=#00FFFF]View toggled.[/color]",
	
	"txt_credits":"A Game made by RubyPiec and Fidgety48",
	"txt_whatEat":"You open your mouth, to get ready to feast on......?",
	"txt_invalidFood":"That doesn't appear to be in this room.", #also used for invalid item
	
	"txt1_intro":"After waking up, you are inside of a room-temperature room, that smells and looks exactly like a room. From this, you conclude that you are in a room.\n\nYou notice that there's something within your [b][color=cyan]view[/color][/b], however, you can't quite make out what it is.",
	"txt1_search":"All you see initially is a pizza on a table, and barricades on the right. however, youre not sure, and believe there's a better way to see whats around you.",
	"txt1_eat":"You ate the pizza that was on the table. You notice the walls to the right of you disappearing, you are now able to move through them.",
	"txt1_eatfail":"There's nothing left to eat.",
	"txt1_examinepizza": "It's a pepperoni pizza. Looks yummy!",
	"txt1_examineempty": "Okay, let's be real here. The only way you could've found this is by finding the code of the game somewhere.",
	
	"txt2_intro": "You enter the second room, there appears to be a sign on the door you just entered from.",
	"txt2_search": "You look around. a sign... like i said. Why is this a room anyway? Why waste so much space of this house on this empty room? All this contains is a door leading back to the place you just came from, and a sign on it. There is no reason for this room to have been built.",
	"txt2_examinesign": "The sign reads: 'My room. NO STEALING'. Uh oh.",
	"txt2_examineletter": "The letter reads: 'Finish my lovely piece. Name it after that first Moon man guy'.",	
	
	"txt3_intro": "You enter the next room. It feels calm. There's a curtain behind you, a fireplace infront of you",
	"txt3_search": "...Whats up with that fireplace?",
	"txt3_examinefurnace": "..!!?? There was a switch under one of the pieces of coal! With a second degree burn, you have opened up the curtain behind you.",
	
	"txt4_intro": "You enter the fourth room. A Painting! How abstract. you notice nothing else.",
	"txt4_search": "Look at that pretty painting! however, there's a barricade behind you, held together by hopes, dreams, and unfinished business",
	"txt4_examinepainting": "The painting has an imprint! : 'wH t .s  m, n mE?'.",
	"txt4_paintingsolve": "Suddenly, the wall behind you opens up! You are finally free, to leave the first row of rooms!",
	
	"txt8_intro": "After entering this room, you notice the letter 'o' exempt from your keyboard.",
	
	"txt9_intro": "Holy shit! an egg! thats an egg! wow! [color=#800080](nothing of use in this room)[/color]",
}
