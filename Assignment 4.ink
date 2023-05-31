VAR Courage = 1
VAR Intelligence = 1
VAR Charm = 1
VAR Luck = 1
VAR Stealth = 1
VAR Strength = 1
VAR HermitInteractions = 0


-> start
// Welcome and introduction
== start ==
You find yourself stranded on a mysterious island. There are rumors of a hidden treasure buried deep within the island. Your goal is to find the treasure and escape the island alive.

Your traits:
Courage: {Courage}
Intelligence: {Intelligence}
Charm: {Charm}
Luck: {Luck}
Stealth: {Stealth}
Strength: {Strength}

Suddenly, an old hermit appears. "Tread with caution, young one. This island holds many secrets."
~ HermitInteractions = HermitInteractions + 1

Will you venture into the dark forest or explore the sandy beach?

* [Venture into the dark forest] -> forest_intro
* [Explore the sandy beach] -> beach_intro

// Forest path
== forest_intro ==
// NPC interaction
{
  - HermitInteractions == 1: The Old Hermit appears again, "You're venturing into the heart of the island, be vigilant." 
  - HermitInteractions > 1: The Old Hermit gives you a knowing smile, "Back again in the forest, I see. Maybe you will find what you seek this time." 
}
~ HermitInteractions = HermitInteractions + 1
You enter the dark forest, which seems to be teeming with life. The path before you splits into two directions.

* {Intelligence >= 2} [Use your intelligence to deduce the correct path] -> deduce_path
* [Take the left path] -> forest_left
* [Take the right path] -> forest_right

== deduce_path ==
Using your keen intelligence, you deduce that the right path is more likely to lead to the hidden treasure.

~ Intelligence = Intelligence + 1

* [Follow your deduction and take the right path] -> forest_right
* [Ignore your deduction and take the left path] -> forest_left

// Dialogue Tree 1 - Forest
== forest_left ==
As you walk along the left path, you come across a rickety wooden bridge. There's a deep ravine beneath it.

* {Courage >= 1} [Use your courage to cross the bridge without fear] -> cross_bridge
* [Cross the bridge carefully] -> cross_bridge
* [Turn back and try the right path] -> forest_right

== forest_right ==
You follow the right path and eventually find yourself in a clearing. In the middle, you spot an ancient stone pedestal with a mysterious inscription.

* {Intelligence >= 1} [Use your intelligence to easily decipher the inscription] -> decipher_inscription
* [Try to decipher the inscription] -> decipher_inscription
* [Ignore the pedestal and continue forward] -> deep_forest

== cross_bridge ==
You successfully cross the bridge and find yourself in front of a hidden cave. The cave entrance is partially blocked by a large boulder.

~ Courage = Courage + 1

* {Strength >= 1} [Use your strength to move the boulder] -> hidden_cave
* [Search for a lever to move the boulder] -> find_lever
* [Return to the right path in the forest] -> forest_right

== find_lever ==
You find a hidden lever, and the boulder moves aside, revealing the entrance to the hidden cave.

* [Enter the cave] -> hidden_cave
* [Return to the right path in the forest] -> forest_right

== decipher_inscription ==
You manage to decipher the inscription, which reveals a riddle 
Face the rising sun, and take ten steps toward the heart of the island.

~ Intelligence = Intelligence + 1

* [Follow the riddle's instructions] -> riddle_solution
* [Ignore the riddle and continue forward] -> deep_forest

== deep_forest ==
You delve deeper into the forest, eventually arriving at a massive stone door, covered in vines.

* {Stealth >= 2} [Use your stealth to sneak past the door and avoid any traps] -> stone_door
* [Try to open the stone door] -> stone_door
* [Return to the mysterious inscription] -> decipher_inscription
* [Take the mountain path] -> mountain_path

== hidden_cave ==
Inside the hidden cave, you find a treasure chest!

* {Luck >= 1} [Trust your luck and open the chest without hesitation] -> treasure
* [Examine the chest for traps] -> chest_traps
* [Leave the cave and return to the right path in the forest] -> forest_right


== chest_traps ==
You find a hidden trap on the chest and disarm it.

~ Stealth = Stealth + 1

* [Open the chest] -> treasure
* [Leave the cave and return to the right path in the forest] -> forest_right

== riddle_solution ==
You follow the riddle's instructions and come across a hidden path that leads to the massive stone door.

* [Try to open the stone door] -> stone_door
* [Return to the mysterious inscription] -> decipher_inscription

== stone_door ==
You push the stone door open to reveal the lost treasure! Congratulations, you've found the treasure and completed your quest!

~ Strength = Strength + 1

* [Take the treasure] -> treasure
* [Leave the chamber and return to the forest] -> deep_forest
-> end_game

== treasure ==
You open the chest to reveal the lost treasure! Congratulations, you've found the treasure and completed your quest!

~ Luck = Luck + 1

Your final traits:
Courage: {Courage}
Intelligence: {Intelligence}
Charm: {Charm}
Luck: {Luck}
Stealth: {Stealth}
Strength: {Strength}

-> end_game

// Beach path
== beach_intro ==
// NPC interaction
{
  - HermitInteractions == 1: The Old Hermit is here too, "Ah, the beach, a place of serenity amidst chaos. But remember, not all that glitters is gold." 
  - HermitInteractions > 1: The Old Hermit squints at you, "You're persistent. The beach may seem calm, but dangers lurk beneath the sand."
}
~ HermitInteractions = HermitInteractions + 1
You walk along the sandy beach, which stretches for miles. Up ahead, you see a shipwreck partially buried in the sand.
~ Charm = Charm + 1
* {Luck >= 1} [Rely on your luck to find something valuable in the shipwreck] -> shipwreck_lucky
* [Investigate the shipwreck] -> shipwreck
* [Continue walking along the beach] -> beach_walk

== shipwreck ==
As you explore the shipwreck, you find a tattered map showing a hidden cave in the forest.

* [Head to the forest to find the hidden cave] -> forest_intro
* [Ignore the map and continue walking along the beach] -> beach_walk

== shipwreck_lucky ==
Trusting your luck, you find not only the tattered map but also a compass that points toward the treasure.

~ Luck = Luck + 1

* [Head to the forest to find the hidden cave] -> forest_intro
* [Ignore the map and compass and continue walking along the beach] -> beach_walk

== beach_walk ==
After walking for some time, you come across a group of island inhabitants.
~ Charm = Charm + 1
* {Charm >= 2} [Use your charm to befriend the island inhabitants] -> island_inhabitants_help
* [Ask them for help] -> island_inhabitants_help
* [Ignore the island inhabitants and keep walking] -> beach_end

// Dialogue Tree 2 - Mountain Path
== mountain_path ==
You come across a steep mountain path that seems to lead to the peak. The path is treacherous, and it looks like it will require great strength and courage to climb.
~ Strength = Strength + 1
* {Courage >= 1} [Use your courage to start climbing the mountain] -> mountain_climb
* [Search for an alternate route] -> alternate_route
* [Proceed recklessly despite the danger] -> beast_fight
* [Return to the deep forest] -> deep_forest


== mountain_climb ==
As you climb, you come across a narrow ledge with a beautiful view of the island. A strong gust of wind threatens to knock you off balance.
~ Strength = Strength + 1
* {Strength >= 3} [Use your strength to steady yourself] -> steady_yourself
* [Hold on tight and wait for the wind to die down] -> wait_wind
* [Turn back and search for an alternate route] -> alternate_route

== steady_yourself ==
You use your strength to steady yourself, successfully crossing the narrow ledge. As you continue to climb, you encounter a cave entrance guarded by a fierce, talking beast.
~ Stealth = Stealth + 1
* {Charm >= 1} [Use your charm to persuade the beast to let you pass] -> beast_persuaded
* [Fight the beast] -> beast_fight
* [Turn back and search for an alternate route] -> alternate_route

== wait_wind ==
You hold on tight and wait for the wind to die down. Once it's safe, you continue your climb and eventually reach the cave entrance guarded by the talking beast.
~ Courage = Courage + 1
* {Charm >= 1} [Use your charm to persuade the beast to let you pass] -> beast_persuaded
* [Fight the beast] -> beast_fight
* [Turn back and search for an alternate route] -> alternate_route

== beast_persuaded ==
The beast, impressed by your charm, allows you to pass. Inside the cave, you find another treasure chest!
~ Intelligence = Intelligence + 1
* {Luck >= 2} [Trust your luck and open the chest without hesitation] -> treasure
* [Examine the chest for traps] -> chest_traps
* [Leave the cave and return to the mountain path] -> mountain_path

== beast_fight ==
You engage in a fierce battle with the beast. After a long struggle, you emerge victorious.

* {Intelligence >= 2} [Use your intelligence to search the beast's lair for clues] -> beast_lair_clues
* [Enter the cave] -> hidden_cave
* [Leave the lair and return to the mountain path] -> mountain_path

== beast_lair_clues ==
You find a hidden compartment in the beast's lair, containing a key to the treasure chest.

* [Use the key to open the chest] -> treasure
* [Leave the lair and return to the mountain path] -> mountain_path

== alternate_route ==
You search for an alternate route and stumble upon a hidden passage that leads directly to the stone door.

* [Try to open the stone door] -> stone_door
* [Return to the deep forest] -> deep_forest

// Dialogue Tree 3 - Island Inhabitants
== island_inhabitants_help ==
The island inhabitants share their knowledge about the hidden treasure. They tell you about the riddle on the ancient stone pedestal in the forest.

* {Stealth >= 3} [Use your stealth to sneak past them and follow their directions] -> forest_intro
* [Thank them and head to the forest] -> forest_intro
* [Ignore their advice and continue walking along the beach] -> beach_end
* [Offer to help them with a task in exchange for more information] -> island_task

== island_task ==
The island inhabitants ask you to help them gather fruit from a tall tree.

* {Strength >= 1} [Use your strength to climb the tree and gather fruit] -> task_success
* [Attempt to climb the tree] -> task_failure
* [Ask if there's another way to help them] -> alternate_task
* [Decline and continue walking along the beach] -> beach_end

== task_success ==
You successfully gather the fruit, and the island inhabitants share more information about the treasure. They tell you about the hidden cave in the forest and give you a key that might be useful.

~ Strength = Strength + 1

* [Thank them and head to the forest] -> forest_intro
* [Ignore their advice and continue walking along the beach] -> beach_end

== beach_end ==
You continue walking along the beach, but you don't find anything that leads to the treasure. Eventually, you decide to return to the forest.

~ Stealth = Stealth + 1
-> forest_intro

== task_failure ==
You struggle to climb the tree and gather the fruit. The island inhabitants are disappointed and decide not to help you any further.

* [Apologize and continue walking along the beach] -> beach_end
* [Ask if you can make up for it with a different task] -> make_up_task
* [Head to the forest] -> forest_intro

== alternate_task ==
The island inhabitants agree to let you help them by catching fish from the nearby river instead.

* {Luck >= 2} [Try your luck at fishing] -> fish_success
* [Attempt to fish without luck] -> fish_failure
* [Decline and continue walking along the beach] -> beach_end

== fish_success ==
You manage to catch a decent amount of fish, pleasing the island inhabitants. They thank you and share more detailed directions to the forest.

~ Luck = Luck + 1

* [Thank them and head to the forest] -> forest_intro
* [Ignore their advice and continue walking along the beach] -> beach_end

== fish_failure ==
Despite your best efforts, you can't catch any fish. The island inhabitants decide not to help you any further.

* [Apologize and continue walking along the beach] -> beach_end
* [Head to the forest] -> forest_intro

== make_up_task ==
The island inhabitants accept your apology and give you another chance. They ask you to repair one of their damaged huts.

* {Intelligence >= 2} [Use your intelligence to effectively repair the hut] -> repair_success
* [Attempt to repair the hut] -> repair_failure
* [Decline and continue walking along the beach] -> beach_end

== repair_success ==
Your intelligence proves useful as you manage to repair the hut. Grateful, the inhabitants share a map leading to the forest's hidden cave.

~ Intelligence = Intelligence + 1

* [Thank them and head to the forest] -> forest_intro
* [Ignore their advice and continue walking along the beach] -> beach_end

== repair_failure ==
Despite your efforts, you aren't able to fix the hut. The island inhabitants don't offer any more help.

* [Apologize and continue walking along the beach] -> beach_end
* [Head to the forest] -> forest_intro

== end_game ==
{
  - HermitInteractions <= 3: The Old Hermit appears once more, "Well done, young one. You've navigated the island's secrets and come out victorious."
  - HermitInteractions > 3: The Old Hermit chuckles, "You certainly love our little chats, don't you? Nonetheless, you've done well. The island has tested you, and you've prevailed."
}

Your final traits:
Courage: {Courage}
Intelligence: {Intelligence}
Charm: {Charm}
Luck: {Luck}
Stealth: {Stealth}
Strength: {Strength} 

* [Restart the game] -> start
-> DONE